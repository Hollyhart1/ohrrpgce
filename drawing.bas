DECLARE SUB standardmenu (menu$(), size%, vis%, ptr%, top%, x%, y%, dpage%)
DECLARE SUB xbload (f$, array%(), e$)
'$DYNAMIC
DEFINT A-Z
'basic subs and functions
DECLARE FUNCTION scriptname$ (num%, f$, gen%(), buffer%())
DECLARE SUB airbrush (x%, y%, d%, m%, c%, p%)
DECLARE SUB ellipse (x%, y%, radius%, c%, p%, squish1%, squish2%)
DECLARE SUB cropafter (index%, limit%, flushafter%, lump$, buffer%(), bytes%, game$, timing%())
DECLARE FUNCTION needaddset (ptr%, check%, what$, vpage%, dpage%, timing%())
DECLARE FUNCTION rotascii$ (s$, o%)
DECLARE SUB writescatter (s$, lhold%, array%(), start%)
DECLARE SUB readscatter (s$, lhold%, array%(), start%)
DECLARE FUNCTION browse$ (special, default$, fmask$, dpage%, vpage%, buffer%(), timing%(), tmp$)
DECLARE SUB cycletile (cycle%(), tastuf%(), ptr%(), skip%())
DECLARE SUB testanimpattern (tastuf%(), taset%, timing%(), vpage%, dpage%, buffer%())
DECLARE FUNCTION usemenu (ptr%, top%, first%, last%, size%)
DECLARE FUNCTION onoroff$ (n%)
DECLARE FUNCTION bound% (n%, lowest%, highest%)
DECLARE SUB debug (s$)
DECLARE SUB setanimpattern (tastuf%(), taset%, timing%(), vpage%, dpage%, game$)
DECLARE FUNCTION intstr$ (n%)
DECLARE SUB loadtanim (n%, tastuf%(), game$)
DECLARE SUB savetanim (n%, tastuf%(), game$)
DECLARE FUNCTION lmnemonic$ (index%, game$)
DECLARE FUNCTION heroname$ (num%, cond%(), a%(), game$)
DECLARE SUB bitset (array%(), wof%, last%, name$(), timing%(), vpage%, dpage%)
DECLARE FUNCTION mouseover% (mouse%(), zox%, zoy%, zcsr%, area%())
DECLARE FUNCTION intgrabber (n%, min%, max%, less%, more%)
DECLARE SUB strgrabber (s$, maxl%, keyv%())
DECLARE SUB edgeprint (s$, x%, y%, c%, p%)
DECLARE SUB formation (game$, timing%(), general%(), pal%(), buffer%(), song$())
DECLARE SUB importbmp (buffer%(), game$, timing%(), general%(), keyv%(), master%())
DECLARE SUB enemydata (game$, timing%(), general%(), pal%(), buffer%(), keyv%(), con$())
DECLARE SUB herodata (game$, timing%(), general%(), pal%(), buffer%(), keyv%(), con$())
DECLARE SUB attackdata (game$, atkdat$(), atklim%(), timing%(), general%(), pal%(), buffer%(), con$(), keyv%())
DECLARE SUB getnames (game$, stat$(), max%)
DECLARE SUB statname (game$, timing%(), general%(), name$(), keyv%())
DECLARE SUB textage (game$, timing%(), general%(), keyv(), buffer(), song$())
DECLARE FUNCTION sublist% (num%, s$(), timing%())
DECLARE SUB maptile (game$, master%(), buffer%(), timing%(), font(), general())
DECLARE FUNCTION small% (n1%, n2%)
DECLARE FUNCTION large% (n1%, n2%)
DECLARE FUNCTION loopvar% (var%, min%, max%, inc%)
'assembly subs and functions
DECLARE SUB setmodeX ()
DECLARE SUB setpicstuf (buf(), BYVAL b, BYVAL p)
DECLARE SUB loadset (fil$, BYVAL i, BYVAL l)
DECLARE SUB storeset (fil$, BYVAL i, BYVAL l)
DECLARE SUB copypage (BYVAL page1, BYVAL page2)
DECLARE SUB setvispage (BYVAL page)
DECLARE SUB drawsprite (pic(), BYVAL picoff, pal(), BYVAL po, BYVAL x, BYVAL y, BYVAL page)
DECLARE SUB wardsprite (pic(), BYVAL picoff, pal(), BYVAL po, BYVAL x, BYVAL y, BYVAL page)
DECLARE SUB getsprite (pic(), BYVAL picoff, BYVAL x, BYVAL y, BYVAL w, BYVAL h, BYVAL page)
DECLARE SUB loadsprite (pic(), BYVAL picoff, BYVAL x, BYVAL y, BYVAL w, BYVAL h, BYVAL page)
DECLARE SUB stosprite (pic(), BYVAL picoff, BYVAL x, BYVAL y, BYVAL page)
DECLARE SUB bigsprite (pic(), pal(), BYVAL p, BYVAL x, BYVAL y, BYVAL page)
DECLARE SUB hugesprite (pic(), pal(), BYVAL p, BYVAL x, BYVAL y, BYVAL page)
DECLARE SUB setdiskpages (buf(), BYVAL h, BYVAL l)
DECLARE SUB loadpage (fil$, BYVAL i, BYVAL p)
DECLARE SUB storepage (fil$, BYVAL i, BYVAL p)
DECLARE SUB bitmap2page (temp(), bmp$, BYVAL p)
DECLARE SUB loadbmp (f$, BYVAL x, BYVAL y, buf(), BYVAL p)
DECLARE SUB getbmppal (f$, mpal(), pal(), BYVAL o)
DECLARE FUNCTION bmpinfo (f$, dat())
DECLARE SUB setpal (pal())
DECLARE SUB clearpage (BYVAL page)
DECLARE SUB setkeys ()
DECLARE SUB setfont (f())
DECLARE SUB printstr (s$, BYVAL x, BYVAL y, BYVAL p)
DECLARE SUB textcolor (BYVAL f, BYVAL b)
DECLARE SUB setitup (fil$, buff(), tbuff(), BYVAL p)
DECLARE FUNCTION resetdsp
DECLARE SUB playsnd (BYVAL n, BYVAL f)
DECLARE SUB closefile
DECLARE SUB fuzzyrect (BYVAL x, BYVAL y, BYVAL w, BYVAL h, BYVAL c, BYVAL p)
DECLARE SUB rectangle (BYVAL x, BYVAL y, BYVAL w, BYVAL h, BYVAL c, BYVAL p)
DECLARE SUB drawline (BYVAL x1, BYVAL y1, BYVAL x2, BYVAL y2, BYVAL c, BYVAL p)
DECLARE SUB paintat (BYVAL x, BYVAL y, BYVAL c, BYVAL page, buf(), BYVAL max)
DECLARE SUB setwait (b(), BYVAL t)
DECLARE SUB dowait ()
DECLARE SUB setmapdata (array(), pas(), BYVAL t, BYVAL b)
DECLARE SUB setmapblock (BYVAL x, BYVAL y, BYVAL v)
DECLARE FUNCTION readmapblock (BYVAL x, BYVAL y)
DECLARE SUB drawmap (BYVAL x, BYVAL y, BYVAL t, BYVAL p)
DECLARE SUB setanim (BYVAL cycle1, BYVAL cycle2)
DECLARE FUNCTION readpixel (BYVAL x, BYVAL y, BYVAL p)
DECLARE SUB setbit (b(), BYVAL w, BYVAL b, BYVAL v)
DECLARE FUNCTION readbit (b(), BYVAL w, BYVAL b)
DECLARE FUNCTION Keyseg ()
DECLARE FUNCTION keyoff ()
DECLARE FUNCTION keyval (BYVAL a)
DECLARE FUNCTION getkey ()
DECLARE SUB copyfile (s$, d$, buf())
DECLARE SUB findfiles (fmask$, BYVAL attrib, outfile$, buf())
DECLARE SUB setupmusic (mbuf())
DECLARE SUB closemusic ()
DECLARE SUB stopsong ()
DECLARE SUB resumesong ()
DECLARE SUB resetfm ()
DECLARE SUB loadsong (f$)
'DECLARE SUB fademusic (BYVAL vol)
DECLARE FUNCTION getfmvol ()
DECLARE SUB setfmvol (BYVAL vol)
DECLARE FUNCTION setmouse (mbuf())
DECLARE SUB readmouse (mbuf())
DECLARE SUB movemouse (BYVAL x, BYVAL y)
DECLARE SUB array2str (arr(), BYVAL o, s$)
DECLARE SUB str2array (s$, arr(), BYVAL o)
DECLARE FUNCTION isfile (n$)

REM $STATIC
SUB gendata (game$, general(), timing(), buffer(), song$(), keyv())
DIM m$(14), max(11), bit$(15), subm$(3)
dpage = 1: vpage = 0

last = 14
m$(0) = "Return to Main Menu"
m$(1) = "Preference Bitsets..."
m$(9) = "Pick Title Screen..."
m$(10) = "Rename Game..."
m$(12) = "Special PlotScripts..."
max(1) = 1
max(2) = 320
max(3) = 200
max(4) = general(0)
max(5) = 100
max(6) = 100
max(7) = 100
max(8) = 0
max(11) = 32000
GOSUB loadpass
GOSUB genstr
setkeys
DO
setwait timing(), 100
setkeys
tog = tog XOR 1
IF keyval(1) > 1 THEN GOTO donegen
IF keyval(72) > 1 AND csr > 0 THEN csr = csr - 1
IF keyval(80) > 1 AND csr < last THEN csr = csr + 1
IF (keyval(28) > 1 OR keyval(57) > 1) THEN
 IF csr = 0 THEN GOTO donegen
 IF csr = 1 THEN
  bit$(0) = "Dont Pause on Menus"
  bit$(1) = "Enable Caterpillar Party"
  bit$(2) = "Dont Restore HP on Levelup"
  bit$(3) = "Dont Restore MP on Levelup"
  bit$(4) = "Inns Dont Revive Dead Heros"
  bit$(5) = "Hero Swapping Always Available"
  bitset general(), 101, 5, bit$(), timing(), vpage, dpage
 END IF
 IF csr = 9 THEN GOSUB ttlbrowse
 IF csr = 10 THEN GOSUB renrpg
 IF csr = 12 THEN GOSUB specialplot
END IF
IF csr > 1 AND csr <= 4 THEN
 IF intgrabber(general(100 + csr), 0, max(csr), 75, 77) THEN GOSUB genstr
END IF
IF csr > 4 AND csr < 8 THEN
 IF intgrabber(general(csr - 3), 0, max(csr), 75, 77) THEN GOSUB genstr
END IF
IF csr = 8 THEN
 strgrabber pas$, 17, keyv()
 GOSUB genstr
END IF
IF csr = 11 THEN
 IF intgrabber(general(96), 0, max(csr), 75, 77) THEN GOSUB genstr
END IF
IF csr = 13 THEN
 strgrabber longname$, 38, keyv()
 GOSUB genstr
END IF
IF csr = 14 THEN
 strgrabber aboutline$, 38, keyv()
 GOSUB genstr
END IF

standardmenu m$(), last, 22, csr, 0, 0, 0, dpage
'FOR i = 0 TO last
' textcolor 7, 0
' IF csr = i THEN textcolor 14 + tog, 0
' printstr m$(i), 0, i * 8, dpage
'NEXT i

SWAP vpage, dpage
setvispage vpage
clearpage dpage
dowait
LOOP

