'OHRRPGCE CUSTOM - More misc unsorted routines
'(C) Copyright 1997-2005 James Paige and Hamster Republic Productions
'Please read LICENSE.txt for GPL License details and disclaimer of liability
'See README.txt for code docs and apologies for crappyness of this code ;)
'
'$DYNAMIC
DEFINT A-Z

'Types

TYPE triggerset
 size AS INTEGER
 tnames AS STRING PTR
 ids AS INTEGER PTR
 usedbits AS UNSIGNED INTEGER PTR
END TYPE

#include "udts.bi"
#include "const.bi"

'basic subs and functions
DECLARE SUB stredit (s$, maxl%)
DECLARE FUNCTION str2lng& (stri$)
DECLARE FUNCTION str2int% (stri$)
DECLARE FUNCTION filenum$ (n%)
DECLARE SUB writeconstant (filehandle%, num%, names AS STRING, unique$(), prefix$)
DECLARE SUB writeglobalstring (index%, s$, maxlen%)
DECLARE FUNCTION numbertail$ (s$)
DECLARE SUB cropafter (index%, limit%, flushafter%, lump$, bytes%, prompt%)
DECLARE FUNCTION isunique% (s$, u$(), r%)
DECLARE SUB exportnames ()
DECLARE FUNCTION exclude$ (s$, x$)
DECLARE FUNCTION exclusive$ (s$, x$)
DECLARE SUB testanimpattern (tastuf%(), taset%)
DECLARE FUNCTION boxconditionheroname$ (num%, cond%())
DECLARE SUB editbitset (array%(), wof%, last%, names() AS STRING)
DECLARE SUB formation ()
DECLARE SUB enemydata ()
DECLARE SUB herodata ()
DECLARE SUB attackdata ()
DECLARE SUB getnames (stat$(), max%)
DECLARE SUB statname ()
DECLARE SUB textage ()
DECLARE FUNCTION sublist% (num%, s$())
DECLARE SUB maptile (font%())
DECLARE SUB addtrigger (scrname$, id%, BYREF triggers AS TRIGGERSET)
DECLARE FUNCTION scriptbrowse$ (trigger%, triggertype%, scrtype$)
DECLARE FUNCTION scrintgrabber (n%, BYVAL min%, BYVAL max%, BYVAL less%, BYVAL more%, scriptside%, triggertype%)
DECLARE FUNCTION textbox_condition_caption(tag AS INTEGER, prefix AS STRING = "") AS STRING

#include "compat.bi"
#include "allmodex.bi"
#include "common.bi"
#include "customsubs.bi"
#include "loading.bi"
#include "cglobals.bi"

#include "scrconst.bi"

'--Local subs and functions
DECLARE SUB write_box_conditional_by_menu_index(BYREF box AS TextBox, menuindex AS INTEGER, num AS INTEGER)
DECLARE FUNCTION read_box_conditional_by_menu_index(BYREF box AS TextBox, menuindex AS INTEGER) AS INTEGER
DECLARE FUNCTION box_conditional_type_by_menu_index(menuindex AS INTEGER) AS INTEGER

'These are used in the TextBox conditional editor
CONST condEXIT   = -1
CONST condTAG    = 0
CONST condBATTLE = 1
CONST condSHOP   = 2
CONST condHERO   = 3
CONST condMONEY  = 4
CONST condDOOR   = 5
CONST condITEM   = 6
CONST condBOX    = 7
CONST condMENU   = 8

dim shared shop as string

REM $STATIC
SUB cropafter (index, limit, flushafter, lump$, bytes, prompt)

'if bytes is negative, then pages are used. flushafter becomes the working page number

'flushafter -1 = no flush
'flushafter 0 = record flush

DIM menu$(1)

IF prompt THEN
 menu$(0) = "No do not delete anything"
 menu$(1) = "Yes, delete all records after this one"
 IF sublist(1, menu$()) < 1 THEN
  setkeys
  EXIT SUB
 ELSE
  setkeys
 END IF
END IF

IF bytes >= 0 THEN
 setpicstuf buffer(), bytes, -1
 FOR i = 0 TO index
  loadset lump$, i, 0
  storeset tmpdir & "_cropped.tmp", i, 0
 NEXT i
 IF flushafter THEN
  flusharray buffer(), INT(bytes / 2) + 1, 0
  FOR i = index + 1 TO limit
   storeset tmpdir & "_cropped.tmp", i, 0
  NEXT i
 ELSE
  limit = index
 END IF
 
ELSE '--use pages instead of sets
 FOR i = 0 TO index
  loadpage lump$, i, flushafter
  storepage tmpdir & "_cropped.tmp", i, flushafter
 NEXT i
 limit = index
 
END IF'--separate setpicstuf

copyfile tmpdir & "_cropped.tmp", lump$
safekill tmpdir & "_cropped.tmp"

END SUB

SUB exportnames ()

DIM u$(1024), names(32) AS STRING, stat$(11)
DIM her AS HeroDef
DIM menu_set AS MenuSet
menu_set.menufile = workingdir & SLASH & "menus.bin"
menu_set.itemfile = workingdir & SLASH & "menuitem.bin"

max = 32

getnames names(), max
stat$(0) = names(0)
stat$(1) = names(1)
stat$(2) = names(2)
stat$(3) = names(3)
stat$(4) = names(5)
stat$(5) = names(6)
stat$(6) = names(29)
stat$(7) = names(30)
stat$(8) = names(8)
stat$(9) = names(7)
stat$(10) = names(31)
stat$(11) = names(4)

outf$ = trimextension$(gamefile) + ".hsi"

clearpage 0
clearpage 1
setvispage 0
textcolor uilook(uiText), 0
pl = 0
printstr "exporting HamsterSpeak Definitions to:", 0, pl * 8, 0: pl = pl + 1
printstr RIGHT$(outf$, 40), 0, pl * 8, 0: pl = pl + 1
'Need to call this quite a lot to refresh the screen for FB. Bit of a
'compromise between showing the process and slowing things down, since
'it will copy the page data every time.
setvispage 0

fh = FREEFILE
OPEN outf$ FOR OUTPUT AS #fh
PRINT #fh, "# HamsterSpeak constant definitions for " & trimpath$(gamefile)
PRINT #fh, ""
PRINT #fh, "define constant, begin"

printstr "tag names", 0, pl * 8, 0: pl = pl + 1
isunique "", u$(), 1
FOR i = 2 TO 999
 writeconstant fh, i, load_tag_name(i), u$(), "tag"
NEXT i

printstr "song names", 0, pl * 8, 0: pl = pl + 1
isunique "", u$(), 1
FOR i = 0 TO gen(genMaxSong)
 writeconstant fh, i, getsongname$(i), u$(), "song"
NEXT i
setvispage 0

printstr "sound effect names", 0, pl * 8, 0: pl = pl + 1
isunique "", u$(), 1
FOR i = 0 TO gen(genMaxSFX)
 writeconstant fh, i, getsfxname$(i), u$(), "sfx"
NEXT i
setvispage 0

printstr "hero names", 0, pl * 8, 0: pl = pl + 1
isunique "", u$(), 1
FOR i = 0 TO gen(genMaxHero)
 loadherodata @her, i
 writeconstant fh, i, her.name, u$(), "hero"
NEXT i

