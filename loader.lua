local item_arrays_backup = {}
local extension_items_backup = {}
local defaultsets_backup = {}
local wildcardsets_backup = {}
local backup_log = {MOD.NAME .." loader log:"}


loader = {
  addItemArray = function(path)
    local tbl = require(path)
    for name, array in pairs(tbl) do
	backup_log[#backup_log + 1] = "ADDING '" .. name .. " "..serpent.dump(line, {name="array", comment=false, sparse=false, sortkeys=true}) .."' in '" .. path .. "'"
	    if item_arrays_backup[name] == nil then
        item_arrays_backup[name] = array
      else
        --item_arrays_backup[name] = array
        backup_log[#backup_log + 1] = "Duplicate array '" .. name .. "' in '" .. path .. "'"
      end
    end
  end,
  
  extendItemArray = function(path)
    local tbl = require(path)
    for name, array in pairs(tbl) do
    
      if item_arrays_backup[name] and type(array) == "table" then
      
        if extension_items_backup[name] then
          extension_items_backup[name][#extension_items_backup[name]+1] = array
        else
          extension_items_backup[name] = {array}
        end

      else
        backup_log[#backup_log + 1] = "Array '" .. name .. "' not found in '" .. path .. "'"
      end
      
    end
  end,

  addSets = function(path)
    local tbl = require(path)
    local wildcards = 0
    for name, set in pairs(tbl) do
      name, wildcards = name:gsub("*",".+")
      if wildcards == 0 then
        if defaultsets_backup[name] == nil then
          defaultsets_backup[name] = set
        else
          --defaultsets_backup[name] = set
          backup_log[#backup_log + 1] = "Duplicate set '" .. name .. "' in '" .. path .. "'"
        end
      else
        name, _ = name:gsub("%-","%%-")
        if wildcardsets_backup[name] == nil then
          wildcardsets_backup[name] = set
        else
          --wildcardsets_backup[name] = array
          backup_log[#backup_log + 1] = "Duplicate wildcard '" .. name .. "' in '" .. path .. "'"
        end
      end
    end
  end,
  
  getBackupLog = function()
    return backup_log
  end,

  loadBackup = function()
    local item_arrays = table.deepcopy(item_arrays_backup)
    local extension_items = table.deepcopy(extension_items_backup)
    local defaultsets = table.deepcopy(defaultsets_backup)
    local wildcardsets = wildcardsets_backup

    -- Add fuel items to fuel arrays
    loader.updateFuelArrays(item_arrays)
    -- Remove arrays with false item names
    for name, array in pairs(item_arrays) do
      for i=1, #array do
        if game.item_prototypes[array[i]] == nil then
          backup_log[#backup_log + 1] = "Item array '" .. name .. "' removed"
          item_arrays[name] = nil
          break
        end
      end
    end
    
    -- Remove extensions that has false itemnames and lacks of target array
    local array
    for name, modules in pairs(extension_items) do
      if item_arrays[name] then
        for j=#modules, 1, -1 do
          array = modules[j]
          for i=1, #array do
          
            if type(array[i]) == "table" then
              if game.item_prototypes[array[i][1]] == nil then
                backup_log[#backup_log + 1] = "Extension for array '" .. name .. "' removed"
                table.remove(modules, j)
                break
              end
            else
              if game.item_prototypes[array[i]] == nil then
                backup_log[#backup_log + 1] = "Extension for array '" .. name .. "' removed"
                table.remove(modules, j)
                break
              end
            end
            
          end
        end
      else -- lacks target array
        backup_log[#backup_log + 1] = "Extension for array '" .. name .. "' removed"
        extension_items[name] = nil
      end
    end
    
    -- Add item extensions to item_arrays
    local tbl = table
    local array
    for name, modules in pairs(extension_items) do
      for j=1, #modules do
        array = modules[j]
        for i=1, #array do
          if type(array[i]) == "table" then -- has index in second cell
            if array[i][2] < 0 then -- negative index should be handled same way as with find method
              tbl.insert(item_arrays[name], #item_arrays[name] + array[i][2] + 2, array[i][1])
            elseif array[i][2] > 0 then
              tbl.insert(item_arrays[name], array[i][2], array[i][1])
            end
          else -- no index defined add last
            item_arrays[name][#item_arrays[name] + 1] = array[i]
          end
        end
      end
    end
    
    --Pre-search wildcard entity names and add them to defaultsets
    for pattern, set in pairs(wildcardsets) do
      for name, _ in pairs(game.entity_prototypes) do
        if defaultsets[name] == nil and name:find(pattern) then
          defaultsets[name] = set
        end
      end
    end
    
    -- Remove sets with false entity names. Remove invalid items. Link array names to item_arrays
    for name, set in pairs(defaultsets) do
      if game.entity_prototypes[name] then
      
        for i=#set, 1, -1 do
          if type(set[i]) == "string" then
            if game.item_prototypes[set[i]] then
              set[i] = {set[i]}
            elseif item_arrays[set[i]] then
              set[i] = item_arrays[set[i]]
            else -- invalid string
              backup_log[#backup_log + 1] = "Invalid string '" .. set[i] .. "' removed from '" .. name .. "' set"
              table.remove(set, i)
            end
          elseif type(set[i]) == "table" then -- should contain array of item names.
            for j=1, #set[i] do
              if game.item_prototypes[set[i][j]] == nil then -- one false itemname will removes whole array
                backup_log[#backup_log + 1] = "Invalid array removed from '" .. name .. "' set"
                table.remove(set, i)
                break
              end
            end
          end
        end
      
        if #set == 0 then -- has no items or arrays
          backup_log[#backup_log + 1] = "Empty set '" .. name .. "'. Set removed"
          defaultsets[name] = nil
        end
      else -- unknown name
        backup_log[#backup_log + 1] = "Invalid entity name '" .. name .. "'. Set removed"
        defaultsets[name] = nil
      end
    end
    
    global.item_arrays = item_arrays
    global.defaultsets = defaultsets
    backup_log[#backup_log + 1] = game.tick .. " Backup loaded."
  end,
  
  updateFuelArrays = function(tbl)
    tbl["fuels-all"] = {}
    tbl["fuels-high"] = {}
    local all = tbl["fuels-all"]
    local high = tbl["fuels-high"]
    
    if all or high then
      local MINfuel_value = 8000000 -- Joules.
      local coal = game.item_prototypes.coal
      if coal and coal.fuel_value > 0 then
        MINfuel_value = coal.fuel_value
      end
      
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
