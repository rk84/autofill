--
-- Disclaimer: mp warranty void if edited.
--

local item_arrays = {
  ["ammo-bullets"] = {"piercing-bullet-magazine", "basic-bullet-magazine"},
  ["ammo-shells"] = {"cannon-shell"},
  ["fuels-all"] = {},
  ["fuels-high"] = {}
}

local all = item_arrays["fuels-all"]
local high = item_arrays["fuels-high"]
local MINfuel_value = 8000000 -- Joules
for name, item in pairs(game.item_prototypes) do
  if item.fuel_value > 0 then
    all[#all + 1] = name
    if item.fuel_value >= MINfuel_value then
      high[#high + 1] = name
    end
  end
end

local fuelHighToLow = function(a,b)
  return game.item_prototypes[a].fuel_value > game.item_prototypes[b].fuel_value
end
table.sort(all, fuelHighToLow)
table.sort(high, fuelHighToLow)


return item_arrays
