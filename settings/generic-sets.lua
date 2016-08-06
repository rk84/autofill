--
-- Disclaimer: mp warranty void if edited.
--

return {
	["bulldozer"]			   		= {slots={2}, "fuels-all"}, --Bulldozer
	["unit-launcher"] 				= {priority=1, slots={1}, group="combatunitlauncher", "combat-units"}, --Combat Units
	["farl"] 						= {group="locomotives", "fuels-high"}, --FARL
	["shuttleTrain"] 				= {group="locomotives", slots={3},  "fuels-high"}, --ShuttleTrain
	["ammobox-gun-turret-2"]		= {group="turrets", limits= {10}, "ammo-bullets" }, --Ammobox
	["burner-ore-crusher"] 			= {group="burners", limits={10}, "fuels-high"}, --Angels
	["hvmg-turret"]					= {priority=3, group="turrets", limits={10}, "ammo-bullets"}, --Gimprovments
	["buggy"]						= {priority=3, slots={1,1},			"fuels-all", "ammo-bullets"}, --Gimprovments
	["artillery"]					= {priority=3, "ammo-shells"}, -- Artillery
	["burner-generator"]			= {group="burners", slots={2}, limits={10}, "fuels-all"}, -- Kspower
	["mega-tank"]					= {priority=3, slots={3,1,1},			"fuels-all", "mo-ammo-goliath", "ammo-bullets"}, --MoMods
	["supertank"]					= {priority=3, slots={2,1,1},			"fuels-all", "ammo-shells" ,"ammo-bullets"}, --SuperTank
	["diesel-locomotive-mk2"]		= {group="locomotives", slots={3}, "fuels-high"}, --Factorio Extended
	["diesel-locomotive-mk3"]		= {group="locomotives", slots={3}, "fuels-high"}, --Factorio Extended
	["gun-turret-mk2"]				= {priority=3, group="turrets", limits={10}, "ammo-bullets"}, --Factorio Extended

}
