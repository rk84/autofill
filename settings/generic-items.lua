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
		"Biological-bullet-magazine", --Natural Evolution - Enemies
	},
	shells = {
		"artilleryshell", --Artillery
		"super-explosive-cannon-shell", --Supertank
		"uranium-small-nuke-shell", "uranium-cannon-shell", --Uranium Power --Nucular
		"high-explosive-cannon-shell", --Aircraft
		"small-cannon-shell", "small-explosive-cannon-shell", "cluster-cannon-shell", "fire-cannon-shell", "fire-cluster-cannon-shell", --Additional turret
	},
	shotgun= {
		"explosive-shotgun-shell", --Mi-5, Incendiary ammo
		"shattering-shotgun-shel", --Factorio Extended
	},
	rocket = {
		"small-rocket", "small-explosive-rocket", "explosive-multiple-rocket", "acid-rocket", "acid-multiple-rocket", --Additional Turret
	},
	flamer = {
		"acid-thrower-ammo", --Additional Turret
		"flame-thrower-ammo-compressed", --Ammo Box
	},
}


return {
	["ammo-bullets"] = tbl.bullets,
	["ammo-shells"] = tbl.shells,
	["ammo-shotgun"] = tbl.shotgun,
	["ammo-rockets"] = tbl.rocket,
	["ammo-flamethrower"] = tbl.flamer,
}
