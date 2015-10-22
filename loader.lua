local item_arrays_backup = {}
local defaultsets_backup = {}

loader = {
  addItems = function(path)
    local tbl = require (path)
    for name, array in pairs(tbl) do
      item_arrays_backup[name] = array
    end
  end,

  addSets = function(path)
    local tbl = require (path)
    for name, set in pairs(tbl) do
      defaultsets_backup[name] = set
    end
  end,

  loadBackup = function()
    global.item_arrays = table.deepcopy(item_arrays_backup)
    global.defaultsets = table.deepcopy(defaultsets_backup)
    -- Add items to fuel arrays
    loader.updateFuelArrays()
    -- Remove arrays with false item names
    for name, array in pairs(global.item_arrays) do
      for i=1, #array do
        if game.item_prototypes[array[i]] == nil then
          global.item_arrays[name] = nil
          break
        end
      end
    end
    
    -- Remove sets with false entity names
    for name, set in pairs(global.defaultsets) do
      if game.entity_prototypes[name] then
        unknown = false
        
        for i=#set, 1, -1 do
          if type(set[i]) == "string" and global.item_arrays[set[i]] == nil then --TODO: another item name check for arrays
            table.remove(set, i)
          end
        end
      
        if #set == 0 then
          global.defaultsets[name] = nil
        end
      else -- unknown name
        global.defaultsets[name] = nil
      end
    end
    
    -- link item_arrays to defaultsets
    for entity_name, set in pairs(global.defaultsets) do
      for i = 1, #set do
        if type(set[i]) == "string" and global.item_arrays[set[i]] then
          set[i] = global.item_arrays[set[i]]
        end
      end
    end
    
  end,
  
  updateFuelArrays = function()
    local all = global.item_arrays["fuels-all"]
    local high = global.item_arrays["fuels-high"]
    
    if all or high then
      local MINfuel_value = 8000000 -- Joules
      for name, item in pairs(game.item_prototypes) do
        if item.fuel_value > 0 then
          if all then
            all[#all + 1] = name
          end
          if item.fuel_value >= MINfuel_value then
            if high then
              high[#high + 1] = name
            end
          end
        end
      end
    end

    local fuelHighToLow = function(a,b)
      return game.item_prototypes[a].fuel_value > game.item_prototypes[b].fuel_value
    end
    table.sort(all, fuelHighToLow)
    table.sort(high, fuelHighToLow)
  end
}
