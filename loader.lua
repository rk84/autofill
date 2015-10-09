local item_arrays_backup = {}
local defaultsets_backup = {}

loader = {
  addItems = function(path)
    local tbl = require (path)
    local unknown = false
    
    for name, array in pairs(tbl) do
      unknown = false
      
      for i=1, #array do
        if game.item_prototypes[array[i]] == nil then
          unknown = array[i]
          break
        end
      end
      
      if not unknown then
        item_arrays_backup[name] = value
      end
    end
  
  end,

  addSets = function(path)
    local tbl = require (path)
    local unknown = false
    
    for name, set in pairs(tbl) do
      if game.entity_prototypes[name] then
        unknown = false
        
        for i=1, #set do
          if type(set[i]) == "string" and item_arrays_backup[set[i]] == nil then
            unknown = set[i]
            break
          end
        end
      
        if not unknown then
          defaultsets_backup[name] = set
        end
      end
    end
  
  end,

  loadBackup = function()
    global.item_arrays = table.deepcopy(item_arrays_backup)
    global.defaultsets = table.deepcopy(defaultsets_backup)
    
    -- link item_arrays to defaultsets
    for entity_name, set in pairs(global.defaultsets) do
      for i = 1, #set do
        if type(set[i]) == "string" and global.item_arrays[set[i]] then
          set[i] = global.item_arrays[set[i]]
        end
      end
    end
    
  end
}