genstr:
'IF general(101) = 0 THEN m$(1) = "Active Menu Mode" ELSE m$(1) = "Wait Menu Mode"
m$(2) = "Starting X" + STR$(general(102))
m$(3) = "Starting Y" + STR$(general(103))
m$(4) = "Starting Map" + STR$(general(104))
m$(5) = "Title Music:"
IF general(2) = 0 THEN m$(5) = m$(5) + " -none-" ELSE m$(5) = m$(5) + STR$(general(2) - 1) + " " + song$(general(2) - 1)
m$(6) = "Battle Victory Music:"
IF general(3) = 0 THEN m$(6) = m$(6) + " -none-" ELSE m$(6) = m$(6) + STR$(general(3) - 1) + " " + song$(general(3) - 1)
m$(7) = "Default Battle Music:"
IF general(4) = 0 THEN m$(7) = m$(7) + " -none-" ELSE m$(7) = m$(7) + STR$(general(4) - 1) + " " + song$(general(4) - 1)
m$(8) = "Password For Editing [" + pas$ + "]"
m$(11) = "Starting Money:" + STR$(general(96))
m$(13) = "Long Name:" + longname$
m$(14) = "About Line:" + aboutline$
RETURN

ttlbrowse:
setdiskpages buffer(), 200, 0
GOSUB gshowpage
setkeys
DO
setwait timing(), 100
setkeys
tog = tog XOR 1
IF keyval(1) > 1 THEN RETURN
IF keyval(72) > 1 AND gcsr = 1 THEN gcsr = 0
IF keyval(80) > 1 AND gcsr = 0 THEN gcsr = 1
IF gcsr = 1 THEN
 IF intgrabber(general(1), 0, general(100) - 1, 75, 77) THEN GOSUB gshowpage
END IF
IF keyval(57) > 1 OR keyval(28) > 1 THEN
 IF gcsr = 0 THEN RETURN
END IF
col = 7: IF gcsr = 0 THEN col = 14 + tog
edgeprint "Go Back", 1, 1, col, dpage
col = 7: IF gcsr = 1 THEN col = 14 + tog
edgeprint CHR$(27) + "Browse" + CHR$(26), 1, 11, col, dpage
SWAP vpage, dpage
setvispage vpage
copypage 2, dpage
dowait
LOOP

gshowpage:
loadpage game$ + ".mxs" + CHR$(0), general(1), 2
RETURN

loadpass:
 readscatter pas$, general(94), general(), 200
 pas$ = rotascii(pas$, general(93) * -1)
 IF isfile("working.tmp\browse.txt" + CHR$(0)) THEN
  setpicstuf buffer(), 40, -1
  loadset "working.tmp\browse.txt" + CHR$(0), 0, 0
  longname$ = STRING$(bound(buffer(0), 0, 38), " ")
  array2str buffer(), 2, longname$
  loadset "working.tmp\browse.txt" + CHR$(0), 1, 0
  aboutline$ = STRING$(bound(buffer(0), 0, 38), " ")
  array2str buffer(), 2, aboutline$
 END IF
RETURN

savepass:
 general(93) = INT(RND * 250) + 1
 pas$ = rotascii(pas$, general(93))
 writescatter pas$, general(94), general(), 200
 '--write long name and about line
 setpicstuf buffer(), 40, -1
 buffer(0) = bound(LEN(longname$), 0, 38)
 str2array longname$, buffer(), 2
 storeset "working.tmp\browse.txt" + CHR$(0), 0, 0
 buffer(0) = bound(LEN(aboutline$), 0, 38)
 str2array aboutline$, buffer(), 2
 storeset "working.tmp\browse.txt" + CHR$(0), 1, 0
RETURN

renrpg:
oldgame$ = RIGHT$(game$, LEN(game$) - 12)
newgame$ = oldgame$
setkeys
DO
setwait timing(), 100
setkeys
tog = tog XOR 1
IF keyval(1) > 1 THEN RETURN
strgrabber newgame$, 8, keyv()
IF LEN(newgame$) > 0 THEN
 IF RIGHT$(newgame$, 1) = " " THEN newgame$ = LEFT$(newgame$, LEN(newgame$) - 1) + "_"
 IF ASC(RIGHT$(newgame$, 1)) < 48 THEN newgame$ = LEFT$(newgame$, LEN(newgame$) - 1)
 IF ASC(RIGHT$(newgame$, 1)) > 57 AND ASC(RIGHT$(newgame$, 1)) < 65 THEN newgame$ = LEFT$(newgame$, LEN(newgame$) - 1)
 IF ASC(RIGHT$(newgame$, 1)) > 90 AND ASC(RIGHT$(newgame$, 1)) < 94 THEN newgame$ = LEFT$(newgame$, LEN(newgame$) - 1)
 IF ASC(RIGHT$(newgame$, 1)) = 96 OR ASC(RIGHT$(newgame$, 1)) > 122 THEN newgame$ = LEFT$(newgame$, LEN(newgame$) - 1)
END IF
IF keyval(28) > 1 THEN
 IF oldgame$ <> newgame$ AND newgame$ <> "" THEN
  findfiles newgame$ + ".rpg" + CHR$(0), 32, "temp.lst" + CHR$(0), buffer()
  OPEN "temp.lst" FOR APPEND AS #1
   WRITE #1, "-END OF LIST-"
  CLOSE #1
  OPEN "temp.lst" FOR INPUT AS #1
   INPUT #1, check$
  CLOSE #1
  KILL "temp.lst"
  IF check$ = "-END OF LIST-" THEN
   textcolor 10, 0
   printstr "Finding files...", 0, 30, vpage
   findfiles "working.tmp\" + oldgame$ + ".*" + CHR$(0), 32, "temp.lst" + CHR$(0), buffer()
   OPEN "temp.lst" FOR APPEND AS #1
    WRITE #1, "-END OF LIST-"
   CLOSE #1
   OPEN "temp.lst" FOR INPUT AS #1
    textcolor 10, 0
    printstr "Renaming Lumps...", 0, 40, vpage
    textcolor 15, 2
    DO
     INPUT #1, temp$
     IF temp$ = "-END OF LIST-" THEN EXIT DO
     IF LCASE$(temp$) <> "plotscr.lst" AND LCASE$(temp$) <> "browse.txt" THEN
      printstr " " + RIGHT$(temp$, LEN(temp$) - LEN(oldgame$)) + " ", 0, 50, vpage
      copyfile "working.tmp\" + temp$ + CHR$(0), "working.tmp\" + newgame$ + RIGHT$(temp$, LEN(temp$) - LEN(oldgame$)) + CHR$(0), buffer()
      KILL "working.tmp\" + temp$
     END IF
    LOOP
   CLOSE #1
   KILL "temp.lst"
   game$ = "working.tmp\" + newgame$
  ELSE '---IN CASE FILE EXISTS
   edgeprint newgame$ + " Already Exists. Cannot Rename.", 0, 30, 15, vpage
   w = getkey
  END IF '---END IF OKAY TO COPY
 END IF '---END IF VALID NEW ENTRY
 RETURN
END IF
textcolor 7, 0
printstr "Current Name: " + oldgame$, 0, 0, dpage
printstr "Type New Name and press ENTER", 0, 10, dpage
textcolor 14 + tog, 2
printstr newgame$, 0, 20, dpage
SWAP vpage, dpage
setvispage vpage
clearpage dpage
dowait
LOOP

specialplot:
subcsr = 0
subm$(0) = "Previous Menu"
subm$(1) = "new-game script: " + scriptname$(general(41), "plotscr.lst", general(), buffer())
subm$(2) = "game-over script: " + scriptname$(general(42), "plotscr.lst", general(), buffer())
setkeys
DO
 setwait timing(), 100
 setkeys
 tog = tog XOR 1
 IF keyval(1) > 1 THEN RETURN
 IF keyval(72) > 1 THEN subcsr = loopvar(subcsr, 0, 2, -1)
 IF keyval(80) > 1 THEN subcsr = loopvar(subcsr, 0, 2, 1)
 SELECT CASE subcsr
 CASE 0
  IF keyval(57) > 1 OR keyval(28) > 1 THEN EXIT DO
 CASE 1, 2
  IF intgrabber(general(40 + subcsr), 0, general(43), 75, 77) THEN
   subm$(1) = "new-game script: " + scriptname$(general(41), "plotscr.lst", general(), buffer())
   subm$(2) = "game-over script: " + scriptname$(general(42), "plotscr.lst", general(), buffer())
  END IF
 END SELECT
 FOR i = 0 TO 2
  col = 7: IF subcsr = i THEN col = 14 + tog
  textcolor col, 0
  printstr subm$(i), 0, i * 8, dpage
 NEXT i
 SWAP vpage, dpage
 setvispage vpage
 clearpage dpage
 dowait
LOOP
RETURN

donegen:
GOSUB savepass
clearpage 0
clearpage 1
clearpage 2
clearpage 3
END SUB

SUB importbmp (buffer(), game$, timing(), general(), keyv(), master())
STATIC default$
DIM menu$(10), bmp$(500), pmask(767)

IF general(100) = 0 THEN general(100) = 1
clearpage 0
clearpage 1
clearpage 2
clearpage 3
dpage = 0: vpage = 1
menu$(0) = "Return to Main Menu"
menu$(1) = CHR$(27) + "Browse" + STR$(ptr) + CHR$(26)
menu$(2) = "Replace current screen"
menu$(3) = "Append a new screen"
menu$(4) = "Disable palette colors"
GOSUB resetpal
setdiskpages buffer(), 200, 0
GOSUB showpage
setkeys
DO
setwait timing(), 100
setkeys
tog = tog XOR 1
IF keyval(29) > 0 AND keyval(14) > 1 THEN
 this = general(100) - 1
 cropafter ptr, this, 3, ".mxs", buffer(), -1, game$, timing()
 general(100) = this + 1
END IF
IF keyval(1) > 1 THEN GOTO donebmp
IF keyval(72) > 1 THEN csr = large(csr - 1, 0)
IF keyval(80) > 1 THEN csr = small(csr + 1, 4)
IF csr = 1 THEN
 IF intgrabber(ptr, 0, general(100) - 1, 75, 77) THEN
  menu$(1) = CHR$(27) + "Browse" + STR$(ptr) + CHR$(26)
  GOSUB showpage
 END IF
END IF
IF keyval(57) > 1 OR keyval(28) > 1 THEN
 IF csr = 0 THEN GOTO donebmp
 IF csr = 2 THEN
  at = ptr
  srcbmp$ = browse$(3, default$, "*.bmp", dpage, vpage, buffer(), timing(), "")
  IF srcbmp$ <> "" THEN
   GOSUB bimport
  END IF
  GOSUB showpage
 END IF
 IF csr = 3 AND general(100) < 32767 THEN
  at = general(100)
  srcbmp$ = browse$(3, default$, "*.bmp", dpage, vpage, buffer(), timing(), "")
  IF srcbmp$ <> "" THEN
   GOSUB bimport
   general(100) = general(100) + 1
  END IF
  GOSUB showpage
 END IF
 IF csr = 4 THEN GOSUB disable
END IF
FOR i = 0 TO 4
col = 7: IF i = csr THEN col = 14 + tog
edgeprint menu$(i), 1, 1 + 10 * i, col, dpage
NEXT i
SWAP vpage, dpage
setvispage vpage
copypage 2, dpage
dowait
LOOP

disable:
csr2 = 0
setpal pmask()
setkeys
DO
setwait timing(), 100
setkeys
tog = tog XOR 1
IF keyval(1) > 1 THEN setpal master(): RETURN
IF csr2 = 0 THEN
 IF keyval(57) > 1 OR keyval(28) > 1 THEN setpal master(): RETURN
 IF keyval(80) > 1 THEN csr2 = 1: cy = -1