printstr "item names", 0, pl * 8, 0: pl = pl + 1
isunique "", u$(), 1
FOR i = 0 TO gen(genMaxItem)
 writeconstant fh, i, readitemname$(i), u$(), "item"
NEXT i
setvispage 0

printstr "stat names", 0, pl * 8, 0: pl = pl + 1
isunique "", u$(), 1
FOR i = 0 TO 11
 writeconstant fh, i, stat$(i), u$(), "stat"
NEXT i

printstr "slot names", 0, pl * 8, 0: pl = pl + 1
isunique "", u$(), 1
writeconstant fh, 1, "Weapon", u$(), "slot"
FOR i = 0 TO 3
 writeconstant fh, i + 2, names(25 + i), u$(), "slot"
NEXT i
setvispage 0

printstr "map names", 0, pl * 8, 0: pl = pl + 1
isunique "", u$(), 1
FOR i = 0 TO gen(genMaxMap)
 writeconstant fh, i, getmapname$(i), u$(), "map"
NEXT i

printstr "attack names", 0, pl * 8, 0: pl = pl + 1
isunique "", u$(), 1
FOR i = 0 TO gen(genMaxAttack)
 writeconstant fh, i + 1, readattackname$(i), u$(), "atk"
NEXT i
setvispage 0

printstr "shop names", 0, pl * 8, 0: pl = pl + 1
isunique "", u$(), 1
FOR i = 0 TO gen(genMaxShop)
 writeconstant fh, i, readshopname$(i), u$(), "shop"
NEXT i
setvispage 0

printstr "menu names", 0, pl * 8, 0: pl = pl + 1
isunique "", u$(), 1
FOR i = 0 TO gen(genMaxMenu)
 writeconstant fh, i, getmenuname(i), u$(), "menu"
NEXT i
setvispage 0

printstr "enemy names", 0, pl * 8, 0: pl = pl + 1
isunique "", u$(), 1
FOR i = 0 TO gen(genMaxEnemy)
 writeconstant fh, i, readenemyname$(i), u$(), "enemy"
NEXT i
setvispage 0

PRINT #fh, "end"
CLOSE #fh

printstr "done", 0, pl * 8, 0: pl = pl + 1
setvispage 0
w = getkey

END SUB

SUB getnames (stat$(), max)

fh = FREEFILE

OPEN game + ".stt" FOR BINARY AS #fh

FOR i = 0 TO max
 temp$ = CHR$(0)
 GET #fh, 1 + (11 * i), temp$
 temp = 0: IF temp$ <> "" THEN temp = ASC(temp$)
 stat$(i) = ""
 FOR o = 1 TO small(temp, 20)
  temp$ = " "
  GET #fh, 1 + (11 * i) + o, temp$
  stat$(i) = stat$(i) + temp$
 NEXT o
NEXT i

CLOSE #fh

END SUB

SUB addtrigger (scrname$, id, triggers AS TRIGGERSET)
 WITH triggers
  FOR i = 0 TO .size - 1
   IF .tnames[i] = scrname$ THEN
    .ids[i] = id
    .usedbits[i \ 32] = BITSET(.usedbits[i \ 32], i MOD 32)
    EXIT SUB
   END IF
  NEXT

  'add to the end
  .tnames[.size] = scrname$
  .ids[.size] = id
  .usedbits[.size \ 32] = BITSET(.usedbits[.size \ 32], .size MOD 32)

  'expand
  .size += 1
  IF .size MOD 32 = 0 THEN
   allocnum = .size + 32
   .usedbits = REALLOCATE(.usedbits, allocnum \ 8)  'bits/byte
   .ids = REALLOCATE(.ids, allocnum * SIZEOF(INTEGER))
   .tnames = REALLOCATE(.tnames, allocnum * SIZEOF(STRING))

   IF .usedbits = 0 OR .ids = 0 OR .tnames = 0 THEN fatalerror "Could not allocate memory for script importation"

   FOR i = .size TO allocnum - 1
    .ids[i] = 0
    .tnames[i] = ""
   NEXT
   .usedbits[.size \ 32] = 0
  END IF
 END WITH
END SUB

SUB importscripts (f$)
 DIM triggers(1 TO 15) AS triggerset, triggercount(15), temp AS SHORT

 setpicstuf buffer(), 7, -1
 loadset f$, 0, 0
 reset_console
 IF buffer(0) = 21320 AND buffer(1) = 0 THEN

  copyfile f$, game + ".hsp"
  textcolor uilook(uiMenuItem), 0
  unlumpfile(game + ".hsp", "scripts.bin", tmpdir)
  IF isfile(tmpdir & "scripts.bin") THEN
   dotbin = -1
   fptr = FREEFILE
   OPEN tmpdir + "scripts.bin" FOR BINARY AS #fptr
   'load header
   GET #fptr, , temp
   headersize = temp
   GET #fptr, , temp
   recordsize = temp
   SEEK #fptr, headersize + 1
  ELSE
   dotbin = 0
   unlumpfile(game + ".hsp", "scripts.txt", tmpdir)
   fptr = FREEFILE
   OPEN tmpdir & "scripts.txt" FOR INPUT AS #fptr
  END IF

  'load in existing trigger tables
  FOR i = 1 TO 15
   WITH triggers(i)
    fh = 0
    .size = 0
    fname$ = workingdir + SLASH + "lookup" + STR$(i) + ".bin"
    IF isfile(fname$) THEN
     fh = FREEFILE
     OPEN fname$ FOR BINARY AS #fh
     .size = LOF(fh) \ 40
    END IF

    'number of triggers rounded to next multiple of 32 (as triggers get added, allocate space for 32 at a time)
    allocnum = (.size \ 32) * 32 + 32
    .ids = CALLOCATE(allocnum, SIZEOF(INTEGER))
    .tnames = CALLOCATE(allocnum, SIZEOF(STRING))
    .usedbits = CALLOCATE(allocnum \ 8)

    IF .usedbits = 0 OR .ids = 0 OR .tnames = 0 THEN fatalerror "Could not allocate memory for script importation"
    FOR j = 0 TO allocnum - 1: .tnames[j] = "": NEXT
   
    IF fh THEN
     FOR j = 0 TO .size - 1
      loadrecord buffer(), fh, 20, j
      .ids[j] = buffer(0)
      .tnames[j] = readbinstring$(buffer(), 1, 36)
     NEXT
     CLOSE fh
    END IF
   END WITH
  NEXT

  gen(40) = 0
  gen(43) = 0
  viscount = 0
  DIM names AS STRING = ""
  DO
   IF EOF(fptr) THEN EXIT DO
   IF dotbin THEN 
    'read from scripts.bin
    loadrecord buffer(), fptr, recordsize \ 2
    id = buffer(0)
    trigger = buffer(1)
    names = readbinstring$(buffer(), 2, 36)
   ELSE
    'read from scripts.txt
    LINE INPUT #fptr, names
    LINE INPUT #fptr, num$
    LINE INPUT #fptr, argc$
    FOR i = 1 TO str2int(argc$)
     LINE INPUT #fptr, dummy$
    NEXT i
    id = str2int(num$)
    trigger = 0
    names = LEFT$(names, 36)
   END IF

   'save to plotscr.lst
   buffer(0) = id
   writebinstring names, buffer(), 1, 36
   storerecord buffer(), workingdir + SLASH + "plotscr.lst", 20, gen(40)
   gen(40) = gen(40) + 1
   IF buffer(0) > gen(43) AND buffer(0) < 16384 THEN gen(43) = buffer(0)

   'process trigger
   IF trigger > 0 AND trigger < 16 THEN
    addtrigger names, id, triggers(trigger)
    triggercount(trigger) += 1
   END IF

   'display progress
   IF id < 16384 OR trigger > 0 THEN
    viscount = viscount + 1
    append_message names & ", "
   END IF
  LOOP

  'output the updated trigger tables
  FOR i = 1 TO 15
   WITH triggers(i)
    FOR j = 0 TO .size - 1
     IF BIT(.usedbits[j \ 32], j MOD 32) = 0 THEN .ids[j] = 0
     buffer(0) = .ids[j]
     writebinstring .tnames[j], buffer(), 1, 36
     storerecord buffer(), workingdir + SLASH + "lookup" + STR$(i) + ".bin", 20, j
    NEXT

    DEALLOCATE(.ids)
    DEALLOCATE(.tnames)
    DEALLOCATE(.usedbits)
   END WITH
  NEXT

  CLOSE #fptr
  IF dotbin THEN safekill tmpdir & "scripts.bin" ELSE safekill tmpdir & "scripts.txt"
  
  textcolor uilook(uiText), 0
  show_message "imported " & viscount & " scripts"

 ELSE
  texty = 0
  printstr f$, 0, texty * 8, vpage: texty = texty + 1
  printstr "is not really a compiled .hs file.", 0, texty * 8, vpage: texty = texty + 1
  printstr "Did you create it by compiling a", 0, texty * 8, vpage: texty = texty + 1
  printstr "script file with hspeak.exe, or did", 0, texty * 8, vpage: texty = texty + 1
  printstr "you just give your script a name that", 0, texty * 8, vpage: texty = texty + 1
  printstr "ends in .hs and hoped it would work?", 0, texty * 8, vpage: texty = texty + 1
  printstr "Use hspeak.exe to create real .hs files", 0, texty * 8, vpage: texty = texty + 1
  setvispage vpage 'force refresh for FB
 END IF
 w = getkey
