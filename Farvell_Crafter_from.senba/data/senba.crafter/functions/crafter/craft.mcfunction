# >#recipe

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


#完成スロットに残ったアイテムを押し出す 
 execute at @p[tag=senba.crafter-looking] run summon item ~ ~ ~ {Tags:[senba.crafter-15b_item],Item:{id:"minecraft:paper",Count:1b,tag:{CustomModelData:3,senba.crafter-kill_item:1b}}}
 data modify entity @e[type=item,tag=senba.crafter-15b_item,limit=1] Item set from block ~ ~ ~ Items[{Slot:15b}]
 execute at @p[tag=senba.crafter-looking] run tag @e[distance=..0.001,type=item,tag=senba.crafter-15b_item] remove senba.crafter-15b_item
 item replace block ~ ~ ~ container.15 with minecraft:paper{CustomModelData:3,senba.crafter-kill_item:1b,display:{Name:'""'}}


#タグケシ
tag @a[tag=senba.crafter-looking] remove senba.crafter-looking
data merge entity @s {Tags:[senba.R.crafter,senba.crafting_table]}


#アイテムの数を減らす 小数点以下はすべて切り捨てされる仕様を利用
 #1
 execute store result block ~ ~ ~ Items[{Slot: 1b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:1b}].Count 0.99999
 #2
 execute store result block ~ ~ ~ Items[{Slot: 2b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:2b}].Count 0.99999
 #3
 execute store result block ~ ~ ~ Items[{Slot: 3b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:3b}].Count 0.99999
 #4
 execute store result block ~ ~ ~ Items[{Slot:10b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:10b}].Count 0.99999
 #5
 execute store result block ~ ~ ~ Items[{Slot:11b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:11b}].Count 0.99999
 #6
 execute store result block ~ ~ ~ Items[{Slot:12b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:12b}].Count 0.99999
 #7
 execute store result block ~ ~ ~ Items[{Slot:19b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:19b}].Count 0.99999
 #8
 execute store result block ~ ~ ~ Items[{Slot:20b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:20b}].Count 0.99999
 #9
 execute store result block ~ ~ ~ Items[{Slot:21b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:21b}].Count 0.99999
