# >crafter/break/summon


#判断
data modify storage senba.crafter All.15b.Count set from entity @s Item.Count
execute store result storage senba.crafter All.surch byte 1 run data modify storage senba.crafter All.15b set from entity @s Item
execute if data storage senba.crafter {All:{surch:0b}} run tag @s add senba.crafter-15b
data modify storage senba.crafter All.15b set from storage senba.crafter All.15b_

tag @s add senba.crafter-checked

#再起
execute as @e[type=item,distance=..2,tag=!senba.crafter-checked] run function senba.crafter:crafter/break/surch