END SUB

FUNCTION isunique (s$, u$(), r)
STATIC uptr

IF r THEN '--reset
 FOR i = 0 TO uptr
  u$(i) = s$
 NEXT i
 uptr = -1
 EXIT FUNCTION
END IF

IF s$ = "" THEN isunique = -1: EXIT FUNCTION

FOR i = 0 TO uptr
 IF LCASE$(s$) = u$(i) THEN isunique = 0: EXIT FUNCTION
NEXT i

uptr = small(uptr + 1, 1024)'--gives up trying after 1024 records
u$(uptr) = LCASE$(s$)
isunique = -1

END FUNCTION

SUB scriptman ()
STATIC defaultdir$
DIM menu$(5)

menumax = 2
menu$(0) = "Previous Menu"
menu$(1) = "export names for scripts (.hsi)"
menu$(2) = "import compiled plotscripts (.hs)"

pt = 0
setkeys
DO
 setwait 55
 setkeys
 tog = tog XOR 1
 IF keyval(1) > 1 THEN EXIT DO
 usemenu pt, 0, 0, menumax, 24
 IF enter_or_space() THEN
  SELECT CASE pt
   CASE 0
    EXIT DO
   CASE 1
    exportnames
   CASE 2
    f$ = browse(0, defaultdir$, "*.hs", "")
    IF f$ <> "" THEN
     importscripts f$
    END IF
  END SELECT
 END IF
 
 standardmenu menu$(), menumax, 22, pt, 0, 0, 0, dpage, 0
 
 SWAP vpage, dpage
 setvispage vpage
 copypage 3, dpage
 dowait
LOOP
END SUB

SUB statname
max = 122
DIM stat$(-1 TO max), names(-1 TO max) AS STRING, maxlen(max)
DIM state AS MenuState
DIM rect AS RectType
rect.wide = 320
rect.high = 192
clearpage 0
clearpage 1

'--load current names
getnames stat$(), 32 '--undefaulted

FOR i = 0 TO max
 SELECT CASE i
  CASE 55, 74 TO 76, 78, 80 TO 86, 88 TO 92, 97 TO 98, 106 TO 115
   maxlen(i) = 20
  CASE 39, 40
   maxlen(i) = 8
  CASE 94 TO 96, 105
   maxlen(i) = 30
  CASE ELSE
   maxlen(i) = 10
 END SELECT
NEXT i

names(-1) = "Back to Previous Menu" : stat$(-1) = ""
names(0) = "Health Points"
names(1) = "Spell Points"
names(2) = "Attack Power"
names(3) = "Accuracy"
names(4) = "Extra Hits"
names(5) = "Blocking Power"
names(6) = "Dodge Rate"
names(7) = "Counter Rate"
names(8) = "Speed"
FOR i = 1 TO 8
 names(8 + i) = "Enemy Type" + XSTR$(i)
 names(16 + i) = "Elemental" + XSTR$(i)
NEXT i
FOR i = 1 TO 4
 names(24 + i) = "Armor" + XSTR$(i)
