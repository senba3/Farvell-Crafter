# >senba.crafter:main


#作業台をセット
execute if entity @s[type=item_frame] run setblock ~ ~ ~ air
execute unless entity @s[type=player] unless block ~ ~ ~ barrel run setblock ~ ~ ~ barrel[facing=up]{CustomName:'{"color":"dark_gray","text":"    Farvell Crafter"}',Items:[{Slot:0b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:4b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:5b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:6b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:6,display:{Name:'""'}}},{Slot:7b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:8b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:9b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:13b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:14b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:4,display:{Name:'""'}}},{Slot:16b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:17b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:5,display:{Name:'""'}}},{Slot:18b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:22b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:23b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:24b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:25b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}},{Slot:26b,id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:1,display:{Name:'""'}}}]} destroy
execute unless entity @s[type=player] run summon glow_item_frame ~ ~ ~ {Tags:[senba.crafting_table,senba.R.crafter],Invisible:1b,Fixed:1b,Silent:1b,Invulnerable:1b,Facing:1b,Item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:2}}}

#実行者がプレイヤーならお渡しいただく
execute as @s[type=player] run loot give @s loot senba.crafter:item


#既にあれば破壊処理
execute if entity @e[type=glow_item_frame,tag=senba.R.crafter,tag=!senba.born,distance=..0.01] run function senba.crafter:crafter/break

#音
execute if entity @s[type= glow_item_frame] run playsound block.wood.place block @a ~ ~ ~ 1 0.8
execute if entity @s[type=!glow_item_frame] run playsound block.anvil.place block @a ~ ~ ~ 1 2
execute if entity @s[type=!glow_item_frame] run particle flash ~ ~1.5 ~ 0 0 0 0 1

#末梢
kill @s[type=!player]
