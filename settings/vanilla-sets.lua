--
-- Disclaimer: mp warranty void if edited.
--

local order = { 
  default = 1,
  opposite = 2,
  itemcount = 3
}

return {
  ["car"] = {priority=order.default, "fuels-all", "ammo-bullets" },
  ["tank"] = {priority=order.default, slots={2,1,1}, "fuels-all", "ammo-bullets", "ammo-shells" },
  ["diesel-locomotive"] = {priority=order.default, slots={1}, "fuels-high"},
  ["boiler"] = {priority=order.default, group="burners", limits={5}, "fuels-high"},
  ["burner-inserter"]= {priority=order.default, group="burners", limits={1}, "fuels-high"},
  ["burner-mining-drill"] = {priority=order.default, group="burners", limits={5}, "fuels-high"},
  ["stone-furnace"] = {priority=order.default, group="burners", limits={5}, "fuels-high"},
  ["steel-furnace"] = {priority=order.default, group="burners", limits={5}, "fuels-high"},
  ["gun-turret"]= {priority=order.default, group="turrets", limits= {10}, "ammo-bullets" }
}