END IF
IF csr2 = 1 THEN
 IF keyval(75) > 1 THEN cx = large(cx - 1, 0)
 IF keyval(77) > 1 THEN cx = small(cx + 1, 15)
 IF keyval(80) > 1 THEN cy = small(cy + 1, 15)
 IF keyval(72) > 1 THEN cy = cy - 1: IF cy < 0 THEN cy = 0: csr2 = 0
 IF keyval(57) > 1 OR keyval(28) > 1 THEN
  FOR i = 0 TO 2
   pmask((cy * 16 + cx) * 3 + i) = pmask((cy * 16 + cx) * 3 + i) XOR master((cy * 16 + cx) * 3 + i)
  NEXT i
  setpal pmask()
 END IF
END IF
textcolor 7, 0: IF csr2 = 0 THEN textcolor 15 + 225 * tog, 0
printstr "Go Back", 0, 0, dpage
IF csr2 = 1 THEN rectangle 0 + cx * 10, 8 + cy * 10, 10, 10, 15 + 225 * tog, dpage
FOR i = 0 TO 15
 FOR o = 0 TO 15
  rectangle 1 + o * 10, 9 + i * 10, 8, 8, i * 16 + o, dpage
 NEXT o
NEXT i
SWAP vpage, dpage
setvispage vpage
copypage 2, dpage
dowait
LOOP

resetpal:
DEF SEG = VARSEG(pmask(0)): BLOAD game$ + ".mas", VARPTR(pmask(0))
RETURN

bimport:
clearpage 3
setvispage 3
IF at < general(100) THEN loadpage game$ + ".mxs" + CHR$(0), at, 3
bitmap2page pmask(), srcbmp$ + CHR$(0), 3
storepage game$ + ".mxs" + CHR$(0), at, 3
GOSUB resetpal
RETURN

showpage:
loadpage game$ + ".mxs" + CHR$(0), ptr, 2
RETURN

donebmp:
clearpage 0
clearpage 1
clearpage 2
clearpage 3
END SUB

SUB importsong (song$(), buffer(), game$, timing(), general(), keyv(), master())
STATIC default$
DIM music(32000)
setupmusic music()
setfmvol getfmvol
clearpage 0
clearpage 1
clearpage 2
clearpage 3
dpage = 0: vpage = 1: top1 = -1: csr = -1

setkeys
DO
setwait timing(), 100
setkeys
tog = tog XOR 1
IF keyval(1) > 1 THEN GOTO donesong
IF usemenu(csr, top1, -1, 99, 20) THEN
 stopsong
 IF csr > -1 AND song$(csr) <> "" THEN loadsong game$ + "." + intstr$(csr) + CHR$(0)
END IF
IF csr > -1 THEN
 strgrabber song$(csr), 30, keyv()
END IF
IF keyval(28) > 1 THEN
 IF csr = -1 THEN GOTO donesong
 IF csr > -1 THEN
  stopsong
  sourcesong$ = browse$(1, default$, "*.bam", dpage, vpage, buffer(), timing(), "")
  IF sourcesong$ <> "" THEN
   copyfile sourcesong$ + CHR$(0), game$ + "." + intstr$(csr) + CHR$(0), buffer()
   a$ = ""
   i = 0
   WHILE LEFT$(a$, 1) <> "\"
    i = i + 1
    a$ = RIGHT$(sourcesong$, i)
   WEND
   a$ = RIGHT$(a$, LEN(a$) - 1)
   a$ = LEFT$(a$, LEN(a$) - 4)
   song$(csr) = UCASE$(a$)
  END IF
  IF csr > -1 AND song$(csr) <> "" THEN loadsong game$ + "." + intstr$(csr) + CHR$(0)
 END IF
END IF
FOR i = top1 TO top1 + 20
 textcolor 7, 0: IF i = csr THEN textcolor 14 + tog, 0
 temp$ = song$(i)
 IF i > -1 THEN
  IF temp$ = "" THEN temp$ = "-EMPTY SLOT-"
  temp$ = intstr$(i) + ":" + temp$
 END IF
 printstr temp$, 1, 1 + 8 * (i - top1), dpage
NEXT i
SWAP vpage, dpage
setvispage vpage
copypage 2, dpage
dowait
LOOP

'simport:
'OPEN "import\" + b$ FOR BINARY AS #1
'temp$ = "    "
'GET #1, 1, temp$
'CLOSE #1
'IF temp$ <> "CBMF" THEN
' stopsong
' textcolor 10, 0
' printstr "Not a Valid BAM file (Bob Adlib Music)", 112, 0, vpage
' w = getkey
' RETURN
'END IF
'copyfile "import\" + b$ + CHR$(0), game$ + "." + intstr$(at) + CHR$(0), buffer()
'song$(csr) = LEFT$(b$, LEN(b$) - 4)
'RETURN

donesong:
clearpage 0
clearpage 1
clearpage 2
clearpage 3
stopsong
closemusic
END SUB

SUB loadtanim (n, tastuf(), game$)
setpicstuf tastuf(), 80, -1
loadset game$ + ".tap" + CHR$(0), n, 0
END SUB

SUB maptile (game$, master(), buffer(), timing(), font(), general())
DIM map(320), cutnpaste(19, 19), mouse(4), area(20, 4), tool$(5), menu$(10), tastuf(40), icon$(5), shortk(5), cursor(5)

setdiskpages buffer(), 200, 0

gotm = setmouse(mouse())

mapfile$ = game$ + ".til" + CHR$(0)
canpaste = 0
dcsr = 1
airsize = 5
mist = 10
tool$(0) = "Draw": icon$(0) = CHR$(3): shortk(0) = 32: cursor(0) = 0
tool$(1) = "Box ": icon$(1) = CHR$(4): shortk(1) = 48: cursor(1) = 1
tool$(2) = "Line": icon$(2) = CHR$(5): shortk(2) = 38: cursor(2) = 2
tool$(3) = "Fill": icon$(3) = "F":     shortk(3) = 33: cursor(3) = 3
tool$(4) = "Oval": icon$(4) = "O":     shortk(4) = 24: cursor(4) = 2
tool$(5) = "Air ": icon$(5) = "A":     shortk(5) = 30: cursor(5) = 3
area(0, 0) = 60
area(0, 1) = 0
area(0, 2) = 200
area(0, 3) = 160
area(0, 4) = -1
area(1, 0) = 0
area(1, 1) = 160
area(1, 2) = 320
area(1, 3) = 32
FOR i = 0 TO 5
 area(2 + i, 0) = 4 + i * 9
 area(2 + i, 1) = 32
 area(2 + i, 2) = 8
 area(2 + i, 3) = 8
NEXT i
FOR i = 0 TO 3
 area(12 + i, 0) = 4 + i * 9
 area(12 + i, 1) = 42
 area(12 + i, 2) = 8
 area(12 + i, 3) = 8
NEXT i
area(10, 0) = 8
area(10, 1) = 190
area(10, 2) = 32
area(10, 3) = 10
area(11, 0) = 280
area(11, 1) = 190
area(11, 2) = 32
area(11, 3) = 10
'LESS AIRBRUSH AREA
area(16, 0) = 12
area(16, 1) = 60
area(16, 2) = 8
area(16, 3) = 8
area(16, 4) = 0
'LESS AIRBRUSH MIST
area(17, 0) = 12
area(17, 1) = 76
area(17, 2) = 8
area(17, 3) = 8
area(17, 4) = 0
'MORE AIRBRUSH AREA
area(18, 0) = 36
area(18, 1) = 60
area(18, 2) = 8
area(18, 3) = 8
area(18, 4) = 0
'MORE AIRBRUSH MIST
area(19, 0) = 36
area(19, 1) = 76
area(19, 2) = 8
area(19, 3) = 8
area(19, 4) = 0

vpage = 0: dpage = 1
bnum = 0: c = 17
tmode = 0: cutfrom = 0
pagenum = -1
top = -1

setkeys
DO
setwait timing(), 100
setkeys
tog = tog XOR 1
IF keyval(1) > 1 THEN GOTO donemaptile
IF keyval(29) > 0 AND keyval(14) > 1 THEN
 cropafter pagenum, general(33), 3, ".til", buffer(), -1, game$, timing()
END IF
IF keyval(80) > 1 AND pagenum = general(33) AND general(33) < 32767 THEN
 pagenum = pagenum + 1
 IF needaddset(pagenum, general(33), "tile set", vpage, dpage, timing()) THEN
  WHILE pagenum > top + 20: top = top + 1: WEND
  clearpage 3
  storepage mapfile$, pagenum, 3
 END IF
END IF
IF usemenu(pagenum, top, -1, general(33), 20) THEN
 IF pagenum = -1 THEN clearpage 3 ELSE loadpage mapfile$, pagenum, 3
END IF
IF (keyval(57) > 1 OR keyval(28) > 1) AND pagenum = -1 THEN GOTO donemaptile
IF (keyval(57) > 1 OR keyval(28) > 1) AND pagenum > -1 THEN GOSUB tilemode
FOR i = top TO small(top + 20, general(33))
 textcolor 7, 240
 IF pagenum = i THEN textcolor 14 + tog, 240
 IF i < 0 THEN
  printstr "Return to Main Menu", 10, 8 + (i - top) * 8, dpage
 ELSE
  printstr "Tile Set" + STR$(i), 10, 8 + (i - top) * 8, dpage
 END IF
NEXT i
SWAP vpage, dpage
setvispage vpage
copypage 3, dpage
dowait
LOOP

tilemode:
GOSUB tilemodemenu
setkeys
DO
setwait timing(), 100
setkeys
tog = tog XOR 1
IF keyval(1) > 1 THEN tmode = 0: RETURN
IF keyval(72) > 1 THEN tmode = loopvar(tmode, 0, 3, -1)
IF keyval(80) > 1 THEN tmode = loopvar(tmode, 0, 3, 1)
IF keyval(57) OR keyval(28) > 1 THEN
 IF tmode <= 1 THEN GOSUB tiling
 IF tmode = 2 THEN
  GOSUB tileanim
  setkeys
  GOSUB tilemodemenu
  RETURN
 END IF
 IF tmode = 3 THEN tmode = 0: RETURN
END IF
FOR i = 0 TO 3
 textcolor 7, 240
 IF tmode = i THEN textcolor 14 + tog, 240
 printstr menu$(i), 10, 8 * (i + 1), dpage
NEXT i
SWAP vpage, dpage
setvispage vpage
copypage 3, dpage
dowait
LOOP
tilemodemenu:
 menu$(0) = "Draw Tiles"
 menu$(1) = "Cut Tiles"
 menu$(2) = "Define Tile Animation"
 menu$(3) = "Cancel"
RETURN

tileanim:
taset = 0
loadtanim pagenum, tastuf(), game$
GOSUB utamenu
menu$(0) = "Previous Menu"
menu$(2) = "Set Animation Range"
menu$(3) = "Set Animation Pattern"
menu$(5) = "Test Animations"
setkeys
DO
 setwait timing(), 100
 setkeys
 tog = tog XOR 1
 IF keyval(1) > 1 THEN savetanim pagenum, tastuf(), game$: RETURN
 IF usemenu(taptr, dummy, 0, 5, 5) THEN GOSUB utamenu
 IF taptr = 1 THEN
  IF intgrabber(taset, 0, 1, 75, 77) THEN GOSUB utamenu
 END IF
 IF taptr = 4 THEN
  IF intgrabber(tastuf(1 + 20 * taset), -500, 500, 75, 77) THEN GOSUB utamenu
 END IF
 IF keyval(57) OR keyval(28) > 1 THEN
  IF taptr = 0 THEN savetanim pagenum, tastuf(), game$: RETURN
  IF taptr = 2 THEN GOSUB setanimrange
  IF taptr = 3 THEN setanimpattern tastuf(), taset, timing(), vpage, dpage, game$
  IF taptr = 5 THEN testanimpattern tastuf(), taset, timing(), vpage, dpage, buffer()

 END IF
 FOR i = 0 TO 5
  textcolor 7, 240
  IF taptr = i THEN textcolor 14 + tog, 240
  printstr menu$(i), 10, 8 * (i + 1), dpage
 NEXT i
 SWAP vpage, dpage
 setvispage vpage
 clearpage dpage
 dowait