NEXT i
names(29) = "Spell Skill"
names(30) = "Spell Block"
names(31) = "Spell cost %"
names(32) = "Money"
names(33) = "Experience":              stat$(33) = readglobalstring$(33, "Experience", 10)
names(34) = "Battle Item Menu":        stat$(34) = readglobalstring$(34, "Item", 10)
names(35) = "Exit Item Menu":          stat$(35) = readglobalstring$(35, "DONE", 10)
names(36) = "Sort Item Menu":          stat$(36) = readglobalstring$(36, "AUTOSORT", 10)
names(37) = "Drop Item":               stat$(37) = readglobalstring$(37, "TRASH", 10)
names(38) = "Weapon":                  stat$(38) = readglobalstring$(38, "Weapon", 10)
names(39) = "Unequip All":             stat$(39) = readglobalstring$(39, "-REMOVE-", 10)
names(40) = "Exit Equip":              stat$(40) = readglobalstring$(40, "-EXIT-", 10)
names(41) = "Drop Prompt":             stat$(41) = readglobalstring$(41, "Discard", 10)
names(42) = "Negative Drop Prefix":    stat$(42) = readglobalstring$(42, "Cannot", 10)
names(43) = "Level":                   stat$(43) = readglobalstring$(43, "Level", 10)
names(44) = "Overwrite Save Yes":      stat$(44) = readglobalstring$(44, "Yes", 10)
names(45) = "Overwrite Save No":       stat$(45) = readglobalstring$(45, "No", 10)
names(46) = "Exit Spell List Menu":    stat$(46) = readglobalstring$(46, "EXIT", 10)
names(47) = "(exp) for next (level)":  stat$(47) = readglobalstring$(47, "for next", 10)
names(48) = "Remove Hero from Team":   stat$(48) = readglobalstring$(48, "REMOVE", 10)
names(49) = "Pay at Inn":              stat$(49) = readglobalstring$(49, "Pay", 10)
names(50) = "Cancel Inn":              stat$(50) = readglobalstring$(50, "Cancel", 10)
names(51) = "Cancel Spell Menu":       stat$(51) = readglobalstring$(51, "(CANCEL)", 10)
names(52) = "New Game":                stat$(52) = readglobalstring$(52, "NEW GAME", 10)
names(53) = "Exit Game":               stat$(53) = readglobalstring$(53, "EXIT", 10)
names(54) = "Pause":                   stat$(54) = readglobalstring$(54, "PAUSE", 10)
names(55) = "Quit Playing Prompt":     stat$(55) = readglobalstring$(55, "Quit Playing?", 20)
names(56) = "Quit Playing Yes":        stat$(56) = readglobalstring$(57, "Yes", 10)
names(57) = "Quit Playing No":         stat$(57) = readglobalstring$(58, "No", 10)
names(58) = "Cancel Save":             stat$(58) = readglobalstring$(59, "CANCEL", 10)
names(59) = "Menu: Items":             stat$(59) = readglobalstring$(60, "Items", 10)
names(60) = "Menu: Spells":            stat$(60) = readglobalstring$(61, "Spells", 10)
names(61) = "Menu: Status":            stat$(61) = readglobalstring$(62, "Status", 10)
names(62) = "Menu: Equip":             stat$(62) = readglobalstring$(63, "Equip", 10)
names(63) = "Menu: Order":             stat$(63) = readglobalstring$(64, "Order", 10)
names(64) = "Menu: Team":              stat$(64) = readglobalstring$(65, "Team", 10)
names(65) = "Menu: Save":              stat$(65) = readglobalstring$(66, "Save", 10)
names(66) = "Menu: Quit":              stat$(66) = readglobalstring$(67, "Quit", 10)
names(67) = "Menu: Minimap":           stat$(67) = readglobalstring$(68, "Map", 10)
names(68) = "Volume Control":          stat$(68) = readglobalstring$(69, "Volume", 10)
names(69) = "Shop Menu: Buy":          stat$(69) = readglobalstring$(70, "Buy", 10)
names(70) = "Shop Menu: Sell":         stat$(70) = readglobalstring$(71, "Sell", 10)
names(71) = "Shop Menu: Inn":          stat$(71) = readglobalstring$(72, "Inn", 10)
names(72) = "Shop Menu: Hire":         stat$(72) = readglobalstring$(73, "Hire", 10)
names(73) = "Shop Menu: Exit":         stat$(73) = readglobalstring$(74, "Exit", 10)
names(74) = "Unsellable item warning": stat$(74) = readglobalstring$(75, "CANNOT SELL", 20)
names(75) = "Sell value prefix":       stat$(75) = readglobalstring$(77, "Worth", 20)
names(76) = "Sell trade prefix":       stat$(76) = readglobalstring$(79, "Trade for", 20)
names(77) = "($) and a (item)":        stat$(77) = readglobalstring$(81, "and a", 10)
names(78) = "Worthless item warning":  stat$(78) = readglobalstring$(82, "Worth Nothing", 20)
names(79) = "Sell alert":              stat$(79) = readglobalstring$(84, "Sold", 10)
names(80) = "Buy trade prefix":        stat$(80) = readglobalstring$(85, "Trade for", 20)
names(81) = "Hire price prefix":       stat$(81) = readglobalstring$(87, "Joins for", 20)
names(82) = "Cannot buy prefix":       stat$(82) = readglobalstring$(89, "Cannot Afford", 20)
names(83) = "Cannot hire prefix":      stat$(83) = readglobalstring$(91, "Cannot Hire", 20)
names(84) = "Buy alert":               stat$(84) = readglobalstring$(93, "Purchased", 20)
names(85) = "Hire alert (suffix)":     stat$(85) = readglobalstring$(95, "Joined!", 20)
names(86) = "(#) in stock":            stat$(86) = readglobalstring$(97, "in stock", 20)
names(87) = "Equipability prefix":     stat$(87) = readglobalstring$(99, "Equip:", 10)
names(88) = "Party full warning":      stat$(88) = readglobalstring$(100, "No Room In Party", 20)
names(89) = "Replace Save Prompt":     stat$(89) = readglobalstring$(102, "Replace Old Data?", 20)
names(90) = "Status Prompt":           stat$(90) = readglobalstring$(104, "Who's Status?", 20)
names(91) = "Spells Prompt":           stat$(91) = readglobalstring$(106, "Who's Spells?", 20)
names(92) = "Equip Prompt":            stat$(92) = readglobalstring$(108, "Equip Who?", 20)
names(93) = "Equip Nothing (unequip)": stat$(93) = readglobalstring$(110, "Nothing", 10)
names(94) = "Nothing to Steal":        stat$(94) = readglobalstring$(111, "Has Nothing", 30)
names(95) = "Steal Failure":           stat$(95) = readglobalstring$(114, "Cannot Steal", 30)
names(96) = "Stole (itemname)":        stat$(96) = readglobalstring$(117, "Stole", 30)
names(97) = "When an Attack Misses":   stat$(97) = readglobalstring$(120, "miss", 20)
names(98) = "When a Spell Fails":      stat$(98) = readglobalstring$(122, "fail", 20)
names(99) = "(hero) learned (spell)":  stat$(99) = readglobalstring$(124, "learned", 10)
names(100) = "Found (gold)":           stat$(100) = readglobalstring$(125, "Found", 10)
names(101) = "Gained (experience)":    stat$(101) = readglobalstring$(126, "Gained", 10)
names(102) = "Weak to (elemental)":    stat$(102) = readglobalstring$(127, "Weak to", 10)
names(103) = "Strong to (elemental)":  stat$(103) = readglobalstring$(128, "Strong to", 10)
names(104) = "Absorbs (elemental)":    stat$(104) = readglobalstring$(129, "Absorbs", 10)
names(105) = "No Elemental Effects":   stat$(105) = readglobalstring$(130, "No Elemental Effects", 30)
names(106) = "(hero) has no spells":   stat$(106) = readglobalstring$(133, "has no spells", 20)
names(107) = "Plotscript: pick hero":  stat$(107) = readglobalstring$(135, "Which Hero?", 20)
names(108) = "Hero name prompt":       stat$(108) = readglobalstring$(137, "Name the Hero", 20)
names(109) = "Found a (item)":         stat$(109) = readglobalstring$(139, "Found a", 20)
names(110) = "Found (number) (items)": stat$(110) = readglobalstring$(141, "Found", 20)
names(111) = "THE INN COSTS (# gold)": stat$(111) = readglobalstring$(143, "THE INN COSTS", 20)
names(112) = "You have (# gold)":      stat$(112) = readglobalstring$(145, "You have", 20)
names(113) = "CANNOT RUN!":            stat$(113) = readglobalstring$(147, "CANNOT RUN!", 20)
names(114) = "Level up for (hero)":    stat$(114) = readglobalstring$(149, "Level up for", 20)
names(115) = "(#) levels for (hero)":  stat$(115) = readglobalstring$(151, "levels for", 20)
names(116) = "($) and (number) (item)":stat$(116) = readglobalstring$(153, "and", 10)
names(117) = "day":                    stat$(117) = readglobalstring$(154, "day", 10)
names(118) = "days":                   stat$(118) = readglobalstring$(155, "days", 10)
names(119) = "hour":                   stat$(119) = readglobalstring$(156, "hour", 10)
names(120) = "hours":                  stat$(120) = readglobalstring$(157, "hours", 10)
names(121) = "minute":                 stat$(121) = readglobalstring$(158, "minute", 10)
names(122) = "minutes":                stat$(122) = readglobalstring$(159, "minutes", 10)

