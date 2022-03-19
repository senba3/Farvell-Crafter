# >crafter/break/summon


#判断
tag @e[type=item,distance=..2,tag=!senba.crafter-checked,nbt={Age:0s}] add senba.crafter-check
data modify storage senba.crafter All.15b.Count set from entity @e[type=item,distance=..2,tag=senba.crafter-check,limit=1,sort=nearest] Item.Count
execute store result storage senba.crafter All.surch byte 1 run data modify storage senba.crafter All.15b set from entity @e[type=item,distance=..2,tag=senba.crafter-check,limit=1,sort=nearest] Item
execute if data storage senba.crafter {All:{surch:0b}} run tag @e[type=item,distance=..2,tag=senba.crafter-check,limit=1,sort=nearest] add senba.crafter-15b
data modify storage senba.crafter All.15b set from storage senba.crafter All.15b_

tag @e[type=item,distance=..2,limit=1,sort=nearest,tag=senba.crafter-check] add senba.crafter-checked
tag @e[type=item,distance=..2,limit=1,sort=nearest,tag=senba.crafter-check] remove senba.crafter-check

#再起
execute if entity @e[type=item,distance=..2,tag=!senba.crafter-checked,nbt={Age:0s}] run function senba.crafter:crafter/break/surch

