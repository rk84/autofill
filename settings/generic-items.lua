--
-- Disclaimer: mp warranty void if edited.
--
--local newBullets = {}
--local newShells = {}
--local newShotgun = {}

local tbl = {
	bullets = {
		"uranium-bullet-magazine", --Uranium Power, Nucular
		"basic-bullet-ammo-box", "piercing-bullet-ammo-box", --Ammobox
		"nanobot-bullet-magazine", --GImprovments Mod
		"super-piercing-bullet-magazine", --Supertank -- Not Working?
		"incendiary-rounds-magazine", --IncendiaryMunitions -- Not working?
		"incendiary-bullet-ammo-box", --IncendiaryMunitions, with ammobox
		"explosive-bullet-magazine", --Mil5
		"shattering-bullet-magazine", --Factorio Extended
	},
	shells = {
		"artilleryshell", --Artillery
		"super-explosive-cannon-shell", --Supertank
		"uranium-small-nuke-shell", "uranium-cannon-shell", --Uranium Power --Nucular
		"high-explosive-cannon-shell", --Aircraft
	},
	shotgun= {
		"explosive-shotgun-shell", --Mi-5, Incendiary ammo
		"shattering-shotgun-shel", --Factorio Extended
	},
}


return {
	["ammo-bullets"] = tbl.bullets,
	["ammo-shells"] = tbl.shells,
	["ammo-shotgun"] = tbl.shotgun,
}