'names() = "":      stat$() = readglobalstring$(, "", 10)
'NOTE: if you add global strings here, be sure to update the limit-checking on
'the implementation of the "get global string" plotscripting command

state.top = -1
state.pt = -1
state.first = -1
state.last = max
state.size = 22
setkeys
DO
 setwait 55
 setkeys
 IF keyval(1) > 1 THEN EXIT DO
 usemenu state
 IF state.pt = -1 THEN
  IF enter_or_space() THEN EXIT DO
 ELSE
  strgrabber stat$(state.pt), maxlen(state.pt)
 END IF
 
 standardmenu names(), state, 0, 0, dpage
 standardmenu stat$(), state, 232, 0, dpage
 draw_scrollbar state, rect, max + 1, 0, dpage
 IF state.pt >= 0 THEN
  edgeboxstyle 160 - (maxlen(state.pt) * 4), 191, 8 * maxlen(state.pt) + 4, 8, 0, dpage, NO, YES
  edgeprint stat$(state.pt), 162 - (maxlen(state.pt) * 4), 191, uilook(uiText), dpage
 END IF
 SWAP vpage, dpage
 setvispage vpage
 clearpage dpage
 dowait
LOOP
j = 0
FOR i = 0 TO max
 writeglobalstring j, stat$(i), maxlen(i)
 j = j + 1 + (maxlen(i) \ 11)
NEXT i
clearpage 0
clearpage 1
EXIT SUB

END SUB

FUNCTION sublist (num, s$())
clearpage 0
clearpage 1
pt = 0

setkeys
DO
 setwait 55
 setkeys
 usemenu pt, 0, 0, num, 22
 IF keyval(1) > 1 THEN
  sublist = -1
  EXIT DO
 END IF
 IF enter_or_space() THEN
  sublist = pt
  EXIT DO
 END IF
 tog = tog XOR 1
 standardmenu s$(), num, 22, pt, 0, 0, 0, dpage, 0
 SWAP dpage, vpage
 setvispage vpage
 clearpage dpage
 dowait
LOOP

clearpage 0
clearpage 1

END FUNCTION

SUB textage
DIM m$(10), menu$(-1 TO 22), grey(-1 TO 22), h$(2), tagmn$, gcsr, tcur
DIM boxbuf(dimbinsize(binSAY))
DIM box AS TextBox
DIM boxcopier AS TextBox ' FIXME: Move this to clearlines when it gets SUBified
pt = 1

DIM state AS MenuState 'FIXME: only used in conditionals GOSUB block, move this here when that is SUBified
state.top = -1
state.pt = 0

'This array tells which rows in the conditional editor are grey
grey(-1) = NO
grey(0) = YES
grey(1) = NO
grey(2) = YES
grey(3) = NO
grey(4) = NO
grey(5) = YES
grey(6) = NO
grey(7) = YES
grey(8) = NO
grey(9) = YES
grey(10) = NO
grey(11) = YES
grey(12) = NO
grey(13) = YES
grey(14) = NO
grey(15) = NO
grey(16) = NO
grey(17) = YES
grey(18) = NO
grey(19) = YES
grey(20) = NO
grey(21) = YES 'Menu Tag
grey(22) = NO

m$(0) = "Return to Main Menu"
m$(1) = "Text Box"
m$(2) = "Edit Text"
m$(3) = "Edit Conditionals"
m$(4) = "Edit Choice"
m$(5) = "Box Appearance"
m$(6) = "Next:"
m$(7) = "Text Search:"
search$ = ""
csr = 0
GOSUB loadlines
setkeys
DO
 setwait 55
 setkeys
 tog = tog XOR 1
 IF keyval(1) > 1 THEN EXIT DO
 IF keyval(29) > 0 AND keyval(14) > 0 THEN
  GOSUB savelines
  cropafter pt, gen(39), 0, game + ".say", 400, 1
  GOSUB loadlines
 END IF
 usemenu csr, 0, 0, 7, 24
 remptr = pt
 SELECT CASE csr
  CASE 7'textsearch
   strgrabber search$, 36
  CASE 6'quickchainer
   IF scrintgrabber(box.after, 0, gen(genMaxTextbox), 75, 77, -1, plottrigger) THEN
    GOSUB nextboxline 
   END IF'--modify next
  CASE ELSE '--not using the quick textbox chainer
   IF intgrabber(pt, 0, gen(39), 51, 52) THEN
    SWAP pt, remptr
    GOSUB savelines
    SWAP pt, remptr
    GOSUB loadlines
   END IF
   IF keyval(75) > 1 AND pt > 0 THEN
    GOSUB savelines
    pt = pt - 1
    GOSUB loadlines
   END IF
   IF keyval(77) > 1 AND pt < 32767 THEN
    GOSUB savelines
    pt = pt + 1
    IF needaddset(pt, gen(39), "text box") THEN GOSUB clearlines
    GOSUB loadlines
   END IF'--next/add text box
 END SELECT
 IF enter_or_space() THEN
  IF csr = 0 THEN EXIT DO
  IF csr = 2 THEN GOSUB picktext
  IF csr = 3 THEN
   GOSUB conditions
   GOSUB nextboxline
  END IF
  IF csr = 4 THEN GOSUB tchoice
  IF csr = 5 THEN GOSUB groovybox
  IF csr = 6 THEN
   IF box.after > 0 THEN
    GOSUB savelines
    pt = box.after
    GOSUB loadlines
   ELSE
    temptrig = ABS(box.after)
    dummy$ = scriptbrowse$(temptrig, plottrigger, "textbox plotscript")
    box.after = -temptrig
    GOSUB nextboxline
   END IF
  END IF
  IF csr = 7 AND keyval(28) > 1 THEN
   GOSUB savelines
   GOSUB seektextbox
   GOSUB loadlines
  END IF
 END IF
 textcolor uilook(uiMenuItem), 0
 IF csr = 1 THEN textcolor uilook(uiSelectedItem + tog), 0
 printstr XSTR$(pt), 64, 8, dpage
 m$(7) = "Text Search:" + search$
 
 standardmenu m$(), 7, 7, csr, 0, 0, 0, dpage, 0

 '--Draw box
 IF box.no_box = NO THEN
  edgeboxstyle 4, 96, 312, 88 - box.shrink * 4, box.boxstyle, dpage, (box.opaque = NO)
 END IF
 '--Draw text lines
 FOR i = 0 TO 7
  edgeprint box.text(i), 8, 100 + i * 10, uilook(uiText), dpage
 NEXT i
 SWAP vpage, dpage
 setvispage vpage
 clearpage dpage
 dowait
LOOP
clearpage 0
clearpage 1
clearpage 2
clearpage 3
GOSUB savelines
EXIT SUB

nextboxline:
IF box.after = 0 THEN
 box.after_tag = 0
ELSE
 IF box.after_tag = 0 THEN box.after_tag = -1 ' Set "After" text box conditional to "Always"
