local order = { 
  default = 1,
  opposite = 2,
  itemcount = 3
}

return {
  ["5d-gun-turret-big"]= {priority=order.default, group="turrets", limits= {10}, "ammo-bullets" },
  ["5d-gun-turret-small"]= {priority=order.default, group="turrets", limits= {10}, "ammo-bullets" }
}
