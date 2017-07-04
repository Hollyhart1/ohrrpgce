#ifndef WALKABOUTS_BI
#define WALKABOUTS_BI

#include "slices.bi"

DECLARE SUB set_walkabout_sprite (byval cont as Slice Ptr, byval pic as integer=-1, byval pal as integer=-2)
DECLARE SUB set_walkabout_frame (byval cont as Slice Ptr, byval direction as integer, byval frame as integer)
DECLARE SUB set_walkabout_vis (byval cont as Slice Ptr, byval vis as integer)
DECLARE FUNCTION create_walkabout_slices(byval parent as Slice Ptr) as Slice Ptr
DECLARE SUB create_walkabout_shadow (byval walkabout_cont as Slice Ptr)
DECLARE SUB delete_walkabout_shadow (byval walkabout_cont as Slice Ptr)
DECLARE SUB reset_npc_graphics ()
DECLARE SUB change_npc_def_sprite (byval npc_id as integer, byval walkabout_sprite_id as integer)
DECLARE SUB change_npc_def_pal (byval npc_id as integer, byval palette_id as integer)
DECLARE SUB vishero ()
DECLARE SUB visnpc ()
DECLARE SUB update_walkabout_slices()
DECLARE SUB update_walkabout_hero_slices()
DECLARE SUB update_walkabout_npc_slices()
DECLARE SUB update_walkabout_pos (byval walkabout_cont as slice ptr, byval x as integer, byval y as integer, byval z as integer)

DECLARE SUB reparent_hero_slices()
DECLARE SUB orphan_hero_slices()
DECLARE SUB reparent_npc_slices()
DECLARE SUB orphan_npc_slices()
DECLARE FUNCTION hero_layer() as Slice Ptr
DECLARE FUNCTION npc_layer() as Slice Ptr

DECLARE FUNCTION npc_at_spot(tilepos as XYPair, byval copynum as integer=0) as integer
DECLARE FUNCTION count_npcs_at_spot(tilepos as XYPair) as integer

'Movement/collision/wrapping
DECLARE FUNCTION movdivis (byval xygo as integer) as bool
DECLARE FUNCTION cropmovement (byref x as integer, byref y as integer, byref xgo as integer, byref ygo as integer) as integer
DECLARE FUNCTION framewalkabout (byval x as integer, byval y as integer, byref framex as integer, byref framey as integer, byval mapwide as integer, byval maphigh as integer, byval wrapmode as integer) as integer
DECLARE SUB cropposition (byref x as integer, byref y as integer, byval unitsize as integer)
DECLARE FUNCTION wrappass (x as integer, y as integer, byref xgo as integer, byref ygo as integer, isveh as bool, ignore_passmap as bool = NO) as bool
DECLARE FUNCTION check_wallmap_collision (byval startpos as XYPair, byref pos as XYPair, byval size as XYPair, xgo as integer, ygo as integer, isveh as bool, walls_over_edges as bool = YES) as integer
DECLARE FUNCTION wrapzonecheck (byval zone as integer, byval x as integer, byval y as integer, byval xgo as integer, byval ygo as integer) as integer
DECLARE FUNCTION wrapcollision (byval xa as integer, byval ya as integer, byval xgoa as integer, byval ygoa as integer, byval xb as integer, byval yb as integer, byval xgob as integer, byval ygob as integer) as integer
DECLARE FUNCTION wraptouch (byval x1 as integer, byval y1 as integer, byval x2 as integer, byval y2 as integer, byval distance as integer) as integer
DECLARE FUNCTION check_wall_edges(tilex as integer, tiley as integer, direction as integer, isveh as bool = NO, walls_over_edges as bool = YES, ignore_passmap as bool = NO) as bool

DECLARE SUB aheadxy OVERLOAD (byref x as integer, byref y as integer, byval direction as integer, byval distance as integer)
DECLARE SUB wrapxy OVERLOAD (byref x as integer, byref y as integer, byval wide as integer, byval high as integer)
DECLARE SUB wrapaheadxy OVERLOAD (byref x as integer, byref y as integer, byval direction as integer, byval distance as integer, byval unitsize as integer)

DECLARE SUB aheadxy OVERLOAD (byref p as XYPair, byval direction as integer, byval distance as integer)
DECLARE SUB wrapxy OVERLOAD (byref p as XYPair, byval wide as integer, byval high as integer)
DECLARE SUB wrapaheadxy OVERLOAD (byref p as XYPair, byval direction as integer, byval distance as integer, byval unitsize as integer)

DECLARE FUNCTION walkrotate(byval d as integer, byval rota as integer, byval amount as integer=1) as integer

DECLARE FUNCTION xypair_direction_to (src_v as XYPair, dest_v as XYPair, default as integer = -1) as integer

DECLARE SUB cancel_npc_walk(npci as NPCInst)

'Vehicles
DECLARE FUNCTION vehicle_is_animating() as bool
DECLARE SUB reset_vehicle(v as vehicleState)
DECLARE SUB dump_vehicle_state()
DECLARE SUB forcedismount ()
DECLARE SUB update_vehicle_state ()
DECLARE FUNCTION vehpass (byval n as integer, byval tile as integer, byval default as integer) as integer
DECLARE SUB vehicle_graceful_dismount ()
DECLARE FUNCTION vehscramble(byval targx as integer, byval targy as integer) as bool

#endif
