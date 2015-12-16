--
-- Disclaimer: mp warranty void if edited.
--

local order = { 
  default = 1,
  opposite = 2,
  itemcount = 3
}

return {
  ["burner-inserter"]= {priority=order.default, group="burners", limits={1}, "fuels-high"},
  ["gun-turret"]= {priority=order.default, group="turrets", limits= {10}, "ammo-bullets" }
}