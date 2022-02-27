#data merge storage minecraft:senba.clear {Item:{id:"minecraft:paper",Count:32b},option:{nbt:1b}}


#必要なものをピックアップ
summon armor_stand ~ ~ ~ {Silent:1b,Invisible:1b,Marker:1b,Tags:[senba.clear],Small:1b}
scoreboard objectives add senba.clear dummy

#ストレージに小細工
data modify storage senba.clear All.Inventory set from entity @s Inventory
data modify storage senba.clear All.Count set from storage senba.clear Item.Count
data remove storage senba.clear Item.Count
execute if data storage senba.clear {option:{nbt:0b}} unless data storage senba.clear {Item:{tag:{}}} run data remove storage senba.clear All.Inventory[].tag

#減らす
execute as @e[type=armor_stand,tag=senba.clear] at @s run function senba.clear:again


#かたずけ
execute if entity @e[type=armor_stand,tag=senba.clear] run function senba.clear:clear/finish
