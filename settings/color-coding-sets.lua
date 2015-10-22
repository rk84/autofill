local set = {group="locomotives", "fuels-high"}
local colors ={"red","orange","yellow","green","cyan","blue","purple","magenta","white","black"}
local locos = {}

for i=1, #colors do
  locos["diesel-locomotive-"..colors[i]] = set
end

return locos