LOOP
utamenu:
 menu$(1) = CHR$(27) + "Animation set" + STR$(taset) + CHR$(26)
 menu$(4) = "Disable if Tag#" + intstr$(ABS(tastuf(1 + 20 * taset))) + "=" + onoroff$(tastuf(1 + 20 * taset)) + " (" + lmnemonic(ABS(tastuf(1 + 20 * taset)), game$) + ")"
RETURN

setanimrange:
setkeys
DO
 setwait timing(), 100
 setkeys
 tog = tog XOR 1
 IF keyval(1) > 1 OR keyval(28) > 1 OR keyval(57) > 1 THEN RETURN
 IF keyval(72) > 1 THEN tastuf(0 + 20 * taset) = large(tastuf(0 + 20 * taset) - 16, 0)
 IF keyval(80) > 1 THEN tastuf(0 + 20 * taset) = small(tastuf(0 + 20 * taset) + 16, 112)
 IF keyval(75) > 1 THEN tastuf(0 + 20 * taset) = large(tastuf(0 + 20 * taset) - 1, 0)
 IF keyval(77) > 1 THEN tastuf(0 + 20 * taset) = small(tastuf(0 + 20 * taset) + 1, 112)
 GOSUB drawanimrange
 SWAP vpage, dpage
 setvispage vpage
 copypage 3, dpage
 dowait
LOOP

drawanimrange:
 x = 0: y = 0
 FOR i = 0 TO 159
  IF i < tastuf(0 + 20 * taset) OR i > tastuf(0 + 20 * taset) + 47 THEN
   fuzzyrect x * 20, y * 20, 20, 20, 15, dpage
  END IF
  x = x + 1: IF x > 15 THEN x = 0: y = y + 1
 NEXT i
RETURN

tiling:
loadpage mapfile$, pagenum, 3
'pick block to draw
setkeys
pickit:
setwait timing(), 120
setkeys
copypage 3, dpage
IF gotm THEN
 readmouse mouse()
END IF
IF keyval(1) > 1 THEN storepage mapfile$, pagenum, 3: RETURN
IF keyval(75) > 0 THEN IF bnum > 0 THEN bnum = bnum - 1: IF gotm THEN mouse(0) = mouse(0) - 20: movemouse mouse(0), mouse(1)
IF keyval(77) > 0 THEN IF bnum < 159 THEN bnum = bnum + 1: IF gotm THEN mouse(0) = mouse(0) + 20: movemouse mouse(0), mouse(1)
IF keyval(72) > 0 THEN IF bnum > 15 THEN bnum = bnum - 16: IF gotm THEN mouse(1) = mouse(1) - 20: movemouse mouse(0), mouse(1)
IF keyval(80) > 0 THEN IF bnum < 144 THEN bnum = bnum + 16: IF gotm THEN mouse(1) = mouse(1) + 20: movemouse mouse(0), mouse(1)
IF gotm THEN
 bnum = INT(mouse(1) / 20) * 16 + INT(mouse(0) / 20)
END IF
IF (keyval(29) > 0 AND keyval(82) > 1) OR ((keyval(42) > 0 OR keyval(54) > 0) AND keyval(83)) OR (keyval(29) > 0 AND keyval(46) > 1) THEN GOSUB copy
IF ((keyval(42) > 0 OR keyval(54) > 0) AND keyval(82) > 1) OR (keyval(29) > 0 AND keyval(47) > 1) THEN GOSUB paste
bx = bnum AND 15
by = INT(bnum / 16)
IF keyval(28) > 1 OR keyval(57) OR mouse(3) > 0 THEN
 setkeys
 IF tmode = 0 THEN GOSUB drawit
 IF tmode = 1 THEN GOSUB tilecut
END IF
IF c < 30 THEN c = c + 1 ELSE c = 17
rectangle bx * 20 + 7, by * 20 + 7, 6, 6, c, dpage
IF gotm THEN
 textcolor 10 + tog * 5, 0
 printstr CHR$(2), small(large(mouse(0) - 2, 0), 311), small(large(mouse(1) - 2, 0), 191), dpage
END IF
SWAP dpage, vpage
setvispage vpage
dowait
GOTO pickit

'draw large block
drawit:
clearpage 2
GOSUB refreshbig
FOR i = 0 TO 31
 FOR j = 0 TO 7
  rectangle i * 10, j * 4 + 160, 10, 4, j * 32 + i, 2
 NEXT j
NEXT i
'---EDIT BLOCK---
edit:
IF gotm THEN
 omx = mouse(0): omy = mouse(1)
 movemouse remx, remy
END IF
delay = 3
setkeys
DO
setwait timing(), 120
setkeys
IF gotm THEN
 readmouse mouse()
 zcsr = 0
 zone = mouseover(mouse(), zox, zoy, zcsr, area())
END IF
tog = tog XOR 1
delay = large(delay - 1, 0)
IF keyval(1) > 1 THEN
 IF hold THEN
  hold = 0
 ELSE
  IF gotm THEN
   remx = mouse(0): remy = mouse(1)
   movemouse omx, omy
  END IF
  RETURN
 END IF
END IF
IF keyval(75) > 0 AND keyval(56) = 0 THEN IF x > 0 THEN x = x - 1: IF zone = 1 THEN mouse(0) = mouse(0) - 10: movemouse mouse(0), mouse(1)
IF keyval(77) > 0 AND keyval(56) = 0 THEN IF x < 19 THEN x = x + 1: IF zone = 1 THEN mouse(0) = mouse(0) + 10: movemouse mouse(0), mouse(1)
IF keyval(72) > 0 AND keyval(56) = 0 THEN IF y > 0 THEN y = y - 1: IF zone = 1 THEN mouse(1) = mouse(1) - 8: movemouse mouse(0), mouse(1)
IF keyval(80) > 0 AND keyval(56) = 0 THEN IF y < 19 THEN y = y + 1: IF zone = 1 THEN mouse(1) = mouse(1) + 8: movemouse mouse(0), mouse(1)
'---KEYBOARD SHORTCUTS FOR TOOLS------------
FOR i = 0 TO 5
 IF keyval(shortk(i)) > 1 THEN tool = i: hold = 0: dcsr = cursor(i) + 1
NEXT i
'----------
IF keyval(51) > 1 OR (keyval(56) > 0 AND keyval(75) > 0) THEN IF cc > 0 THEN cc = cc - 1
IF keyval(52) > 1 OR (keyval(56) > 0 AND keyval(77) > 0) THEN IF cc < 255 THEN cc = cc + 1
IF keyval(56) > 0 AND keyval(72) > 0 THEN IF cc > 31 THEN cc = cc - 32
IF keyval(56) > 0 AND keyval(80) > 0 THEN IF cc < 224 THEN cc = cc + 32
IF keyval(41) > 1 THEN hideptr = hideptr XOR 1
IF keyval(57) > 0 THEN GOSUB clicktile
IF keyval(28) > 1 THEN cc = readpixel(bx * 20 + x, by * 20 + y, 3)
IF gotm THEN
 IF zone = 1 THEN
  x = INT(zox / 10)
  y = INT(zoy / 8)
  IF mouse(2) = 2 THEN cc = readpixel(bx * 20 + x, by * 20 + y, 3)
  IF mouse(2) = 1 THEN GOSUB clicktile
 END IF
 IF zone = 2 THEN
  IF mouse(2) > 0 AND mouse(3) = 1 THEN cc = (INT(zoy / 4) * 32) + INT(zox / 10)
 END IF
 IF zone >= 3 AND zone <= 8 AND mouse(3) = 1 THEN
  tool = zone - 3
  dcsr = cursor(tool) + 1
  hold = 0
 END IF
 IF zone >= 13 AND zone <= 16 AND mouse(3) = 1 THEN GOSUB fliptile
END IF
IF tool = 5 THEN '--adjust airbrush
 IF mouse(3) = 1 OR mouse(2) = 1 THEN
  IF zone = 17 THEN airsize = large(airsize - 1, 1)
  IF zone = 19 THEN airsize = small(airsize + 1, 30)
  IF zone = 18 THEN mist = large(mist - 1, 1)
  IF zone = 20 THEN mist = small(mist + 1, 99)
 END IF
 IF keyval(12) > 1 OR keyval(74) > 1 THEN
  IF keyval(29) > 0 THEN
   mist = large(mist - 1, 1)
  ELSE
   airsize = large(airsize - 1, 1)
  END IF
 END IF
 IF keyval(13) > 1 OR keyval(78) > 1 THEN
  IF keyval(29) > 0 THEN
   mist = small(mist + 1, 99)
  ELSE
   airsize = small(airsize + 1, 80)
  END IF
 END IF
END IF
IF keyval(14) > 1 OR keyval(26) > 1 OR keyval(27) > 1 THEN GOSUB fliptile
cy = INT(cc / 32)
cx = cc AND 31
IF c < 15 THEN c = c + 1 ELSE c = 1
rectangle cx * 10 + 4, cy * 4 + 162, 3, 1, c, dpage
rectangle 60 + x * 10, y * 8, 10, 8, readpixel(bx * 20 + x, by * 20 + y, 3), dpage
rectangle x * 10 + 64, y * 8 + 3, 3, 2, c, dpage
IF tool = 5 THEN
 ellipse 64 + x * 10, 3 + y * 8, (airsize * 9) / 2, cc, dpage, 0, 0
END IF
SELECT CASE hold
CASE 1
 rectangle 60 + small(x, hox) * 10, small(y, hoy) * 8, (ABS(x - hox) + 1) * 10, (ABS(y - hoy) + 1) * 8, cc, dpage
CASE 2
 drawline 65 + x * 10, 4 + y * 8, 65 + hox * 10, 4 + hoy * 8, cc, dpage
CASE 3
 radius = large(ABS(hox - x), ABS(hoy - y)) * 9
 ellipse 65 + hox * 10, 4 + hoy * 8, radius, cc, dpage, 0, 0
END SELECT
textcolor 15, 1
printstr tool$(tool), 8, 8, dpage
printstr "Tool", 8, 16, dpage
FOR i = 0 TO 5
 t1 = 7: t2 = 8
 IF tool = i THEN t1 = 15: t2 = 7
 IF zone - 3 = i THEN t2 = 6
 textcolor t1, t2
 printstr icon$(i), 4 + i * 9, 32, dpage
NEXT i
FOR i = 0 TO 3
 textcolor 7, 8: IF zone = 13 + i THEN textcolor 15, 6
 printstr CHR$(7 + i), 4 + i * 9, 42, dpage
NEXT i
IF tool = 5 THEN
 textcolor 7, 0
 printstr "SIZE", 12, 52, dpage
 printstr STR$(airsize), 12, 60, dpage
 printstr "MIST", 12, 68, dpage
 printstr STR$(mist), 12, 76, dpage
 textcolor 7, 8: IF zone = 17 THEN textcolor 15, 6
 printstr CHR$(27), 12, 60, dpage
 textcolor 7, 8: IF zone = 18 THEN textcolor 15, 6
 printstr CHR$(27), 12, 76, dpage
 textcolor 7, 8: IF zone = 19 THEN textcolor 15, 6
 printstr CHR$(26), 36, 60, dpage
 textcolor 7, 8: IF zone = 20 THEN textcolor 15, 6
 printstr CHR$(26), 36, 76, dpage
END IF
IF gotm THEN
 c = zcsr
 IF c = -1 THEN
  c = dcsr
  IF hideptr THEN c = -2
 END IF
 textcolor 10 + tog * 5, 0
 printstr CHR$(2 + c), small(large(mouse(0) - 2, 0), 311), small(large(mouse(1) - 2, 0), 191), dpage
END IF
SWAP dpage, vpage
setvispage vpage
copypage 2, dpage
dowait
LOOP