END IF
SELECT CASE box.after_tag
 CASE 0
  m$(6) = "Next: None Selected"
 CASE -1
  IF box.after >= 0 THEN
   m$(6) = "Next: Box " & box.after
  ELSE
   m$(6) = "Next: script " & scriptname$(ABS(box.after), plottrigger)
  END IF
 CASE ELSE
  IF box.after >= 0 THEN
   m$(6) = "Next: Box " & box.after & " (conditional)"
  ELSE
   m$(6) = "Next: script " & scriptname$(ABS(box.after), plottrigger) & " (conditional)"
  END IF
END SELECT
RETRACE

conditions:

state.first = -1
state.last = 22
state.size = 21

GOSUB textcmenu
setkeys
DO
 setwait 55
 setkeys
 tog = tog XOR 1
 IF keyval(1) > 1 THEN RETRACE
 IF enter_or_space() THEN
  SELECT CASE state.pt
   CASE -1 '--Previous menu
    RETRACE
   CASE 1 '--instead script
    temptrig = large(-box.instead, 0)
    dummy$ = scriptbrowse$(temptrig, plottrigger, "instead of textbox plotscript")
    box.instead = -temptrig
   CASE 20 '--after script
    temptrig = large(-box.after, 0)
    dummy$ = scriptbrowse$(temptrig, plottrigger, "after textbox plotscript")
    box.after = -temptrig
  END SELECT
  GOSUB textcmenu
 END IF
 usemenu state
 IF keyval(83) > 1 THEN ' Pressed the delete key
  write_box_conditional_by_menu_index box, state.pt, 0
 END IF
 IF state.pt >= 0 THEN
  num = read_box_conditional_by_menu_index(box, state.pt)
  SELECT CASE box_conditional_type_by_menu_index(state.pt)
   CASE condTAG
    tag_grabber num
   CASE condBATTLE
    intgrabber num, 0, gen(genMaxFormation)
   CASE condSHOP
    intgrabber num, -32000, gen(genMaxShop) + 1
   CASE condHERO
    intgrabber num, -99, 99
   CASE condMONEY
    intgrabber num, -32000, 32000
   CASE condDOOR
    intgrabber num, 0, 199
   CASE condITEM
    xintgrabber num, 0, gen(genMaxItem), 0, -gen(genMaxItem)
   CASE condBOX
    scrintgrabber num, 0, gen(genMaxTextbox), 75, 77, -1, plottrigger
   CASE condMENU
    intgrabber num, 0, gen(genMaxMenu)
  END SELECT
  IF num <> read_box_conditional_by_menu_index(box, state.pt) THEN
   'The value has changed
   write_box_conditional_by_menu_index(box, state.pt, num)
   GOSUB textcmenu
  END IF
 END IF
 FOR i = state.top TO state.top + state.size
  textcolor uilook(uiMenuItem), 0
  IF grey(i) = YES THEN
   c = uilook(uiSelectedDisabled)
   SELECT CASE read_box_conditional_by_menu_index(box, i)
    CASE -1 ' Check tag 1=OFF always true
     c = uilook(uiHighlight)
    CASE 0 ' Check tag 0 never true
     c = uilook(uiDisabledItem)
   END SELECT
   rectangle 0, (i - state.top) * 9, 312, 8, c, dpage
  ELSE
   IF read_box_conditional_by_menu_index(box, i) = 0 THEN textcolor uilook(uiDisabledItem), 0
  END IF
  IF i = state.pt THEN textcolor uilook(uiSelectedItem + tog), 0
  printstr menu$(i), 0, (i - state.top) * 9, dpage
 NEXT i
 draw_fullscreen_scrollbar state, UBOUND(menu$) + 1, 0, dpage
 SWAP vpage, dpage
 setvispage vpage
 clearpage dpage
 dowait
LOOP

textcmenu:
menu$(-1) = "Go Back"
menu$(0) = textbox_condition_caption(box.instead_tag, "INSTEAD")
SELECT CASE box.instead
 CASE 0
  menu$(1) = " use [text box or script] instead"
 CASE IS < 0
  menu$(1) = " run " & scriptname$(-box.instead, plottrigger) & " instead"
 CASE IS > 0
  menu$(1) = " jump to text box " & box.instead & " instead"
END SELECT
menu$(2) = textbox_condition_caption(box.settag_tag, "SETTAG")
menu$(3) = tag_condition_caption(box.settag1, " set tag", "unchangeable", "unchangeable", "unchangeable")
menu$(4) = tag_condition_caption(box.settag2, " set tag", "unchangeable", "unchangeable", "unchangeable")
menu$(5) = textbox_condition_caption(box.money_tag, "MONEY")
IF box.money < 0 THEN
 menu$(6) = " lose " & ABS(box.money) & "$"
ELSE
 menu$(6) = " gain " & ABS(box.money) & "$"
END IF
menu$(7) = textbox_condition_caption(box.battle_tag, "BATTLE")
menu$(8) = " fight enemy formation " & box.battle
menu$(9) = textbox_condition_caption(box.item_tag, "ITEM")
SELECT CASE box.item
 CASE 0 :      menu$(10) = " do not add/remove items"
 CASE IS > 0 : menu$(10) = " add one " & load_item_name(ABS(box.item), 0, 0)
 CASE IS < 0 : menu$(10) = " remove one " & load_item_name(ABS(box.item), 0, 0)
END SELECT
menu$(11) = textbox_condition_caption(box.shop_tag, "SHOP")
SELECT CASE box.shop
 CASE IS > 0 : menu$(12) = " go to shop " & box.shop & " " & readshopname$(box.shop - 1)
 CASE IS < 0 : menu$(12) = " go to an Inn that costs " & -box.shop & "$"
 CASE 0 :      menu$(12) = " restore Hp and Mp [select shop here]"
END SELECT
menu$(13) = textbox_condition_caption(box.hero_tag, "HEROES")
SELECT CASE box.hero_addrem
 CASE 0 :      menu$(14) = " do not add/remove heros"
 CASE IS > 0 : menu$(14) = " add " & getheroname(ABS(box.hero_addrem) - 1) & " to party"
 CASE IS < 0 : menu$(14) = " remove " & getheroname(ABS(box.hero_addrem) - 1) & " from party"
END SELECT
SELECT CASE box.hero_swap
 CASE 0 :      menu$(15) = " do not swap in/out heros"
 CASE IS > 0 : menu$(15) = " swap in " & getheroname(ABS(box.hero_swap) - 1)
 CASE IS < 0 : menu$(15) = " swap out " & getheroname(ABS(box.hero_swap) - 1)
END SELECT
SELECT CASE box.hero_lock
 CASE 0 :      menu$(16) = " do not unlock/lock heros"
 CASE IS > 0 : menu$(16) = " unlock " & getheroname(ABS(box.hero_lock) - 1)
 CASE IS < 0 : menu$(16) = " lock " & getheroname(ABS(box.hero_lock) - 1)
END SELECT
menu$(17) = textbox_condition_caption(box.door_tag, "DOOR")
menu$(18) = " instantly use door " & box.door
menu$(19) = textbox_condition_caption(box.menu_tag, "MENU")
menu$(20) = " open menu " & box.menu & " " & getmenuname(box.menu)
menu$(21) = textbox_condition_caption(box.after_tag, "AFTER")
SELECT CASE box.after
 CASE 0 :      menu$(22) = " use [text box or script] next"
 CASE IS < 0 : menu$(22) = " run " & scriptname$(-box.after, plottrigger) & " next"
 CASE IS > 0 : menu$(22) = " jump to text box " & box.after & " next"
