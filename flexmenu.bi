'OHRRPGCE - flexmenu.bi
'(C) Copyright 1997-2006 James Paige and Hamster Republic Productions
'Please read LICENSE.txt for GPL License details and disclaimer of liability
'See README.txt for code docs and apologies for crappyness of this code ;)
'Auto-generated by MAKEBI from flexmenu.bas

#IFNDEF FLEXMENU_BI
#DEFINE FLEXMENU_BI

declare sub addcaption (caption$(), indexer, cap$)
declare sub attackdata
declare function editflexmenu (nowindex, menutype(), menuoff(), menulimits(), datablock(), mintable(), maxtable())
declare sub enforceflexbounds (menuoff(), menutype(), menulimits(), recbuf(), min(), max())
declare sub setactivemenu (workmenu(), newmenu(), pt, top, size)
declare function tagstring$ (tag, zero$, one$, negone$)
declare sub testflexmenu
declare sub updateflexmenu (mpointer, nowmenu$(), nowdat(), size, menu$(), menutype(), menuoff(), menulimits(), datablock(), caption$(), maxtable(), recindex)
declare function isstringfield(mnu)

#ENDIF