clicktile:
 IF delay > 0 THEN RETURN
 SELECT CASE tool
 CASE 0'---DRAW
  rectangle bx * 20 + x, by * 20 + y, 1, 1, cc, 3: rectangle 60 + x * 10, y * 8, 10, 8, cc, 2
 CASE 1'---BOX
  IF mouse(3) > 0 OR keyval(57) > 1 THEN
   IF hold = 1 THEN
    rectangle small(bx * 20 + x, bx * 20 + hox), small(by * 20 + y, by * 20 + hoy), ABS(x - hox) + 1, ABS(y - hoy) + 1, cc, 3
    GOSUB refreshbig
    hold = 0
   ELSE
    hold = 1
    hox = x
    hoy = y
   END IF
  END IF
 CASE 2'---LINE
  IF mouse(3) > 0 OR keyval(57) > 1 THEN
   IF hold = 2 THEN
    drawline bx * 20 + x, by * 20 + y, bx * 20 + hox, by * 20 + hoy, cc, 3
    GOSUB refreshbig
    hold = 0
   ELSE
    hold = 2
    hox = x
    hoy = y
   END IF
  END IF
 CASE 3'---FILL
  IF mouse(3) > 0 OR keyval(57) > 1 THEN
   rectangle 0, 0, 22, 22, 15, dpage
   FOR i = 0 TO 19
    FOR j = 0 TO 19
     rectangle 1 + i, 1 + j, 1, 1, readpixel(bx * 20 + i, by * 20 + j, 3), dpage
    NEXT j
   NEXT i
   paintat 1 + x, 1 + y, cc, dpage, buffer(), 16384
   FOR i = 0 TO 19
    FOR j = 0 TO 19
     rectangle bx * 20 + i, by * 20 + j, 1, 1, readpixel(1 + i, 1 + j, dpage), 3
    NEXT j
   NEXT i
   GOSUB refreshbig
   rectangle 0, 0, 22, 22, 0, dpage
  END IF
 CASE 4'---OVAL
  IF mouse(3) > 0 OR keyval(57) > 1 THEN
   IF hold = 3 THEN
    radius = large(ABS(hox - x), ABS(hoy - y))
    rectangle 0, 0, 22, 22, 15, dpage
    FOR i = 0 TO 19
     FOR j = 0 TO 19
      rectangle 1 + i, 1 + j, 1, 1, readpixel(bx * 20 + i, by * 20 + j, 3), dpage
     NEXT j
    NEXT i
    ellipse 1 + hox, 1 + hoy, radius, cc, dpage, 0, 0
    FOR i = 0 TO 19
     FOR j = 0 TO 19
      rectangle bx * 20 + i, by * 20 + j, 1, 1, readpixel(1 + i, 1 + j, dpage), 3
     NEXT j
    NEXT i
    GOSUB refreshbig
    hold = 0
   ELSE
    hold = 3
    hox = x
    hoy = y
   END IF
  END IF
 CASE 5'---AIR
  rectangle 19, 119, 22, 22, 15, dpage
  FOR i = 0 TO 19
   FOR j = 0 TO 19
    rectangle 20 + i, 120 + j, 1, 1, readpixel(bx * 20 + i, by * 20 + j, 3), dpage
   NEXT j
  NEXT i
  airbrush 20 + x, 120 + y, airsize, mist, cc, dpage
  FOR i = 0 TO 19
   FOR j = 0 TO 19
    rectangle bx * 20 + i, by * 20 + j, 1, 1, readpixel(20 + i, 120 + j, dpage), 3
   NEXT j
  NEXT i
  GOSUB refreshbig
 END SELECT
RETURN

refreshbig:
 rectangle 59, 0, 202, 161, 15, 2
 FOR i = 0 TO 19
  FOR j = 0 TO 19
   rectangle 60 + i * 10, j * 8, 10, 8, readpixel(bx * 20 + i, by * 20 + j, 3), 2
  NEXT j
 NEXT i
RETURN

fliptile:
rectangle 0, 0, 20, 20, 0, dpage
flipx = 0: flipy = 0
IF (zone = 13 OR zone = 16) OR keyval(26) > 1 OR (keyval(14) > 1 AND keyval(29) = 0) THEN flipx = 19
IF zone = 14 OR zone = 15 OR keyval(27) > 1 OR (keyval(14) > 1 AND keyval(29) > 0) THEN flipy = 19
FOR i = 0 TO 19
 FOR j = 0 TO 19
  tempx = ABS(i - flipx)
  tempy = ABS(j - flipy)
  IF (zone = 15 OR zone = 16) OR (keyval(26) > 1 OR keyval(27) > 1) THEN SWAP tempx, tempy
  rectangle tempx, tempy, 1, 1, readpixel(bx * 20 + i, by * 20 + j, 3), dpage
 NEXT j
NEXT i
FOR i = 0 TO 19
 FOR j = 0 TO 19
  rectangle bx * 20 + i, by * 20 + j, 1, 1, readpixel(i, j, dpage), 3
 NEXT j
NEXT i
GOSUB refreshbig
rectangle 0, 0, 20, 20, 0, dpage
RETURN

tilecut:
IF gotm THEN
 omx = mouse(0): omy = mouse(1)
 movemouse remx, remy
END IF
delay = 3
clearpage 2
loadpage game$ + ".mxs" + CHR$(0), cutfrom, 2
setkeys
DO
setwait timing(), 120
setkeys
tog = tog XOR 1
delay = large(delay - 1, 0)
IF gotm THEN
 readmouse mouse()
 zcsr = 0
 zone = mouseover(mouse(), zox, zoy, zcsr, area())
 cutx = small(mouse(0), 300)
 cuty = small(mouse(1), 180)
END IF
IF keyval(1) > 1 THEN
 IF gotm THEN
  remx = mouse(0): remy = mouse(1)
  movemouse omx, omy
 END IF
 RETURN
END IF
inc = 1: IF keyval(56) > 0 THEN inc = 20
IF keyval(72) > 0 THEN cuty = large(cuty - inc, 0): IF gotm THEN movemouse cutx, cuty
IF keyval(80) > 0 THEN cuty = small(cuty + inc, 180): IF gotm THEN movemouse cutx, cuty
IF keyval(75) > 0 THEN cutx = large(cutx - inc, 0): IF gotm THEN movemouse cutx, cuty
IF keyval(77) > 0 THEN cutx = small(cutx + inc, 300): IF gotm THEN movemouse cutx, cuty
IF keyval(57) > 1 OR keyval(28) > 0 OR (mouse(3) > 0 AND zone < 11) THEN
 IF delay = 0 THEN
  setkeys
  FOR i = 0 TO 19
   FOR j = 0 TO 19
    rectangle bx * 20 + i, by * 20 + j, 1, 1, readpixel(cutx + i, cuty + j, 2), 3
   NEXT j
  NEXT i
  IF gotm THEN
   remx = mouse(0): remy = mouse(1)
   movemouse omx, omy
  END IF
  RETURN
 END IF
END IF
'---PICK BACKGROUND PAGE------
temp = cutfrom
dummy = intgrabber(cutfrom, 0, general(100) - 1, 51, 52)
IF zone = 11 AND mouse(3) > 0 THEN cutfrom = loopvar(cutfrom, 0, general(100) - 1, -1)
IF zone = 12 AND mouse(3) > 0 THEN cutfrom = loopvar(cutfrom, 0, general(100) - 1, 1)
IF temp <> cutfrom THEN loadpage game$ + ".mxs" + CHR$(0), cutfrom, 2
'----
drawline cutx, cuty, cutx + 19, cuty, 10 + tog * 5, dpage
drawline cutx, cuty, cutx, cuty + 19, 10 + tog * 5, dpage
drawline cutx + 19, cuty + 19, cutx + 19, cuty, 10 + tog * 5, dpage
drawline cutx + 19, cuty + 19, cutx, cuty + 19, 10 + tog * 5, dpage
textcolor 7 + tog, 1
IF zone = 11 THEN textcolor 14 + tog, 3
printstr "Prev", 8, 190, dpage
textcolor 7 + tog, 1
IF zone = 12 THEN textcolor 14 + tog, 3
printstr "Next", 280, 190, dpage
textcolor 15, 1
printstr STR$(cutfrom) + " ", 160 - LEN(STR$(cutfrom) + " ") * 4, 190, dpage
IF gotm THEN
 textcolor 10 + tog * 5, 0
 printstr CHR$(2), small(large(mouse(0) - 2, 0), 311), small(large(mouse(1) - 2, 0), 191), dpage
END IF
SWAP dpage, vpage
setvispage vpage
copypage 2, dpage
dowait
LOOP

copy:
FOR i = 0 TO 19
 FOR j = 0 TO 19
  cutnpaste(i, j) = readpixel(bx * 20 + i, by * 20 + j, 3)
 NEXT j
NEXT i
canpaste = 1
RETURN

paste:
IF canpaste = 0 THEN RETURN
FOR i = 0 TO 19
FOR j = 0 TO 19
rectangle bx * 20 + i, by * 20 + j, 1, 1, cutnpaste(i, j), 3
NEXT j: NEXT i
RETURN

donemaptile:
clearpage 3
clearpage 2
clearpage 1
clearpage 0
END SUB

FUNCTION mouseover (mouse(), zox, zoy, zcsr, area())

FOR i = 20 TO 0 STEP -1
 IF area(i, 2) <> 0 AND area(i, 3) <> 0 THEN
  IF mouse(0) >= area(i, 0) AND mouse(0) < area(i, 0) + area(i, 2) THEN
   IF mouse(1) >= area(i, 1) AND mouse(1) < area(i, 1) + area(i, 3) THEN
    zox = mouse(0) - area(i, 0)
    zoy = mouse(1) - area(i, 1)
    zcsr = area(i, 4)
    mouseover = i + 1
    EXIT FUNCTION
   END IF 'Y OKAY---
  END IF 'X OKAY---
 END IF 'VALID ZONE---
NEXT i

END FUNCTION

SUB savetanim (n, tastuf(), game$)
 setpicstuf tastuf(), 80, -1
 storeset game$ + ".tap" + CHR$(0), n, 0
END SUB

SUB setanimpattern (tastuf(), taset, timing(), vpage, dpage, game$)
DIM menu$(12), stuff$(7), llim(7), ulim(7)
menu$(0) = "Previous Menu"
stuff$(0) = "end of animation"
stuff$(1) = "up"
stuff$(2) = "down"
stuff$(3) = "right"
stuff$(4) = "left"
stuff$(5) = "wait"
stuff$(6) = "if tag do rest"
stuff$(7) = "unknown command"
FOR i = 1 TO 2
 llim(i) = 0
 ulim(i) = 9
NEXT i
FOR i = 3 TO 4
 llim(i) = 0
 ulim(i) = 159
NEXT i
llim(5) = 0
ulim(5) = 32767
llim(6) = -500
ulim(6) = 500

GOSUB refreshmenu

