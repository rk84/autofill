local locomotiveFillSet = {group="locomotives", slots={2}, "fuels-high"}
local boilerFillSet = {group="burners", limits={10}, "fuels-high"}
local furnaceFillSet = {group="burners", limits={10}, "fuels-all"}

return {
  ["car2"] = {priority=2, slots={1,1}, "fuels-high", "ammo-bullets"},
  ["tank-dytech-1"]     = {priority=2, slots={2,1,1}, "fuels-high", "ammo-dytech-laser-tank", "ammo-rockets"},
  ["tank-dytech-2"]     = {priority=2, slots={2,1,1,1,1,1,1}, "fuels-high", "ammo-dytech-laser-tank", "ammo-rockets", "ammo-flamethrower", "ammo-shotgun", "ammo-shells", "ammo-bullets"},

  ["diesel-locomotive-armor"] = locomotiveFillSet,
  ["diesel-locomotive-fast"]  = locomotiveFillSet,

  ["sniper-turret"]           = {priority=2, group="turrets8", limits= {10}, "ammo-dytech-sniper"},

  ["gun-turret-1"]            = {priority=2, group="turrets",  limits= {10}, "ammo-bullets"},  --bullet
  ["gun-turret-2"]            = {priority=2, group="turrets2", limits= {10}, "ammo-shotgun"},  --shotgun
  ["gun-turret-3"]            = {priority=2, group="turrets3", limits= {10}, "ammo-rockets"},  --rocket
  ["gun-turret-4"]            = {priority=2, group="turrets4", limits= {10}, "ammo-shells"},  --cannon
  ["gun-turret-5"]            = {priority=2, group="turrets5", limits= {10}, "ammo-dytech-capsule"},  --capsule
  ["gun-turret-6"]            = {priority=2, group="turrets6", limits= {10}, "ammo-dytech-laser"},  --plasma
  ["gun-turret-7"]            = {priority=2, group="turrets7", limits= {10}, "ammo-dytech-laser-shotgun"},  --plasma-shotgun

  ["gun-turret-1-armored"]    = {priority=2, group="turrets",  limits= {10}, "ammo-bullets"},  --bullet
  ["gun-turret-2-armored"]    = {priority=2, group="turrets2", limits= {10}, "ammo-shotgun"},  --shotgun
  ["gun-turret-3-armored"]    = {priority=2, group="turrets3", limits= {10}, "ammo-rockets"},  --rocket
  ["gun-turret-4-armored"]    = {priority=2, group="turrets4", limits= {10}, "ammo-shells"},  --cannon
  ["gun-turret-5-armored"]    = {priority=2, group="turrets5", limits= {10}, "ammo-dytech-capsule"},  --capsule
  ["gun-turret-6-armored"]    = {priority=2, group="turrets6", limits= {10}, "ammo-dytech-laser"},  --plasma
  ["gun-turret-7-armored"]    = {priority=2, group="turrets7", limits= {10}, "ammo-dytech-laser-shotgun"},  --plasma-shotgun

  ["boiler-mk2"]        = boilerFillSet,
  ["boiler-mk3"]        = boilerFillSet,
  ["boiler-mk4"]        = boilerFillSet,
  ["boiler-mk5"]        = boilerFillSet,

  ["high-boiler-mk1"]   = boilerFillSet,
  ["high-boiler-mk2"]   = boilerFillSet,
  ["high-boiler-mk3"]   = boilerFillSet,
  ["high-boiler-mk4"]   = boilerFillSet,
  ["high-boiler-mk5"]   = boilerFillSet,

  ["steel-furnace-mk2"] = furnaceFillSet,
  ["steel-furnace-mk3"] = furnaceFillSet,
  ["steel-furnace-mk4"] = furnaceFillSet,
  ["steel-furnace-mk5"] = furnaceFillSet,
}