END SELECT
RETRACE

tchoice:
menu$(0) = "Go Back"
setkeys
DO
 setwait 55
 setkeys
 tog = tog XOR 1
 IF keyval(1) > 1 THEN RETRACE
 usemenu tcur, 0, 0, 5, 24
 IF enter_or_space() THEN
  IF tcur = 0 THEN RETRACE
  IF tcur = 1 THEN box.choice_enabled = (NOT box.choice_enabled)
 END IF
 IF tcur = 1 THEN
  IF keyval(75) > 1 OR keyval(77) > 1 THEN box.choice_enabled = (NOT box.choice_enabled)
 END IF
 FOR i = 0 TO 1
  IF tcur = 2 + (i * 2) THEN strgrabber box.choice(i), 15
  IF tcur = 3 + (i * 2) THEN tag_grabber box.choice_tag(i)
 NEXT i
 GOSUB tcmenu
 
 standardmenu menu$(), 5, 5, tcur, 0, 0, 8, dpage, 0
 
 SWAP vpage, dpage
 setvispage vpage
 clearpage dpage
 dowait
LOOP

tcmenu:
IF box.choice_enabled THEN menu$(1) = "Choice = Enabled" ELSE menu$(1) = "Choice = Disabled"
FOR i = 0 TO 1
 menu$(2 + (i * 2)) = "Option " & i & " text:" + box.choice(i)
 IF box.choice_tag(i) THEN
  menu$(3 + (i * 2)) = "Set tag " & ABS(box.choice_tag(i)) & " = " & onoroff$(box.choice_tag(i)) & " (" & load_tag_name(ABS(box.choice_tag(i))) & ")"
 ELSE
  menu$(3 + (i * 2)) = "Set tag 0 (none)"
 END IF
NEXT i
RETRACE

picktext:
y = 0
insert = -1
setkeys
DO
 setwait 55
 setkeys
 tog = tog XOR 1
 IF keyval(1) > 1 THEN RETRACE
 IF keyval(28) > 1 AND y < 7 THEN y = y + 1
 IF usemenu(y, 0, 0, 7, 24) THEN insert = -1
 IF y <= 7 AND y >= 0 THEN
  stredit box.text(y), 38
 END IF
 'Display the box
 IF box.no_box = NO THEN
  edgeboxstyle 4, 4, 312, 88, box.boxstyle, dpage, (box.opaque = NO)
 END IF
 'Display the lines in the box
 FOR i = 0 TO 7
  textcolor uilook(uiText), 0
  IF box.textcolor > 0 THEN textcolor box.textcolor, 0
  IF y = i THEN
   textcolor uilook(uiText), uilook(uiHighlight + tog)
   printstr " ", 8 + insert * 8, 8 + i * 10, dpage
   textcolor uilook(uiSelectedItem + tog), 0
  END IF
  printstr box.text(i), 8, 8 + i * 10, dpage
 NEXT i
 textcolor uilook(uiSelectedItem + tog), 0
 printstr "-", 0, 8 + y * 10, dpage
 textcolor uilook(uiText), 0
 printstr "Text Box" + XSTR$(pt), 0, 100, dpage
 printstr "${C0} = Leader's name", 0, 120, dpage
 printstr "${C#} = Hero name at caterpillar slot #", 0, 128, dpage
 printstr "${P#} = Hero name at party slot #", 0, 136, dpage
 printstr "${H#} = Name of hero ID #", 0, 144, dpage
 printstr "${V#} = Global Plotscript Variable ID #", 0, 152, dpage
 printstr "${S#} = Insert String Variable with ID #", 0, 160, dpage
 printstr "CTRL+SPACE: choose an extended character", 0, 176, dpage
 SWAP vpage, dpage
 setvispage vpage
 clearpage dpage
 dowait
LOOP

groovybox:
menu$(0) = "Go Back"
menu$(1) = "Position:"
menu$(2) = "Shrink:"
menu$(3) = "Textcolor:"
menu$(4) = "Bordercolor:"
menu$(5) = "Backdrop:"
menu$(6) = "Music:"
menu$(7) = "Show Box:"
menu$(8) = "Translucent:"
menu$(9) = "Restore Music:"
'Show backdrop
clearpage 2
IF box.backdrop > 0 THEN
 loadpage game + ".mxs", box.backdrop - 1, 2
END IF

setkeys
DO
 setwait 55
 setkeys
 tog = tog XOR 1
 IF keyval(1) > 1 THEN RETRACE
 usemenu gcsr, 0, 0, 9, 24
 IF enter_or_space() THEN
  SELECT CASE gcsr
   CASE 0: RETRACE ' Exit the appearance menu
   CASE 3: box.textcolor = color_browser_256(box.textcolor)
   CASE 7: box.no_box = (NOT box.no_box)
   CASE 8: box.opaque = (NOT box.opaque)
   CASE 9: box.restore_music = (NOT box.restore_music)
  END SELECT
 END IF
 IF keyval(75) > 1 OR keyval(77) > 1 THEN
  SELECT CASE gcsr
   CASE 7: box.no_box = (NOT box.no_box)
   CASE 8: box.opaque = (NOT box.opaque)
   CASE 9: box.restore_music = (NOT box.restore_music)
  END SELECT
 END IF
 SELECT CASE gcsr
  CASE 1: intgrabber(box.vertical_offset, 0, 27 + box.shrink)
  CASE 2: intgrabber(box.shrink, 0, 21)
  CASE 3: intgrabber(box.textcolor, 0, 255)
  CASE 4: intgrabber(box.boxstyle, 0, 14)
  CASE 5:
   IF zintgrabber(box.backdrop, -1, gen(genMaxBackdrop) - 1) THEN
    clearpage 2
    IF box.backdrop > 0 THEN
     loadpage game + ".mxs", box.backdrop - 1, 2
    END IF
   END IF
  CASE 6: zintgrabber(box.music, -1, gen(genMaxSong))
 END SELECT
 GOSUB previewbox
 FOR i = 0 TO 9
  col = uilook(uimenuItem): IF i = gcsr THEN col = uilook(uiSelectedItem + tog)
  temp$ = menu$(i)
  SELECT CASE i
   CASE 1: temp$ = temp$ & box.vertical_offset
   CASE 2: temp$ = temp$ & box.shrink
   CASE 3: temp$ = temp$ & box.textcolor
   CASE 4: temp$ = temp$ & box.boxstyle
   CASE 5: IF box.backdrop THEN temp$ = temp$ & box.backdrop - 1 ELSE temp$ = temp$ & " NONE"
   CASE 6: IF box.music THEN temp$ = temp$ & getsongname$(box.music - 1) ELSE  temp$ = temp$ & " NONE"
   CASE 7: IF box.no_box THEN temp$ = temp$ & " NO" ELSE temp$ = temp$ & " YES"
   CASE 8: IF box.opaque THEN temp$ = temp$ & " NO" ELSE temp$ = temp$ & " YES"
   CASE 9: IF box.restore_music THEN temp$ = temp$ & " YES" ELSE temp$ = temp$ & " NO"
  END SELECT
  edgeprint temp$, 0, i * 10, col, dpage
 NEXT i
 SWAP vpage, dpage
 setvispage vpage
 copypage 2, dpage
 dowait