setkeys
DO
 setwait timing(), 100
 setkeys
 tog = tog XOR 1
 SELECT CASE context
 CASE 0 '---PICK A STATEMENT---
  IF keyval(1) > 1 THEN GOTO donesap
  IF usemenu(ptr, dummy, 0, 9, 9) THEN GOSUB refreshmenu
  IF keyval(57) > 1 OR keyval(28) > 1 THEN
   IF ptr = 0 THEN
    GOTO donesap
   ELSE
    context = 1
   END IF
  END IF
 CASE 1 '---EDIT THAT STATEMENT---
  IF keyval(1) > 1 OR keyval(28) > 1 OR keyval(57) > 1 THEN context = 0
  dummy = usemenu(ptr2, dummy, 0, 1, 1)
  IF ptr2 = 0 THEN IF intgrabber(tastuf(2 + bound(ptr - 1, 0, 8) + 20 * taset), 0, 6, 75, 77) THEN GOSUB refreshmenu
  IF ptr2 = 1 THEN IF intgrabber(tastuf(11 + bound(ptr - 1, 0, 8) + 20 * taset), llim(tastuf(2 + bound(ptr - 1, 0, 8) + 20 * taset)), ulim(tastuf(2 + bound(ptr - 1, 0, 8) + 20 * taset)), 75, 77) THEN GOSUB refreshmenu
 END SELECT
 FOR i = 0 TO 9
  textcolor 7, 0
  IF i = ptr THEN
   textcolor 14 + tog, 0
  END IF
  IF context = 1 THEN textcolor 8, 0
  printstr menu$(i), 0, i * 8, dpage
 NEXT i
 IF ptr > 0 THEN
  FOR i = 0 TO 1
   textcolor 7, 0
   IF context = 1 AND i = ptr2 THEN
    textcolor 14 + tog, 0
   END IF
   IF context = 0 THEN textcolor 8, 0
   printstr menu$(10 + i), 0, 100 + i * 8, dpage
  NEXT i
 END IF 'ptr > 1
 SWAP vpage, dpage
 setvispage vpage
 clearpage dpage
 dowait
LOOP

refreshmenu:
GOSUB forcebounds
FOR i = 1 TO 9
 menu$(i) = "-"
NEXT i
menu$(10) = ""
FOR i = 0 TO 8
 a = bound(tastuf((2 + i) + 20 * taset), 0, 7)
 b = tastuf((11 + i) + 20 * taset)
 menu$(i + 1) = stuff$(a)
 IF a = 0 THEN EXIT FOR
 IF a > 0 AND a < 6 THEN menu$(i + 1) = menu$(i + 1) + STR$(b)
 IF a = 6 THEN menu$(i + 1) = menu$(i + 1) + lmnemonic(b, game$)
NEXT i
IF i = 8 THEN menu$(10) = "end of animation"
menu$(10) = "Action=" + stuff$(bound(tastuf(2 + bound(ptr - 1, 0, 8) + 20 * taset), 0, 7))
menu$(11) = "Value="
this = tastuf(11 + bound(ptr - 1, 0, 8) + 20 * taset)
SELECT CASE tastuf(2 + bound(ptr - 1, 0, 8) + 20 * taset)
 CASE 1 TO 4
  menu$(11) = menu$(11) + intstr$(this) + " Tiles"
 CASE 5
  menu$(11) = menu$(11) + intstr$(this) + " Ticks"
 CASE 6
  menu$(11) = menu$(11) + "Tag#" + intstr$(ABS(this)) + "=" + onoroff$(this) + " " + lmnemonic(ABS(this), game$)
 CASE ELSE
  menu$(11) = menu$(11) + "N/A"
END SELECT
RETURN

forcebounds:
 FOR i = 0 TO 8
  j = bound(i, 0, 8) + 20 * taset
  tastuf(2 + j) = bound(tastuf(2 + j), 0, 7)
  tastuf(11 + j) = bound(tastuf(11 + j), llim(tastuf(2 + j)), ulim(tastuf(2 + j)))
 NEXT i
RETURN

donesap:
GOSUB forcebounds

END SUB

SUB sprite (buffer(), xw, yw, pal(), timing(), game$, sets, perset, soff, foff, atatime, info$(), size, zoom, file$, master(), font())
STATIC default$
DIM nulpal(16), placer(2000), clip(2000), pclip(16), menu$(255), pmenu$(3), bmpd(40), mouse(4), area(20, 4), tool$(5), icon$(5), shortk(5), cursor(5)

gotm = setmouse(mouse())
GOSUB initmarea
airsize = 5
mist = 10
paste = 0
icsr = 0
itop = 0
dcsr = 1
pmenu$(0) = "Overwrite Current Palette"
pmenu$(1) = "Import Without Palette"
pmenu$(2) = "Cancel Import"
tool$(0) = "Draw": icon$(0) = CHR$(3): shortk(0) = 32: cursor(0) = 0
tool$(1) = "Box ": icon$(1) = CHR$(4): shortk(1) = 48: cursor(1) = 1
tool$(2) = "Line": icon$(2) = CHR$(5): shortk(2) = 38: cursor(2) = 2
tool$(3) = "Fill": icon$(3) = "F":     shortk(3) = 33: cursor(3) = 3
tool$(4) = "Oval": icon$(4) = "O":     shortk(4) = 24: cursor(4) = 2
tool$(5) = "Air ": icon$(5) = "A":     shortk(5) = 30: cursor(5) = 3

DEF SEG = VARSEG(nulpal(0))
FOR i = 0 TO 15
POKE i, i
NEXT i
dpage = 1: vpage = 0
xbload game$ + ".pal", pal(), "cant find 16-color palettes"
'DEF SEG = VARSEG(pal(0)): BLOAD game$ + ".pal", VARPTR(pal(0))

FOR j = 0 TO 0 + atatime: GOSUB loadwuc: NEXT j

setkeys
DO
setwait timing(), 120
setkeys
tog = tog XOR 1
IF keyval(1) > 1 THEN GOTO donedraw
IF keyval(29) > 0 AND keyval(14) > 1 THEN cropafter ptr, sets, 0, file$, buffer(), size * perset, game$, timing()
IF keyval(57) > 1 OR keyval(28) > 1 THEN GOSUB spriteage
IF keyval(73) > 1 THEN
 FOR j = top TO top + atatime: GOSUB savewuc: NEXT j
  top = large(top - atatime, 0)
  ptr = large(ptr - atatime, 0)
 FOR j = top TO top + atatime: GOSUB loadwuc: NEXT j
END IF
IF keyval(81) > 1 THEN
 FOR j = top TO top + atatime: GOSUB savewuc: NEXT j
  top = small(top + atatime, sets - atatime)
  ptr = small(ptr + atatime, sets - atatime)
 FOR j = top TO top + atatime: GOSUB loadwuc: NEXT j
END IF
IF keyval(72) > 1 THEN
 ptr = large(ptr - 1, 0)
 IF ptr < top THEN
  j = top + atatime: GOSUB savewuc
  top = ptr
  FOR i = atatime TO 1 STEP -1
   FOR o = 0 TO perset - 1
    loadsprite placer(), 0, size * o, soff * (i - 1), xw, yw, 3
    stosprite placer(), 0, size * o, soff * i, 3
   NEXT o
  NEXT i
  j = ptr: GOSUB loadwuc
 END IF
END IF
IF keyval(80) > 1 AND ptr < 32767 THEN
 ptr = ptr + 1
 IF needaddset(ptr, sets, "graphics", vpage, dpage, timing()) THEN
  setpicstuf buffer(), size * perset, -1
  FOR i = 0 TO (size * perset) / 2
   buffer(i) = 0
  NEXT i
  storeset game$ + file$ + CHR$(0), ptr, 0
 END IF
 IF ptr > top + atatime THEN
  j = top: GOSUB savewuc
  top = top + 1
  FOR i = 0 TO atatime - 1
   FOR o = 0 TO perset - 1
    loadsprite placer(), 0, size * o, soff * (i + 1), xw, yw, 3
    stosprite placer(), 0, size * o, soff * i, 3
   NEXT o
  NEXT i
  j = ptr: GOSUB loadwuc
 END IF
END IF
IF keyval(75) > 1 THEN num = large(num - 1, 0)
IF keyval(77) > 1 THEN num = small(num + 1, perset - 1)
IF keyval(26) > 1 THEN offset = large(offset - 1, 0)
IF keyval(27) > 1 THEN offset = small(offset + 1, 90)
IF (keyval(29) > 0 AND keyval(82) > 1) OR ((keyval(42) > 0 OR keyval(54) > 0) AND keyval(83)) OR (keyval(29) > 0 AND keyval(46) > 1) THEN loadsprite clip(), 0, num * size, soff * (ptr - top), xw, yw, 3: paste = 1
IF (((keyval(42) > 0 OR keyval(54) > 0) AND keyval(82) > 1) OR (keyval(29) > 0 AND keyval(47) > 1)) AND paste = 1 THEN stosprite clip(), 0, num * size, soff * (ptr - top), 3
GOSUB choose
textcolor 7, 0
printstr "Palette" + STR$(offset), 320 - (LEN("Palette" + STR$(offset)) * 8), 0, dpage
printstr "Set" + STR$(ptr), 320 - (LEN("Set" + STR$(ptr)) * 8), 8, dpage
printstr info$(num), 320 - (LEN(info$(num)) * 8), 16, dpage
SWAP vpage, dpage
setvispage vpage
clearpage dpage
dowait
LOOP

choose:
rectangle 0, 0, 320, 200, 244, dpage
rectangle 4 + (num * (xw + 1)), (ptr - top) * (yw + 5), xw + 2, yw + 2, 15, dpage
FOR i = top TO small(top + atatime, sets)
 FOR o = 0 TO perset - 1
  rectangle 5 + (o * (xw + 1)), 1 + ((i - top) * (yw + 5)), xw, yw, 0, dpage
  loadsprite placer(), 0, size * o, soff * (i - top), xw, yw, 3
  drawsprite placer(), 0, pal(), offset * 16, 5 + (o * (xw + 1)), 1 + ((i - top) * (yw + 5)), dpage
 NEXT o
NEXT i
RETURN

spriteage:
GOSUB spedbak
loadsprite placer(), 0, num * size, soff * (ptr - top), xw, yw, 3
setkeys
DO
setwait timing(), 110
setkeys
IF gotm THEN
 readmouse mouse()
 zcsr = 0
 zone = mouseover(mouse(), zox, zoy, zcsr, area())
END IF
IF keyval(1) > 1 THEN
 IF box OR drl OR ovalstep THEN
  GOSUB resettool
 ELSE
  stosprite placer(), 0, num * size, soff * (ptr - top), 3: GOSUB resettool: RETURN
 END IF
END IF
GOSUB sprctrl
tog = tog XOR 1
GOSUB spritescreen
SWAP vpage, dpage
setvispage vpage
copypage 2, dpage
dowait
LOOP

resettool:
 box = 0
 drl = 0
 ovalstep = 0
RETURN

sprctrl:
IF mouse(2) = 0 THEN
 oldx = -1
 oldy = -1
END IF
IF keyval(41) > 1 THEN hideptr = hideptr XOR 1
IF keyval(51) > 1 AND col > 0 THEN col = col - 1
IF keyval(52) > 1 AND col < 15 THEN col = col + 1
IF zone = 2 THEN
 IF mouse(3) > 0 THEN col = small(INT(zox / 4), 15)
END IF
IF keyval(26) > 1 OR (zone = 5 AND mouse(3) > 0) THEN offset = large(offset - 1, 0)
IF keyval(27) > 1 OR (zone = 6 AND mouse(3) > 0) THEN offset = small(offset + 1, 90)
IF (keyval(29) > 0 AND keyval(82) > 1) OR ((keyval(42) > 0 OR keyval(54) > 0) AND keyval(83)) OR (keyval(29) > 0 AND keyval(46) > 1) THEN loadsprite clip(), 0, num * size, soff * (ptr - top), xw, yw, 3: paste = 1
IF (((keyval(42) > 0 OR keyval(54) > 0) AND keyval(82) > 1) OR (keyval(29) > 0 AND keyval(47) > 1)) AND paste = 1 THEN stosprite clip(), 0, num * size, soff * (ptr - top), 3: loadsprite placer(), 0, num * size, soff * (ptr - top), xw, yw, 3
IF (keyval(29) > 0 AND keyval(82) > 1) OR ((keyval(42) > 0 OR keyval(54) > 0) AND keyval(83)) OR (keyval(29) > 0 AND keyval(46) > 1) THEN DEF SEG = VARSEG(pal(0)): FOR i = 0 TO 15: pclip(i) = PEEK(offset * 16 + i): NEXT
IF ((keyval(42) > 0 OR keyval(54) > 0) AND keyval(82) > 1) OR (keyval(29) > 0 AND keyval(47) > 1) THEN DEF SEG = VARSEG(pal(0)): FOR i = 0 TO 15: POKE offset * 16 + i, pclip(i): NEXT
IF keyval(56) > 0 AND col > 0 THEN
 DEF SEG = VARSEG(pal(0))
 IF keyval(72) > 0 AND PEEK(offset * 16 + col) > 15 THEN POKE offset * 16 + col, PEEK(offset * 16 + col) - 16
 IF keyval(80) > 0 AND PEEK(offset * 16 + col) < 240 THEN POKE offset * 16 + col, PEEK(offset * 16 + col) + 16
 IF keyval(75) > 0 AND PEEK(offset * 16 + col) > 0 THEN POKE offset * 16 + col, PEEK(offset * 16 + col) - 1
 IF keyval(77) > 0 AND PEEK(offset * 16 + col) < 255 THEN POKE offset * 16 + col, PEEK(offset * 16 + col) + 1
