#!/usr/bin/env python3

import argparse
import os
from os import path

from hspeak_ast import AST_state
import hspeak_post
import hspeak_hs

# command line options
main_args = None

include_once = None

def parse_hss(fn, cpass):

    if fn in include_once:
        return

    include_once.add(fn)

    fd = open(fn, "r")

    # current section
    csection = None

    # current script name
    cname = None

    # current script buffer
    cbuffer = None

    # current line number
    cline = 0

    for line in fd:

        # remove comment
        i = line.find("#")
        if i > -1:
            line = line[:i]

        line = line.strip()
        cline += 1

        # skip empty lines
        if not line:
            continue

        if csection == "script":

            if line == "end":

                if cpass == 2:

                    # attempt to compile the script body

                    print("---- script ---- %s ---- %s ---- %d" % (cname, fn, cline))

                    if AST_state.build(cbuffer, cname):

                        data = hspeak_post.compile()
                        hspeak_hs.write_hsz(data)

                        if main_args.d:
                            AST_state.print()

                        print(
                            "toHSZ:", len(data),
                            "locals:", len(AST_state.locals),
                            "strings:", len(AST_state.strings)
                        )

                    else:
                        print(AST_state.error)

                csection = None
                cname = None
                cbuffer = None
                continue

            if cpass == 1:
                continue

            if cbuffer:
                cbuffer += ",\n" + line
            else:
                cbuffer = line

            continue

        if csection == "defineconstant":

            if line == "end":
                csection = None
                continue

            if cpass == 2:
                continue

            if not AST_state.build(line):
                print("---> in %s %d" % (fn, cline))
                print(AST_state.error)
                continue

            nodes = AST_state.root.children

            AST_state._constants[nodes[1].leaf] = \
                nodes[0].leaf

            continue

        if csection == "definefunction":

            if line == "end":
                csection = None
                continue

            if cpass == 2:
                continue

            if not AST_state.build(line):
                print("---> in %s %d" % (fn, cline))
                print(AST_state.error)
                continue

            nodes = AST_state.root.children

            AST_state.alloc_function(
                nodes[1].leaf, nodes[0].leaf,
                nodes[2].leaf, nodes[3:]
            )

            continue

        if csection == "definetrigger":

            # skip this section

            if line == "end":
                csection = None
                continue

            continue

        if csection == "defineoperator":

            # skip this section

            if line == "end":
                csection = None
                continue

            continue

        # -- not in any section --

        if not AST_state.build(line):
            print("---> in %s %d" % (fn, cline))
            print(AST_state.error)
            continue

        nodes = AST_state.root.children

        # list-like section headers outside of scripts
        if nodes[0].type == "value":

            if nodes[0].leaf == "include":
                parse_hss(nodes[1].leaf, cpass)
                continue

            # script and plotscript
            if nodes[0].leaf in AST_state.triggers:

                # register the script
                if cpass == 1:

                    _args = nodes[2:-1]

                    AST_state.alloc_script(
                        nodes[1].leaf,
                        AST_state.triggers[nodes[0].leaf],
                        len(_args), _args
                    )

                # initialize local scope
                elif cpass == 2:

                    AST_state.reset_locals()

                    for node in nodes[2:-1]:
                        AST_state.alloc_local(node.leaf)

                csection = "script"
                cname = nodes[1].leaf
                continue

            if nodes[0].leaf == "defineconstant":
                csection = "defineconstant"
                continue

            if nodes[0].leaf == "definefunction":
                csection = "definefunction"
                continue

            if nodes[0].leaf == "definetrigger":
                csection = "definetrigger"
                continue

            if nodes[0].leaf == "defineoperator":
                csection = "defineoperator"
                continue

            continue

        # function-like definitions outside of scripts
        if cpass == 1 and nodes[0].type == "function":

            args = AST_state.root.children[0].children

            if nodes[0].leaf == "defineconstant":
                AST_state._constants[args[1].leaf] = \
                    args[0].leaf
                continue

            if nodes[0].leaf == "globalvariable":
                AST_state.globals[args[1].leaf] = \
                    args[0].leaf
                continue

            continue

# --

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description = "HSpeak compiler")
    parser.add_argument("-d", type = int, default = 0, help = "Debug")
    parser.add_argument("hss", type = str, help = "Input hss file name")
    main_args = parser.parse_args()

    fn = main_args.hss

    # remove extension
    i = fn.rfind(".")
    if i > -1:
        fn = fn[:i]

    if not path.isfile(main_args.hss):
        print(main_args.hss, "not found")
        exit()

    hspeak_hs.hs_fn = fn + ".hs"
    hspeak_hs.hs_cache = fn + ".cache"
    hspeak_hs.hs_begin()

    include_once = set()
    parse_hss(main_args.hss, 1)

    include_once = set()
    parse_hss(main_args.hss, 2)

    hspeak_hs.hs_end()
