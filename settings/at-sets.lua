--
-- Disclaimer: mp warranty void if edited.
--
--Advanced Tanks New Sets, Tankwerks New Sets

 return {
	--Advanced Tank
	["car-flamer"] 					= {priority=3, slots={1,1},		 	"fuels-all", "gi-ammo-flame"},
	["auto-tank-wlsk"]			= {priority=3, slots={2,1,1}, 	 	"fuels-all", "gi-ammo-auto45", "ammo-shotgun"},
	["flame-tank-wlsk"]  		= {priority=3, slots={2,1,1}, 		"fuels-all", "ammo-shells", "gi-ammo-flame"},
	["nade-tank-wlsk"]   		= {priority=3, slots={2,1}, 		"fuels-all", "gi-ammo-artillery"},
	["auto-tank"]          		= {priority=3, slots={2,1,1}, 		"fuels-all", "gi-ammo-auto45", "ammo-shotgun"},
	["flame-tank"]         		= {priority=3, slots={2,1,1}, 		"fuels-all", "ammo-shells", "gi-ammo-flame"},
	["nade-tank"]          		= {priority=3, slots={2,1}, 		"fuels-all", "gi-ammo-artillery"},
	["rocket-tank"] 				= {priority=3, slots={2,1,1}, 		"fuels-all", "gi-ammo-rocket", "ammo-shells"},
	["mine-tank"] 					= {priority=3, slots={2,1,1}, 		"fuels-all", "gi-ammo-mine", "ammo-shotgun"},
	["super-tank"] 				= {priority=3, slots={4,1,1,1}, 	"fuels-all", "gi-ammo-auto45", "gi-ammo-artillery", "ammo-bullets"},
	["super-tank-alternate"] 	= {priority=3, slots={4,1,1,1},	"fuels-all", "ammo-shells", "gi-ammo-flame", "gi-ammo-mine"},
	["super-tank-wmd"] 			= {priority=3, slots={4,1,1}, 		"fuels-all", "gi-ammo-wmd", "gi-ammo-auto45"},

	--Tankwerkz
	["flame-tank"] 				= {priority=3, slots={2,1,1},		"fuels-all", "tw-ammo-flame", "ammo-bullets"},  --hmmmm We already have this, might have a problem.........
	["hydra-tank"] 				= {priority=3, slots={2,1,1},		"fuels-all", "tw-ammo-rocket", "ammo-bullets"},
	["heavy-tank"] 				= {priority=3, slots={2,2,1},		"fuels-all", "ammo-shells", "tw-ammo-belt"},
	["light-tank"] 					= {priority=3, slots={2,1},			"fuels-all", "ammo-bullets"},


--[[
tankw - flametanks - 2, 1, 1 fuel tankw-flamer, bullets
tankw - goliath - 2, 2, 1,  - fuel, shells, heavygun
tankw - hydra - 2, 1, 1 fuel, tankrock, bullets
tankw -perseus light tank - 2, 1 fuel, bullets

light-tank=Perseus light tank
hydra-tank=Hydra rocket tank
heavy-tank=Goliath heavy tank
flame-tank=Flame tank
]]--


}
