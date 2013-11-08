require "defines"
require "util"

--flying text colors
local RED = {r = 0.9}
local GREEN = {g = 0.7}
local YELLOW = {r = 0.8, g = 0.8}

local order = { 
  itemcount = 1,
  array = 2
}

--
--Events
--

game.oninit(function()
  initMod()
end)

game.onload(function()
  if glob.active == nil or glob.fillable == nil then
    initMod()
  end
end)

game.onevent(defines.events.onbuiltentity, function(event)
  if glob.active then
    if glob.fillable[event.createdentity.type] ~= nil or glob.fillable[event.createdentity.name] ~= nil then 
      autoFill(event.createdentity)
    end
  end
end)



--
--Functions
--

function initMod()
  glob.active = true
  local fuels = {"coke-coal", "charcoal", "coal", "raw-wood", "wood", "wooden-chest"}
  local ammos = {"piercing-bullet-magazine", "basic-bullet-magazine"}
  checkValidItems(fuels)
  checkValidItems(ammos)
  glob.fillable = {
    car = {priority=order.itemcount, table.unpack(fuels)},
    locomotive = {priority=order.itemcount, table.unpack(fuels)},
    ["burner-mining-drill"] = {priority=order.itemcount, group="burners", table.unpack(fuels)},
    ["stone-furnace"] = {priority=order.itemcount, group="burners", table.unpack(fuels)},
    ["steel-furnace"] = {priority=order.itemcount, group="burners", table.unpack(fuels)},
    ["burner-inserter"]= {priority=order.itemcount, group="burners", table.unpack(fuels)},
    boiler = {priority=order.itemcount, group="burners", table.unpack(fuels)},
    ["gun-turret"]= {priority=order.array, group="turrets", table.unpack(ammos)}
  } --if group is defined, then insertable items are divided for buildable items in quickbar (and in hand).
end

function checkValidItems(tbl)
  for i = #tbl, 1, -1 do
    if game.itemprototypes[tbl[i]] == nil then
      aPrint("Item",tbl[i],"removed from table.")
      table.remove(tbl, i)
    end
  end
end

function autoFill(entity)
  local maininv = game.player.getinventory(defines.inventory.playermain)
  local fill_set = table.deepcopy(glob.fillable[entity.name] or glob.fillable[entity.type])
  local limitperbuild = 9999
  --Remove unavailable items
  for i = #fill_set, 1, -1 do
    if maininv.getitemcount(fill_set[i]) < 1 then
      table.remove(fill_set, i)
    end
  end
  if fill_set[1] == nil then
    text("Out of items.", entity.position, RED)
    return
  end
  
  --Sort table based on itemcount.
  if fill_set.priority == order.itemcount then
    table.sort(fill_set, function(a,b) return maininv.getitemcount(a)>maininv.getitemcount(b) end)
  end
  
  --Count divided stacksize
  if fill_set.group ~= nil then
    local groupsize = 1
    for k,v in pairs(glob.fillable) do
      if v.group == fill_set.group then
        groupsize = groupsize + game.player.getitemcount(k) - maininv.getitemcount(k)
      end
    end
    local totalitemcount = 0
    for _, itemname in ipairs(fill_set) do
      totalitemcount = totalitemcount + maininv.getitemcount(itemname)
    end
    limitperbuild = math.floor(totalitemcount / groupsize)
  end
  
  --Determine insertable stacksize
  local maxstack = math.min(maininv.getitemcount(fill_set[1]), limitperbuild)
  local color = RED
  if maxstack < game.itemprototypes[fill_set[1]].stacksize then
    color = YELLOW
  else
    maxstack = game.itemprototypes[fill_set[1]].stacksize
    color = GREEN
  end
  if maxstack < 1 then
    text("Not enough items.", entity.position, RED)
    return
  end
  
  --Insert and remove the stack
  maininv.remove({name=fill_set[1], count=maxstack})
  entity.insert({name=fill_set[1], count=maxstack})
  text("-"..maxstack.." "..game.getlocaliseditemname(fill_set[1]), entity.position, color)
end

function text(line, pos, colour) --colour as optional
  if colour == nil then
    game.createentity({name="flying-text", position=pos, text=line})
  else
    game.createentity({name="flying-text", position=pos, text=line, color=colour})
  end
end

function aPrint(...)
  local line = ""
  for i,v in ipairs(table.pack(...)) do
    line = line .. tostring(v) .. " "
  end
  game.player.print("Autofill: " .. line)
end

--
-- Mod interface
--

remote.addinterface("autofill",
{
  setactive = function(turnOn)
    if turnOn then
      glob.active = true
    else
      glob.active = false
    end
  end,

  insertset = function(name, set)
    checkValidItems(set)
    glob.fillable[name] = set
  end,
  
  reset = function()
    initMod()
  end
})