LOOP

previewbox:
IF box.no_box = NO THEN
 edgeboxstyle 4, 4 + box.vertical_offset * 4, 312, 88 - box.shrink * 4, box.boxstyle, dpage, (box.opaque = NO)
END IF
FOR i = 0 TO 7
 col = uilook(uiText)
 IF box.textcolor > 0 THEN col = box.textcolor
 edgeprint box.text(i), 8, 8 + box.vertical_offset * 4 + i * 10, col, dpage
NEXT i
RETRACE

loadlines:
LoadTextBox box, boxbuf(), pt
GOSUB nextboxline
search$ = ""
RETRACE

savelines:
SaveTextBox box, pt
RETRACE

clearlines:
'--this inits a new text box, and copies in values from text box 0 for defaults
ClearTextBox box
LoadTextBox boxcopier, boxbuf(), 0
box.no_box          = boxcopier.no_box
box.opaque          = boxcopier.opaque
box.restore_music   = boxcopier.restore_music
box.vertical_offset = boxcopier.vertical_offset
box.shrink          = boxcopier.shrink
box.textcolor       = boxcopier.textcolor
box.boxstyle        = boxcopier.boxstyle
SaveTextBox box, pt
RETRACE

seektextbox:
remptr = pt
pt = pt + 1
DO
 IF pt > gen(39) THEN pt = 0
 IF pt = remptr THEN
  edgeboxstyle 115, 90, 100, 20, 0, vpage
  edgeprint "Not found.", 120, 95, uilook(uiText), vpage
  setvispage vpage
  w = getkey
  EXIT DO
 END IF
 LoadTextBox box, boxbuf(), pt
 foundstr = 0
 FOR i = 0 TO 7
  IF INSTR(UCASE(box.text(i)), UCASE(search$)) > 0 THEN foundstr = 1
 NEXT i
 IF foundstr = 1 THEN EXIT DO
 pt = pt + 1
LOOP
RETRACE

'See wiki for .SAY file format docs
END SUB

'--FIXME: This affects the rest of the file. Move this up as subs and functions are cleaned up
OPTION EXPLICIT

FUNCTION textbox_condition_caption(tag AS INTEGER, prefix AS STRING = "") AS STRING
 IF LEN(prefix) > 0 THEN prefix = prefix & ": "
 IF tag = 0 THEN RETURN prefix & "Never do the following"
 IF tag = 1 THEN RETURN prefix & "If tag 1 = ON [Never]"
 IF tag = -1 THEN RETURN prefix & "Always do the following"
 RETURN prefix & "If tag " & ABS(tag) & " = " + onoroff$(tag) & " (" & load_tag_name(tag) & ")"
END FUNCTION

SUB verifyrpg

 DIM gentmp(360)
 xbload game + ".gen", gentmp(), "General data is missing!"

 DIM i AS INTEGER
 FOR i = 0 TO gentmp(genMaxMap)
  IF NOT isfile(maplumpname$(i, "t")) THEN fatalerror "map" + filenum$(i) + " tilemap is missing!"
  IF NOT isfile(maplumpname$(i, "p")) THEN fatalerror "map" + filenum$(i) + " passmap is missing!"
  IF NOT isfile(maplumpname$(i, "e")) THEN fatalerror "map" + filenum$(i) + " foemap is missing!"
  IF NOT isfile(maplumpname$(i, "l")) THEN fatalerror "map" + filenum$(i) + " NPClocations are missing!"
  IF NOT isfile(maplumpname$(i, "n")) THEN fatalerror "map" + filenum$(i) + " NPCdefinitions are missing!"
  IF NOT isfile(maplumpname$(i, "d")) THEN fatalerror "map" + filenum$(i) + " doorlinks are missing!"
 NEXT
END SUB

SUB writeconstant (filehandle AS INTEGER, num AS INTEGER, names AS STRING, unique() AS STRING, prefix AS STRING)
 'prints a hamsterspeak constant to already-open filehandle
 DIM s AS STRING
 s = exclusive(names, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 _'~")
 WHILE NOT isunique(s, unique(), 0): s = numbertail(s): WEND
 IF s <> "" THEN
  s = num & "," & prefix & ":" & s
  PRINT #filehandle, s
 END IF
END SUB

SUB write_box_conditional_by_menu_index(BYREF box AS TextBox, menuindex AS INTEGER, num AS INTEGER)
 WITH box
  SELECT CASE menuindex
   CASE 0:  .instead_tag = num
   CASE 1:  .instead     = num
   CASE 2:  .settag_tag  = num
   CASE 3:  .settag1     = num
   CASE 4:  .settag2     = num
   CASE 5:  .money_tag   = num
   CASE 6:  .money       = num
   CASE 7:  .battle_tag  = num
   CASE 8:  .battle      = num
   CASE 9:  .item_tag    = num
   CASE 10: .item        = num
   CASE 11: .shop_tag    = num
   CASE 12: .shop        = num
   CASE 13: .hero_tag    = num
   CASE 14: .hero_addrem = num
   CASE 15: .hero_swap   = num
   CASE 16: .hero_lock   = num
   CASE 17: .door_tag    = num
   CASE 18: .door        = num
   CASE 19: .menu_tag    = num
   CASE 20: .menu        = num
   CASE 21: .after_tag   = num
   CASE 22: .after       = num
  END SELECT
 END WITH
END SUB

FUNCTION read_box_conditional_by_menu_index(BYREF box AS TextBox, menuindex AS INTEGER) AS INTEGER
 WITH box
  SELECT CASE menuindex
   CASE 0:  RETURN .instead_tag
   CASE 1:  RETURN .instead
   CASE 2:  RETURN .settag_tag
   CASE 3:  RETURN .settag1
   CASE 4:  RETURN .settag2
   CASE 5:  RETURN .money_tag
   CASE 6:  RETURN .money
   CASE 7:  RETURN .battle_tag
   CASE 8:  RETURN .battle
   CASE 9:  RETURN .item_tag
   CASE 10: RETURN .item
   CASE 11: RETURN .shop_tag
   CASE 12: RETURN .shop
   CASE 13: RETURN .hero_tag
   CASE 14: RETURN .hero_addrem
   CASE 15: RETURN .hero_swap
   CASE 16: RETURN .hero_lock
   CASE 17: RETURN .door_tag
   CASE 18: RETURN .door
   CASE 19: RETURN .menu_tag
   CASE 20: RETURN .menu
   CASE 21: RETURN .after_tag
   CASE 22: RETURN .after
  END SELECT
 END WITH
END FUNCTION

FUNCTION box_conditional_type_by_menu_index(menuindex AS INTEGER) AS INTEGER
 SELECT CASE menuindex
  CASE -1      : RETURN condEXIT
  CASE 1, 22   : RETURN condBOX
  CASE 6       : RETURN condMONEY
  CASE 8       : RETURN condBATTLE
  CASE 10      : RETURN condITEM
  CASE 12      : RETURN condSHOP
  CASE 14,15,16: RETURN condHERO
  CASE 18      : RETURN condDOOR
  CASE 20      : RETURN condMENU
  CASE ELSE    : RETURN condTAG
 END SELECT
END FUNCTION


