'OHRRPGCE - menustuf.bi
'(C) Copyright 1997-2006 James Paige and Hamster Republic Productions
'Please read LICENSE.txt for GPL License details and disclaimer of liability
'See README.txt for code docs and apologies for crappyness of this code ;)
'Auto-generated by MAKEBI from menustuf.bas

#IFNDEF MENUSTUF_BI
#DEFINE MENUSTUF_BI

declare sub buystuff (id, shoptype, storebuf(), stock(), stat())
declare sub doequip (toequip, who, where, defwep, stat())
declare sub equip (pt, stat())
declare sub getitem (getit, num)
declare sub itemmenuswap (invent() as inventslot, iuse(), permask(), i, o)
declare function items (stat())
declare sub itstr (i)
declare sub loadtemppage (page)
declare sub oobcure (w, t, atk, spred, stat())
declare sub patcharray (array(), n$, max)
declare function picksave (loading)
declare function rpad$ (s$, pad$, size)
declare sub savetemppage (page)
declare sub sellstuff (id, storebuf(), stock(), stat())
declare sub spells (pt, stat())
declare sub status (pt, stat())
declare function trylearn (who, atk, learntype)
declare sub unequip (who, where, defwep, stat(), resetdw)
declare sub loadshopstuf (array(), id)

#ENDIF
