--
-- Disclaimer: mp warranty void if edited.
--

--[[
y_turret_gun1f12=T-GUN (Big Barrel)
y_turret_gun2f12=T-GUN (Double Barrel)
y_turret_laser22f12=T-LAS (D20-R33)
y-laser-def-s4=T-LAS (D18-R26)
y_turret_plasma=T-PLASMA 
y_turret_flame=T-CHEMIC
y-boiler-t2=Boiler 540/2
y-boiler-t3=Boiler 1M8/3
y-boiler-iv=Boiler 3M6/4
y-obninsk-reactor=Obnisnk AM-1/1951
--]]

local turretFillSet = {priority=2, group="turrets", limits= {20}, "ammo-bullets" }
local plasmaFillSet = {priority=1, group="plasmaturrets", limits= {20}, "ammo-yi-plasma" }
local chemFillSet = {priority=1, group="chemturrets", limits= {20}, "ammo-yi-chem" }
local boilerFillSet = {group="burners", limits={5}, "fuels-high"}

return {
  ["y_turret_gun1f12"] = turretFillSet,
  ["y_turret_gun2f12"] = turretFillSet,
  ["y_turret_plasma"]= plasmaFillSet,
  ["y_turret_flame"] = chemFillSet,
  ["y-boiler-t2"] = boilerFillSet,
  ["y-boiler-t3"] = boilerFillSet,
  ["y-boiler-iv"] = boilerFillSet,
  ["y-obninsk-reactor"] = boilerFillSet
}
