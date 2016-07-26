--
-- Disclaimer: mp warranty void if edited.
--

return {
	["bulldozer"]			   		= {slots={2}, "fuels-all"}, --Bulldozer
	["unit-launcher"] 				= {priority=1, slots={1}, group="combatunitlauncher", "combat-units"}, --Combat Units
	["farl"] 							= {group="locomotives", "fuels-high"}, --FARL
	["shuttleTrain"] 				= {group="locomotives", "fuels-high"}, --ShuttleTrain
	["ammobox-gun-turret-2"]	= {group="turrets", limits= {10}, "ammo-bullets" }, --Ammobox
	["burner-ore-crusher"] 		= {group="burners", limits={10}, "fuels-high"},
	["hvmg-turret"]				= {priority=3, group="turrets", limits={10}, "ammo-bullets"},
	["buggy"]						= {priority=3, slots={1,1},			"fuels-all", "ammo-bullets"},
}
