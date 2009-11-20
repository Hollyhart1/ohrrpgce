#IFNDEF CUSTOM_UDTS_BI
#DEFINE CUSTOM_UDTS_BI

'This file contains UDTs that only get used in custom mode, and not in game,
'so as to prevent them from cluttering up the global udts.bi file

#include "slices.bi"

TYPE SpriteEditStatic
  clonemarked AS INTEGER
  clonebuf(2561) AS INTEGER 'Needs to be big enough for 2+w*h*sets/4 for the largest possible sprite set
  spriteclip(2561) AS INTEGER 'Needs to be big enough for 2+w*h*sets/4 for the largest possible sprite set
  clipsize AS XYPair
  paste AS INTEGER
END TYPE

TYPE SpriteEditState
  '--sprite set state
  spritefile AS STRING
  fileset AS INTEGER
  framenum AS INTEGER
  wide AS INTEGER
  high AS INTEGER
  perset AS INTEGER
  size AS INTEGER ' In bytes, two pixels per byte
  setsize AS INTEGER ' In bytes, two pixels per byte
  at_a_time AS INTEGER 'Number of sprite sets that fit on the browsing screen
 
  '--sprite editor state
  zoom AS INTEGER
  x AS INTEGER
  y AS INTEGER
  lastpos AS XYPair
  zonenum AS INTEGER
  zone AS XYPair
  zonecursor AS INTEGER
  gotmouse AS INTEGER
  drawcursor AS INTEGER
  tool AS INTEGER
  curcolor AS INTEGER ' Index in master palette
  palindex AS INTEGER ' Index in 16 color palette
  hidemouse AS INTEGER
  airsize AS INTEGER
  mist AS INTEGER
  hold AS INTEGER
  holdpos AS XYPair
  radius AS INTEGER
  squish AS XYPair '--For non-round elipses. Not implemented yet
  undodepth AS INTEGER
  undoslot AS INTEGER
  undomax AS INTEGER
  delay AS INTEGER
  fixmouse AS INTEGER
  movespeed AS INTEGER
  readjust AS INTEGER
  adjustpos AS XYPair
  previewpos AS XYPair
  nulpal(8) AS INTEGER '--nulpal is used for getsprite and can go away once we convert to use Frame
  clippedpal AS INTEGER
END TYPE

TYPE TileCloneBuffer
  exists AS INTEGER
  buf(19,19) AS UBYTE
  size AS XYPair
END TYPE

TYPE TileEditState
  x AS INTEGER
  y AS INTEGER
  tilex AS INTEGER
  tiley AS INTEGER
  gotmouse AS INTEGER
  drawcursor AS INTEGER
  tool AS INTEGER
  curcolor AS INTEGER
  hidemouse AS INTEGER
  airsize AS INTEGER
  mist AS INTEGER
  undo AS INTEGER
  allowundo AS INTEGER
  zone AS INTEGER
  justpainted AS INTEGER
  hold AS INTEGER
  hox AS INTEGER
  hoy AS INTEGER
  cutfrom AS INTEGER
  cuttileset AS INTEGER
  canpaste AS INTEGER
  delay AS INTEGER
  fixmouse AS INTEGER
  readjust AS INTEGER
  adjustpos AS XYPair
END TYPE

TYPE HeroEditState
  changed AS INTEGER
  previewframe AS INTEGER
  battle    AS GraphicPair
  walkabout AS GraphicPair
  portrait  AS GraphicPair
  preview_steps AS INTEGER
  preview_walk_direction AS INTEGER
  preview_walk_pos AS XYPair
END TYPE

TYPE TextboxEditState
  id AS INTEGER
  portrait AS GraphicPair
  search AS STRING
END TYPE

TYPE TextboxConnectNode
  lines(2) AS STRING
  id AS INTEGER 'ID of box or < 0 for script
  style AS INTEGER
  add AS INTEGER 'NO normally. YES if this is for adding a new box
END TYPE

TYPE MapEditState
  npc_def(99) AS NPCType
  npc_inst(299) AS NPCInst
END TYPE

ENUM EditRuleMode
  erNone              'Used for labels and links
  erIntgrabber
  erStrgrabber
  erToggle
END ENUM

TYPE EditRule
  dataptr AS ANY PTR  'It scares the heck out of me that I think this is the best solution
  mode AS EditRuleMode
  lower AS INTEGER
  upper AS INTEGER
  group AS INTEGER    'Marks this rule as a member of a numbered group, the meaning of which is defined in the implementation
END TYPE

TYPE AttackChainBrowserState
 root AS Slice Ptr
 lbox AS Slice Ptr
 rbox AS Slice Ptr
 current AS Slice Ptr
 after AS MenuState
 before AS MenuState
 chainfrom(50) AS Slice Ptr 'FIXME: when FreeBasic types support resizeable arrays, this would be a great place to use one
 chainto(2) AS Slice Ptr
 column AS INTEGER
 refresh AS INTEGER
 focused AS Slice Ptr
 done AS INTEGER
END TYPE

#ENDIF