END IF
IF mouse(3) = 1 AND zone = 3 AND col > 0 THEN
 POKE offset * 16 + col, INT(INT(zoy / 6) * 16) + INT(zox / 4)
END IF
IF keyval(56) = 0 THEN
 IF keyval(72) > 0 THEN
  y = large(0, y - 1)
  IF zone = 1 THEN mouse(1) = mouse(1) - zoom: movemouse mouse(0), mouse(1)
  IF zone = 14 THEN mouse(1) = mouse(1) - 1: movemouse mouse(0), mouse(1)
 END IF
 IF keyval(80) > 0 THEN
  y = small(yw - 1, y + 1)
  IF zone = 1 THEN mouse(1) = mouse(1) + zoom: movemouse mouse(0), mouse(1)
  IF zone = 14 THEN mouse(1) = mouse(1) + 1: movemouse mouse(0), mouse(1)
 END IF
 IF keyval(75) > 0 THEN
  x = large(0, x - 1)
  IF zone = 1 THEN mouse(0) = mouse(0) - zoom: movemouse mouse(0), mouse(1)
  IF zone = 14 THEN mouse(0) = mouse(0) - 1: movemouse mouse(0), mouse(1)
 END IF
 IF keyval(77) > 0 THEN
  x = small(xw - 1, x + 1)
  IF zone = 1 THEN mouse(0) = mouse(0) + zoom: movemouse mouse(0), mouse(1)
  IF zone = 14 THEN mouse(0) = mouse(0) + 1: movemouse mouse(0), mouse(1)
 END IF
END IF
IF zone = 1 THEN
 x = INT(zox / zoom)
 y = INT(zoy / zoom)
END IF
IF tool = 5 THEN '--adjust airbrush
 IF mouse(3) = 1 OR mouse(2) = 1 THEN
  IF zone = 15 THEN airsize = large(airsize - 1, 1)
  IF zone = 17 THEN airsize = small(airsize + 1, 80)
  IF zone = 16 THEN mist = large(mist - 1, 1)
  IF zone = 18 THEN mist = small(mist + 1, 99)
 END IF
 IF keyval(12) > 1 OR keyval(74) > 1 THEN
  IF keyval(29) > 0 THEN
   mist = large(mist - 1, 1)
  ELSE
   airsize = large(airsize - 1, 1)
  END IF
 END IF
 IF keyval(13) > 1 OR keyval(78) > 1 THEN
  IF keyval(29) > 0 THEN
   mist = small(mist + 1, 99)
  ELSE
   airsize = small(airsize + 1, 80)
  END IF
 END IF
END IF
IF zone = 14 THEN
 x = zox
 y = zoy
END IF
IF ((zone = 1 OR zone = 14) AND (mouse(3) = 1 OR mouse(2) = 1)) OR keyval(57) > 0 THEN
 SELECT CASE tool
 CASE 0'---Draw
  GOSUB putdot
 CASE 1'---Box
  IF mouse(3) > 0 OR keyval(57) > 1 THEN
   IF box THEN
    box = 0: GOSUB drawsquare
   ELSE
    box = 1: bx = x: by = y
   END IF
  END IF
 CASE 2'---Line
  IF mouse(3) > 0 OR keyval(57) > 1 THEN
   IF drl THEN
    drl = 0: GOSUB straitline
   ELSE
    drl = 1: bx = x: by = y
   END IF
  END IF
 CASE 3'---Fill
  IF mouse(3) > 0 OR keyval(57) > 1 THEN
   GOSUB floodfill
  END IF
 CASE 4'---Oval
  IF mouse(3) > 0 OR keyval(57) > 1 THEN
   SELECT CASE ovalstep
   CASE 0'--start oval
    bx = x: by = y
    squishx = 0: squishy = 0
    radius = 0
    ovalstep = 1
   CASE 1'--draw the oval
    GOSUB drawoval
    ovalstep = 0
   END SELECT
  END IF
 CASE 5'---Spray
  GOSUB sprayspot
 END SELECT
END IF
IF ovalstep = 1 THEN
 radius = large(ABS(x - bx), ABS(y - by))
END IF
FOR i = 0 TO 5
 IF (mouse(3) > 0 AND zone = 7 + i) OR keyval(shortk(i)) > 1 THEN
  tool = i
  GOSUB resettool
  dcsr = cursor(i) + 1
 END IF
NEXT i
IF keyval(28) > 1 OR (zone = 1 AND mouse(2) = 2) THEN drawsprite placer(), 0, nulpal(), 0, 239, 119, dpage: col = readpixel(239 + x, 119 + y, dpage)
IF keyval(14) > 1 OR (zone = 4 AND mouse(3) > 0) THEN wardsprite placer(), 0, nulpal(), 0, 239, 119, dpage: getsprite placer(), 0, 239, 119, xw, yw, dpage
IF keyval(58) > 0 THEN
 IF keyval(72) > 0 THEN rectangle 239, 119, xw, yw, 0, 2: drawsprite placer(), 0, nulpal(), 0, 239, 118, dpage: getsprite placer(), 0, 239, 119, xw, yw, dpage
 IF keyval(80) > 0 THEN rectangle 239, 119, xw, yw, 0, 2: drawsprite placer(), 0, nulpal(), 0, 239, 120, dpage: getsprite placer(), 0, 239, 119, xw, yw, dpage
 IF keyval(75) > 0 THEN rectangle 239, 119, xw, yw, 0, 2: drawsprite placer(), 0, nulpal(), 0, 238, 119, dpage: getsprite placer(), 0, 239, 119, xw, yw, dpage
 IF keyval(77) > 0 THEN rectangle 239, 119, xw, yw, 0, 2: drawsprite placer(), 0, nulpal(), 0, 240, 119, dpage: getsprite placer(), 0, 239, 119, xw, yw, dpage
END IF
IF keyval(23) > 1 OR (zone = 13 AND mouse(3) > 0) THEN GOSUB import16
RETURN

spedbak:
clearpage 2
rectangle 3, 0, xw * zoom + 2, yw * zoom + 2, 15, 2
rectangle 4, 1, xw * zoom, yw * zoom, 0, 2
rectangle 245, 109, 67, 8, 15, 2
rectangle 246, 110, 65, 6, 0, 2
rectangle 238, 118, xw + 2, yw + 2, 15, 2
rectangle 239, 119, xw, yw, 0, 2
area(0, 2) = xw * zoom
area(0, 3) = yw * zoom
area(13, 2) = xw
area(13, 3) = yw
RETURN

import16:
srcbmp$ = browse$(2, default$, "*.bmp", dpage, vpage, buffer(), timing(), "")
'--------------------
'DECIDE ABOUT PALETTE
pcsr = 0
setkeys
DO
setwait timing(), 110
setkeys
tog = tog XOR 1
IF keyval(1) > 1 THEN RETURN
IF keyval(75) > 1 OR keyval(26) > 1 THEN offset = large(offset - 1, 0)
IF keyval(77) > 1 OR keyval(27) > 1 THEN offset = small(offset + 1, 90)
IF keyval(72) > 1 THEN pcsr = large(pcsr - 1, 0)
IF keyval(80) > 1 THEN pcsr = small(pcsr + 1, 2)
IF keyval(57) > 1 OR keyval(28) > 1 THEN
 IF pcsr = 2 THEN RETURN
 EXIT DO
END IF
GOSUB spritescreen
rectangle 4, 156, 208, 32, 8, dpage
FOR i = 0 TO 2
 c = 7: IF i = pcsr THEN c = 14 + tog
 edgeprint pmenu$(i), 8, 160 + (i * 8), c, dpage
NEXT i
SWAP vpage, dpage
setvispage vpage
copypage 2, dpage
dowait
LOOP

clearpage dpage
clearpage 2

loadbmp srcbmp$ + CHR$(0), 0, 0, buffer(), 2

'---------------------
'PICK BACKGROUND COLOR
gx = 0
gy = 0
temp = bmpinfo(srcbmp$ + CHR$(0), bmpd())
edjx = small(320, bmpd(1))
edjy = small(200, bmpd(2))
setkeys
DO
setwait timing(), 110
setkeys
tog = tog XOR 1
IF keyval(1) > 1 THEN GOSUB spedbak: RETURN
IF keyval(72) > 0 THEN gy = large(gy - (1 + (keyval(56) * 8)), 1)
IF keyval(80) > 0 THEN gy = small(gy + (1 + (keyval(56) * 8)), edjy)
IF keyval(75) > 0 THEN gx = large(gx - (1 + (keyval(56) * 8)), 1)
IF keyval(77) > 0 THEN gx = small(gx + (1 + (keyval(56) * 8)), edjx)
IF keyval(57) > 1 OR keyval(28) > 1 THEN EXIT DO
rectangle gx, gy, 1, 1, 15 + tog, dpage
edgeprint "Pick Background Color", 0, 190, 7, dpage
SWAP vpage, dpage
setvispage vpage
copypage 2, dpage
dowait
LOOP
temp = readpixel(gx, gy, 2)
FOR i = 0 TO edjx - 1
 FOR o = 0 TO edjy
  IF readpixel(i, o, 2) = temp THEN
   rectangle i, o, 1, 1, 0, 2
  ELSE
   IF readpixel(i, o, 2) = 0 THEN
    rectangle i, o, 1, 1, temp, 2
   END IF
  END IF
 NEXT o
NEXT i
IF pcsr = 0 THEN
 getbmppal srcbmp$ + CHR$(0), master(), pal(), offset * 16
 DEF SEG = VARSEG(pal(0))
 POKE offset * 16 + temp, PEEK(offset * 16 + 0)
 POKE offset * 16, 0
END IF
getsprite placer(), 0, 1, 1, xw, yw, 2
GOSUB spedbak
RETURN

floodfill:
rectangle 238, 118, xw + 2, yw + 2, 17, dpage
rectangle 239, 119, xw, yw, 0, dpage
drawsprite placer(), 0, nulpal(), 0, 239, 119, dpage
paintat 239 + x, 119 + y, col, dpage, buffer(), 16384
getsprite placer(), 0, 239, 119, xw, yw, dpage
RETURN

sprayspot:
drawsprite placer(), 0, nulpal(), 0, 239, 119, dpage
airbrush 239 + x, 119 + y, airsize, mist, col, dpage
getsprite placer(), 0, 239, 119, xw, yw, dpage
RETURN

putdot:
drawsprite placer(), 0, nulpal(), 0, 239, 119, dpage
IF oldx = -1 AND oldy = -1 THEN
 rectangle 239 + x, 119 + y, 1, 1, col, dpage
ELSE
 drawline 239 + x, 119 + y, 239 + oldx, 119 + oldy, col, dpage
