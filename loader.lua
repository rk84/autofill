local item_arrays_backup = {}
local defaultsets_backup = {}

loader = {
  addItems = function(path)
    local tbl = require (path)
    for key, value in pairs(tbl) do
      item_arrays_backup[key] = value
    end
  end,

  addSets = function(path)
    local tbl = require (path)
    for key, value in pairs(tbl) do
      defaultsets_backup[key] = value
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
