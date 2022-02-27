# >senba.crafter:crafter/open


#視点検知
 #見てる検知 再起式?やってられるか!
 execute as @a[distance=..10,tag=!senba.crafter-looking] if block ^ ^ ^0.5 barrel{CustomName:'{"color":"dark_gray","text":"    Senba Crafter"}'} run tag @s add senba.crafter-looking
 execute as @a[distance=..10,tag=!senba.crafter-looking] if block ^ ^ ^1.0 barrel{CustomName:'{"color":"dark_gray","text":"    Senba Crafter"}'} run tag @s add senba.crafter-looking
 execute as @a[distance=..10,tag=!senba.crafter-looking] if block ^ ^ ^1.5 barrel{CustomName:'{"color":"dark_gray","text":"    Senba Crafter"}'} run tag @s add senba.crafter-looking
 execute as @a[distance=..10,tag=!senba.crafter-looking] if block ^ ^ ^2.0 barrel{CustomName:'{"color":"dark_gray","text":"    Senba Crafter"}'} run tag @s add senba.crafter-looking
 execute as @a[distance=..10,tag=!senba.crafter-looking] if block ^ ^ ^2.5 barrel{CustomName:'{"color":"dark_gray","text":"    Senba Crafter"}'} run tag @s add senba.crafter-looking
 execute as @a[distance=..10,tag=!senba.crafter-looking] if block ^ ^ ^3.0 barrel{CustomName:'{"color":"dark_gray","text":"    Senba Crafter"}'} run tag @s add senba.crafter-looking
 execute as @a[distance=..10,tag=!senba.crafter-looking] if block ^ ^ ^3.5 barrel{CustomName:'{"color":"dark_gray","text":"    Senba Crafter"}'} run tag @s add senba.crafter-looking
 execute as @a[distance=..10,tag=!senba.crafter-looking] if block ^ ^ ^4.0 barrel{CustomName:'{"color":"dark_gray","text":"    Senba Crafter"}'} run tag @s add senba.crafter-looking
 execute as @a[distance=..10,tag=!senba.crafter-looking] if block ^ ^ ^4.5 barrel{CustomName:'{"color":"dark_gray","text":"    Senba Crafter"}'} run tag @s add senba.crafter-looking
 execute as @a[distance=..10,tag=!senba.crafter-looking] if block ^ ^ ^5.0 barrel{CustomName:'{"color":"dark_gray","text":"    Senba Crafter"}'} run tag @s add senba.crafter-looking
 execute as @a[distance=..10,tag=!senba.crafter-looking] if block ^ ^ ^5.5 barrel{CustomName:'{"color":"dark_gray","text":"    Senba Crafter"}'} run tag @s add senba.crafter-looking
 execute as @a[distance=..10,tag=!senba.crafter-looking] if block ^ ^ ^6.0 barrel{CustomName:'{"color":"dark_gray","text":"    Senba Crafter"}'} run tag @s add senba.crafter-looking
 #誰もいなければ...
 execute unless entity @a[distance=..10,tag=senba.crafter-looking] run tag @p add senba.crafter-looking

#アイテムを押し出す
execute at @p[tag=senba.crafter-looking] run summon item ~ ~1 ~ {Item:{id:"minecraft:command_block",Count:1b}}
execute if block ~ ~ ~ barrel{Items:[{id:"minecraft:command_block",Slot:14b}]} unless block ~ ~ ~ barrel{Items:[{Slot:14b,tag:{}}]} run data modify entity @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:bedrock",Count:1b}}] Item.Count set from block ~ ~ ~ Items[{Slot:14b}].Count
execute if block ~ ~ ~ barrel{Items:[{id:"minecraft:command_block",Slot:16b}]} unless block ~ ~ ~ barrel{Items:[{Slot:16b,tag:{}}]} run data modify entity @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:bedrock",Count:1b}}] Item.Count set from block ~ ~ ~ Items[{Slot:16b}].Count

#タグ付与
tag @a[tag=senba.crafter-looking] remove senba.crafter-looking
execute if block ~ ~ ~ barrel{Items:[{id:"minecraft:command_block",Slot:14b}]} unless block ~ ~ ~ barrel{Items:[{Slot:14b,tag:{}}]} run tag @s add senba.crafter-make_recipe
execute if block ~ ~ ~ barrel{Items:[{id:"minecraft:command_block",Slot:16b}]} unless block ~ ~ ~ barrel{Items:[{Slot:16b,tag:{}}]} run tag @s add senba.crafter-make_unform
execute unless entity @s[tag=!senba.crafter-make_recipe,tag=!senba.crafter-make_unform] run tag @s add senba.crafter-make

#装飾
execute if block ~ ~ ~ barrel{Items:[{Slot:16b,id:"minecraft:command_block"}]} unless block ~ ~ ~ barrel{Items:[{Slot:16b,tag:{}}]} run playsound block.anvil.use master @a ~ ~ ~ 1 1.8
execute if block ~ ~ ~ barrel{Items:[{Slot:16b,id:"minecraft:command_block"}]} unless block ~ ~ ~ barrel{Items:[{Slot:16b,tag:{}}]} run particle firework ~ ~0.5 ~ 0.1 0.1 0.1 0.1 20
execute if block ~ ~ ~ barrel{Items:[{Slot:14b,id:"minecraft:command_block"}]} unless block ~ ~ ~ barrel{Items:[{Slot:14b,tag:{}}]} run playsound block.anvil.use master @a ~ ~ ~ 1 1.8
execute if block ~ ~ ~ barrel{Items:[{Slot:14b,id:"minecraft:command_block"}]} unless block ~ ~ ~ barrel{Items:[{Slot:14b,tag:{}}]} run particle firework ~ ~0.5 ~ 0.1 0.1 0.1 0.1 20

#お主、変なアイテムを持ってるんじゃなかろうな
schedule function senba.crafter:clear 1t

#復活!
item replace block ~ ~ ~ container.14 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem: 9b,CustomModelData:4,display:{Name:'""'}}
item replace block ~ ~ ~ container.16 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:11b,CustomModelData:1,display:{Name:'""'}}