END IF
getsprite placer(), 0, 239, 119, xw, yw, dpage
oldx = x
oldy = y
RETURN

drawoval:
drawsprite placer(), 0, nulpal(), 0, 239, 119, dpage
ellipse 239 + bx, 119 + by, radius, col, dpage, squishx, squishy
getsprite placer(), 0, 239, 119, xw, yw, dpage
RETURN

drawsquare:
drawsprite placer(), 0, nulpal(), 0, 239, 119, dpage
rectangle 239 + small(x, bx), 119 + small(y, by), ABS(x - bx) + 1, ABS(y - by) + 1, col, dpage
getsprite placer(), 0, 239, 119, xw, yw, dpage
RETURN

straitline:
drawsprite placer(), 0, nulpal(), 0, 239, 119, dpage
drawline 239 + x, 119 + y, 239 + bx, 119 + by, col, dpage
getsprite placer(), 0, 239, 119, xw, yw, dpage
RETURN

spritescreen:
DEF SEG = VARSEG(pal(0))
rectangle 247 + ((PEEK(offset * 16 + col) - (INT(PEEK(offset * 16 + col) / 16) * 16)) * 4), 0 + (INT(PEEK(offset * 16 + col) / 16) * 6), 5, 7, 15, dpage
FOR i = 0 TO 15
FOR o = 0 TO 15
rectangle 248 + (i * 4), 1 + (o * 6), 3, 5, o * 16 + i, dpage
NEXT: NEXT
textcolor 15, 8: IF zone = 5 THEN textcolor 15, 6
printstr CHR$(27), 248, 100, dpage
textcolor 15, 8: IF zone = 6 THEN textcolor 15, 6
printstr CHR$(26), 304, 100, dpage
textcolor 15, 0
printstr " Pal" + STR$(offset), 248, 100, dpage
rectangle 247 + (col * 4), 110, 5, 7, 15, dpage
FOR i = 0 TO 15
rectangle 248 + (i * 4), 111, 3, 5, PEEK((offset * 16) + i), dpage
NEXT
IF zoom = 4 THEN hugesprite placer(), pal(), offset * 16, 4, 1, dpage
IF zoom = 2 THEN bigsprite placer(), pal(), offset * 16, 4, 1, dpage
IF box = 1 THEN
 DEF SEG = VARSEG(pal(0))
 rectangle 4 + small(x, bx) * zoom, 1 + small(y, by) * zoom, (ABS(x - bx) + 1) * zoom, (ABS(y - by) + 1) * zoom, PEEK(offset * 16 + col), dpage
 rectangle 4 + bx * zoom, 1 + by * zoom, zoom, zoom, tog * 15, dpage
END IF
rectangle 4 + (x * zoom), 1 + (y * zoom), zoom, zoom, tog * 15, dpage
drawsprite placer(), 0, pal(), offset * 16, 239, 119, dpage
IF box = 1 THEN
 DEF SEG = VARSEG(pal(0))
 rectangle 239 + small(x, bx), 119 + small(y, by), ABS(x - bx) + 1, ABS(y - by) + 1, PEEK(offset * 16 + col), dpage
 rectangle 239 + bx, 119 + by, 1, 1, tog * 15, dpage
END IF
IF drl = 1 THEN
 DEF SEG = VARSEG(pal(0))
 drawline 239 + x, 119 + y, 239 + bx, 119 + by, PEEK(offset * 16 + col), dpage
 drawline 5 + (x * zoom), 2 + (y * zoom), 5 + (bx * zoom), 2 + (by * zoom), PEEK(offset * 16 + col), dpage
END IF
IF ovalstep > 0 THEN
 DEF SEG = VARSEG(pal(0))
 ellipse 239 + bx, 119 + by, radius, PEEK(offset * 16 + col), dpage, squishx, squishy
 ellipse 5 + (bx * zoom), 2 + (by * zoom), radius * zoom, PEEK(offset * 16 + col), dpage, squishx, squishy
END IF
IF tool = 5 THEN
 DEF SEG = VARSEG(pal(0))
 ellipse 239 + x, 119 + y, airsize / 2, PEEK(offset * 16 + col), dpage, 0, 0
 ellipse 5 + (x * zoom), 2 + (y * zoom), (airsize / 2) * zoom, PEEK(offset * 16 + col), dpage, 0, 0
END IF
rectangle 239 + x, 119 + y, 1, 1, tog * 15, dpage
textcolor 7, 0
'printstr STR$(zone) + STR$(zox) + STR$(zoy), 0, 174, dpage
printstr info$(num), 0, 182, dpage
printstr "Tool:" + tool$(tool), 0, 190, dpage
FOR i = 0 TO 5
 t1 = 7: t2 = 8
 IF tool = i THEN t1 = 15: t2 = 7
 IF zone - 7 = i THEN t2 = 6
 textcolor t1, t2
 printstr icon$(i), 90 + i * 12, 190, dpage
NEXT i
textcolor 7, 8: IF zone = 4 THEN textcolor 15, 6
printstr CHR$(7), 182, 190, dpage
textcolor 7, 8: IF zone = 13 THEN textcolor 15, 6
printstr "I", 194, 190, dpage
IF tool = 5 THEN
 textcolor 7, 0
 printstr "SIZE" + LTRIM$(STR$(airsize)), 218, 182, dpage
 printstr "MIST" + LTRIM$(STR$(mist)), 218, 190, dpage
 textcolor 7, 8: IF zone = 15 THEN textcolor 15, 6
 printstr CHR$(27), 210, 182, dpage
 textcolor 7, 8: IF zone = 16 THEN textcolor 15, 6
 printstr CHR$(27), 210, 190, dpage
 textcolor 7, 8: IF zone = 17 THEN textcolor 15, 6
 printstr CHR$(26), 266, 182, dpage
 textcolor 7, 8: IF zone = 18 THEN textcolor 15, 6
 printstr CHR$(26), 266, 190, dpage
END IF
IF gotm THEN
 c = zcsr
 IF c = -1 THEN
  IF hideptr THEN c = -2 ELSE c = dcsr
 END IF
 textcolor 10 + tog * 5, 0
 printstr CHR$(2 + c), small(large(mouse(0) - 2, 0), 311), small(large(mouse(1) - 2, 0), 191), dpage
END IF
RETURN

initmarea:
'0 x
'1 y
'2 width
'3 height
'4 cursor
'DRAWING ZONE
area(0, 0) = 4
area(0, 1) = 1
area(0, 4) = -1
'PALETTE ZONE
area(1, 0) = 248
area(1, 1) = 111
area(1, 2) = 64
area(1, 3) = 6
area(1, 4) = 0
'MASTER PAL ZONE
area(2, 0) = 248
area(2, 1) = 1
area(2, 2) = 64
area(2, 3) = 96
area(2, 4) = 0
'FLIP BUTTON
area(3, 0) = 182
area(3, 1) = 190
area(3, 2) = 8
area(3, 3) = 10
area(3, 4) = 0
'PREV PAL BUTTON
area(4, 0) = 248
area(4, 1) = 100
area(4, 2) = 8
area(4, 3) = 8
area(4, 4) = 0
'NEXT PAL BUTTON
area(5, 0) = 304
area(5, 1) = 100
area(5, 2) = 8
area(5, 3) = 8
area(5, 4) = 0
'TOOL BUTTONS
FOR i = 0 TO 5
 area(6 + i, 0) = 90 + i * 12
 area(6 + i, 1) = 190
 area(6 + i, 2) = 8
 area(6 + i, 3) = 10
 area(6 + i, 4) = 0
NEXT i
'IMPORT BUTTON
area(12, 0) = 194
area(12, 1) = 190
area(12, 2) = 8
area(12, 3) = 10
area(12, 4) = 0
'SMALL DRAWING AREA
area(13, 0) = 239
area(13, 1) = 119
area(13, 4) = -1
'LESS AIRBRUSH AREA
area(14, 0) = 210
area(14, 1) = 182
area(14, 2) = 8
area(14, 3) = 8
area(14, 4) = 0
'LESS AIRBRUSH MIST
area(15, 0) = 210
area(15, 1) = 190
area(15, 2) = 8
area(15, 3) = 8
area(15, 4) = 0
'MORE AIRBRUSH AREA
area(16, 0) = 266
area(16, 1) = 182
area(16, 2) = 8
area(16, 3) = 8
area(16, 4) = 0
'MORE AIRBRUSH MIST
area(17, 0) = 266
area(17, 1) = 190
area(17, 2) = 8
area(17, 3) = 8
area(17, 4) = 0
RETURN

savewuc:
setpicstuf buffer(), size * perset, 2
FOR o = 0 TO (perset - 1)
loadsprite placer(), 0, size * o, soff * (j - top), xw, yw, 3
stosprite placer(), 0, size * o, 0, 2
NEXT o
storeset game$ + file$ + CHR$(0), j, 0
RETURN

loadwuc:
setpicstuf buffer(), size * perset, 2
loadset game$ + file$ + CHR$(0), j, 0
FOR o = 0 TO (perset - 1)
loadsprite placer(), 0, size * o, 0, xw, yw, 2
stosprite placer(), 0, size * o, soff * (j - top), 3
NEXT o
RETURN

donedraw:
DEF SEG = VARSEG(pal(0)): BSAVE game$ + ".pal", VARPTR(pal(0)), 1600
FOR j = top TO top + atatime: GOSUB savewuc: NEXT j
clearpage 0
clearpage 1
clearpage 2
clearpage 3

END SUB

SUB testanimpattern (tastuf(), taset, timing(), vpage, dpage, buffer())

DIM cycle(1), sample(7), cycptr(1), cycskip(1)

clearpage vpage
clearpage dpage

sample(0) = 3
sample(1) = 3
buffer(0) = 16
buffer(1) = 3
setmapdata buffer(), buffer(), 10, 130
FOR i = 0 TO 47
 y = INT(i / 16)
 x = i - y * 16
 setmapblock x, y, tastuf(20 * taset) + i
NEXT i

GOSUB setupsample

setkeys
DO
 setwait timing(), 100
 setkeys
 tog = tog XOR 1
 
 IF keyval(1) > 1 THEN GOTO donetap
 IF keyval(72) > 1 THEN csr = loopvar(csr, 0, 47, -16): GOSUB setupsample
 IF keyval(80) > 1 THEN csr = loopvar(csr, 0, 47, 16): GOSUB setupsample
 IF keyval(75) > 1 THEN csr = loopvar(csr, 0, 47, -1): GOSUB setupsample
 IF keyval(77) > 1 THEN csr = loopvar(csr, 0, 47, 1): GOSUB setupsample
 SWAP vpage, dpage
 setvispage vpage
'--draw available animating tiles--
 setmapdata buffer(), buffer(), 10, 130
 drawmap 0, -10, 0, dpage
'--draw sample--
 setmapdata sample(), sample(), 100, 40
 setanim tastuf(0) + cycle(0), tastuf(20) + cycle(1)
 cycletile cycle(), tastuf(), cycptr(), cycskip()
 drawmap -130, -100, 0, dpage
'--Draw cursor--
 y = INT(csr / 16)
 x = csr - y * 16
 rectangle 20 * x, 10 + 20 * y, 20, 1, 14 + tog, dpage
 rectangle 20 * x, 10 + 20 * y, 1, 20, 14 + tog, dpage
 rectangle 20 * x, 29 + 20 * y, 20, 1, 14 + tog, dpage
 rectangle 20 * x + 19, 10 + 20 * y, 1, 20, 14 + tog, dpage

 dowait
LOOP

setupsample:
 setmapdata sample(), sample(), 100, 70
 FOR i = 0 TO 8
  y = INT(i / 3)
  x = i - y * 3
  setmapblock x, y, 160 + (taset * 48) + csr
 NEXT i
RETURN

donetap:

END SUB

