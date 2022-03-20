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
#  1. {Slot}が無ければ生成   2. 1tick前と今の作業台の{Slot}の内容が同じかを検知   3. 同じであればCountを1減らす
 #1
 execute unless data entity @s Item.tag.senba-Items[{Slot: 1b}] run data modify entity @s Item.tag.senba-Items append value {Slot:1b}
 execute store result storage senba.crafter All.check byte 1 run data modify entity @s Item.tag.senba-Items[{Slot: 1b}] set from block ~ ~ ~ Items[{Slot: 1b}]
 execute if data storage senba.crafter {All:{check:0b}} store result block ~ ~ ~ Items[{Slot: 1b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:1b}].Count 0.99999
 #2
 execute unless data entity @s Item.tag.senba-Items[{Slot: 2b}] run data modify entity @s Item.tag.senba-Items append value {Slot:2b}
 execute store result storage senba.crafter All.check byte 1 run data modify entity @s Item.tag.senba-Items[{Slot: 2b}] set from block ~ ~ ~ Items[{Slot: 2b}]
 execute if data storage senba.crafter {All:{check:0b}} store result block ~ ~ ~ Items[{Slot: 2b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:2b}].Count 0.99999
 #3
 execute unless data entity @s Item.tag.senba-Items[{Slot: 3b}] run data modify entity @s Item.tag.senba-Items append value {Slot: 3b}
 execute store result storage senba.crafter All.check byte 1 run data modify entity @s Item.tag.senba-Items[{Slot: 3b}] set from block ~ ~ ~ Items[{Slot: 3b}]
 execute if data storage senba.crafter {All:{check:0b}} store result block ~ ~ ~ Items[{Slot: 3b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:3b}].Count 0.99999
 #4
 execute unless data entity @s Item.tag.senba-Items[{Slot:10b}] run data modify entity @s Item.tag.senba-Items append value {Slot:10b}
 execute store result storage senba.crafter All.check byte 1 run data modify entity @s Item.tag.senba-Items[{Slot:10b}] set from block ~ ~ ~ Items[{Slot:10b}]
 execute if data storage senba.crafter {All:{check:0b}} store result block ~ ~ ~ Items[{Slot:10b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:10b}].Count 0.99999
 #5
 execute unless data entity @s Item.tag.senba-Items[{Slot:11b}] run data modify entity @s Item.tag.senba-Items append value {Slot:11b}
 execute store result storage senba.crafter All.check byte 1 run data modify entity @s Item.tag.senba-Items[{Slot:11b}] set from block ~ ~ ~ Items[{Slot:11b}]
 execute if data storage senba.crafter {All:{check:0b}} store result block ~ ~ ~ Items[{Slot:11b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:11b}].Count 0.99999
 #6
 execute unless data entity @s Item.tag.senba-Items[{Slot:12b}] run data modify entity @s Item.tag.senba-Items append value {Slot:12b}
 execute store result storage senba.crafter All.check byte 1 run data modify entity @s Item.tag.senba-Items[{Slot:12b}] set from block ~ ~ ~ Items[{Slot:12b}]
 execute if data storage senba.crafter {All:{check:0b}} store result block ~ ~ ~ Items[{Slot:12b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:12b}].Count 0.99999
 #7
 execute unless data entity @s Item.tag.senba-Items[{Slot:19b}] run data modify entity @s Item.tag.senba-Items append value {Slot:19b}
 execute store result storage senba.crafter All.check byte 1 run data modify entity @s Item.tag.senba-Items[{Slot:19b}] set from block ~ ~ ~ Items[{Slot:19b}]
 execute if data storage senba.crafter {All:{check:0b}} store result block ~ ~ ~ Items[{Slot:19b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:19b}].Count 0.99999
 #8
 execute unless data entity @s Item.tag.senba-Items[{Slot:20b}] run data modify entity @s Item.tag.senba-Items append value {Slot:20b}
 execute store result storage senba.crafter All.check byte 1 run data modify entity @s Item.tag.senba-Items[{Slot:20b}] set from block ~ ~ ~ Items[{Slot:20b}]
 execute if data storage senba.crafter {All:{check:0b}} store result block ~ ~ ~ Items[{Slot:20b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:20b}].Count 0.99999
 #9
 execute unless data entity @s Item.tag.senba-Items[{Slot:21b}] run data modify entity @s Item.tag.senba-Items append value {Slot:21b}
 execute store result storage senba.crafter All.check byte 1 run data modify entity @s Item.tag.senba-Items[{Slot:21b}] set from block ~ ~ ~ Items[{Slot:21b}]
 execute if data storage senba.crafter {All:{check:0b}} store result block ~ ~ ~ Items[{Slot:21b}].Count byte 1 run data get block ~ ~ ~ Items[{Slot:21b}].Count 0.99999

data remove storage senba.crafter All
