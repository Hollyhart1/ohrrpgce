'OHRRPGCE - loading.bi
'(C) Copyright 1997-2006 James Paige and Hamster Republic Productions
'Please read LICENSE.txt for GPL License details and disclaimer of liability
'See README.txt for code docs and apologies for crappyness of this code ;)
'Auto-generated by MAKEBI from loading.bas

#IFNDEF LOADING_BI
#DEFINE LOADING_BI

declare sub loadnpcd(file as string, dat() as npctype)
declare sub setnpcd(npcd as npctype, offset as integer, value as integer)
declare function getnpcd(npcd as npctype, offset as integer) as integer
declare sub cleannpcd(dat() as npctype)
declare sub loadnpcl(file as string, dat() as npcinst, num as integer)
declare sub sernpcl(npc() as npcinst, z, buffer(), num as integer)
declare sub desernpcl(npc() as npcinst, z, buffer(), num as integer)
declare sub cleannpcl(dat() as npcinst, num as integer)
declare sub serinventory(invent() as inventslot, z, buf())
declare sub deserinventory(invent() as inventslot, z, buf())
declare sub cleaninventory(invent() as inventslot)
declare sub loadtilemap(mapnum as integer, array(), byref wide as integer, byref high as integer)
'declare sub savetilemap(mapnum as integer, array(), wide as integer, high as integer)

#ENDIF
