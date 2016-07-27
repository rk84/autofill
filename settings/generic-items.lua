--
-- Disclaimer: mp warranty void if edited.
--
--local newBullets = {}
--local newShells = {}
--local newShotgun = {}

local tbl = {
	bullets = {
		"uranium-bullet-magazine", --Uranium Power
		"basic-bullet-ammo-box", "piercing-bullet-ammo-box", --Ammobox
		"nanobot-bullet-magazine", --GImprovments Mod
		"super-piercing-bullet-magazine", --Supertank -- Not Working?
		"incendiary-rounds-magazine", --IncendiaryMunitions -- Not working?
		"incendiary-bullet-ammo-box", --IncendiaryMunitions, with ammobox
		"explosive-bullet-magazine", --Mil5
	},
	shells = {
		"artilleryshell", --Artillery
		"super-explosive-cannon-shell", --Supertank
		"uranium-small-nuke-shell", "uranium-cannon-shell", --Uranium Power
		"high-explosive-cannon-shell", --Aircraft
	},
	shotgun= {
		"explosive-shotgun-shell", --Mi-5, Incendiary ammo
	},
}

--log("START DATA")
--if game then log("GAME") end
--if data then log("DATA1") end
--if data and data.raw then log("DATA2") end
--if data and data.raw and data.raw.items then log("DATA3") end
--if game then log("GAME") end

--[[
for j, item in pairs(tbl["bullets"]) do
	if data.raw["items"][item] then
		newBullets[#newBullets + 1] = bullets

		log("added ".. i)
	else
		log("skipped ".. i)
	end
end

for j, item in pairs(tbl["shells"]) do
	if data.raw["items"][item] then
		newShells[#newShells + 1] = item

		log("added ".. i)
	else
		log("skipped ".. i)
	end
end

for j, item in pairs(tbl["shotgun"]) do
	if data.raw["items"][item] then
		newShotgun[#newNewShotgun + 1] = item

		log("added ".. i)
	else
		log("skipped ".. i)
	end
end
--]]



return {
	["ammo-bullets"] = tbl.bullets,
	["ammo-shells"] = tbl.shells,
	["ammo-shotgun"] = tbl.shotgun,
	--[[
	["ammo-bullets"] 	= {"uranium-bullet-magazine"}, --Uranium Power
	["ammo-bullets"+1] 	= {"basic-bullet-ammo-box", "piercing-bullet-ammo-box"}, --Ammobox
	["ammo-bullets"+1] 	= {"nanobot-bullet-magazine"}, --GImprovments Mod
	["ammo-bullets"+1] 	= {"super-piercing-bullet-magazine"}, --Supertank -- Not Working?
	["ammo-bullets"+1] 	= {"incendiary-rounds-magazine"}, --IncendiaryMunitions -- Not working?
	["ammo-bullets"+1]	= {"incendiary-bullet-ammo-box"}, --IncendiaryMunitions, with ammobox
	["ammo-bullets"]+1 	= {"explosive-bullet-magazine"}, --Mil5

	["ammo-shells"] 	= {"artilleryshell"}, --Artillery
	["ammo-shells"+1] 	= {"super-explosive-cannon-shell"}, --Supertank
	["ammo-shells"+1] 	= {"uranium-small-nuke-shell", "uranium-cannon-shell"}, --Uranium Power
	["ammo-shells"+1] 	= {"high-explosive-cannon-shell"}, --Aircraft

	["ammo-shotgun"]= {"explosive-shotgun-shell"}, --Mi-5, Incendiary ammo
--]]
}
