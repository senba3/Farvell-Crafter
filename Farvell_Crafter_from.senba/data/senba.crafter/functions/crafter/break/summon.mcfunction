# >crafter >break

#完成アイテムを消す

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

#アイテムがなければクリアする
execute unless entity @e[type=item,distance=..2,nbt={Age:0s}] run data modify storage senba.clear Item set from entity @s Item.tag.senba-Items[{Slot:15b}]
execute unless entity @e[type=item,distance=..2,nbt={Age:0s}] if data entity @s {Item:{tag:{senba-Items:[{Slot:15b}]}}} as @p[tag=senba.crafter-looking] at @s run function senba.clear:main

#アイテムがあれば消して召喚
 #とりま消す
 execute if entity @e[type=item,distance=..2,nbt={Age:0s}] run kill @e[type=item,distance=..2,nbt={Age:0s}]
 
 #クラフト欄のアイテムを出す
  #チェストトロッコを使って強引にアイテムを出す(召喚&アイテムコピー)
   execute if entity @e[type=item,distance=..2,nbt={Age:0s}] at @p[tag=senba.crafter-looking] run summon chest_minecart ~ ~ ~ {Tags:["senba.crafter-chest"],Silent:1b}
   execute if entity @e[type=item,distance=..2,nbt={Age:0s}] at @p[tag=senba.crafter-looking] run data modify entity @e[distance=..0.01,type=chest_minecart,tag=senba.crafter-chest,limit=1] Items set from entity @s Item.tag.senba-Items
   execute if entity @e[type=item,distance=..2,nbt={Age:0s}] at @p[tag=senba.crafter-looking] run item replace entity @e[distance=..0.01,type=chest_minecart,tag=senba.crafter-chest,limit=1] container.15 with air
   execute if entity @e[type=item,distance=..2,nbt={Age:0s}] at @p[tag=senba.crafter-looking] run kill @e[distance=..0.01,type=chest_minecart,tag=senba.crafter-chest,limit=1]

#タグケシ
tag @a[tag=senba.crafter-looking] remove senba.crafter-looking
 