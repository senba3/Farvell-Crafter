# >senba.crafter:crafter/open


#主用な機能

 #レシピコマンドを作る
  execute as @s[tag=senba.crafter-make_recipe] run function senba.crafter:crafter/data_form
  execute as @s[tag=senba.crafter-make_unform] run function senba.crafter:crafter/data_unform
 
 #一括クラフト
 execute unless data block ~ ~ ~ {Items:[{Slot:17b,tag:{senba.crafter-kill_item:1b}}]} run function senba.crafter:crafter/bunch/main
 

#チェストトロッコを使って強引にアイテムを出す

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
 

 #チェスト召喚、アイテムコピー(シレントつけてるのに音が鳴る...)
  execute at @p[tag=senba.crafter-looking] run summon chest_minecart ~ ~ ~ {Tags:["senba.crafter-chest"],Silent:1b}
  data modify entity @e[type=chest_minecart,tag=senba.crafter-chest,limit=1] Items set from block ~ ~ ~ Items

 #いらない部分のアイテムは消す
  execute at @p[tag=senba.crafter-looking] run item replace entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] container.1 with air
  execute at @p[tag=senba.crafter-looking] run item replace entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] container.2 with air
  execute at @p[tag=senba.crafter-looking] run item replace entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] container.3 with air
  execute at @p[tag=senba.crafter-looking] run item replace entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] container.10 with air
  execute at @p[tag=senba.crafter-looking] run item replace entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] container.11 with air
  execute at @p[tag=senba.crafter-looking] run item replace entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] container.12 with air
  execute at @p[tag=senba.crafter-looking] run item replace entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] container.19 with air
  execute at @p[tag=senba.crafter-looking] run item replace entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] container.20 with air
  execute at @p[tag=senba.crafter-looking] run item replace entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] container.21 with air
  execute at @p[tag=senba.crafter-looking] run execute as @s[tag=senba.crafter-recipe] run item replace entity @e[distance=..1,type=chest_minecart,tag=senba.crafter-chest,limit=1] container.15 with air
 #キルすることでチェストからドロップする
  execute at @p[tag=senba.crafter-looking] run kill @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1]
  tag @a[tag=senba.crafter-looking] remove senba.crafter-looking


#装飾用アイテム復活!
 item replace block ~ ~ ~ container.0 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:1b,CustomModelData:1,display:{Name:'""'}}
 item replace block ~ ~ ~ container.4 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:2b,CustomModelData:1,display:{Name:'""'}}
 item replace block ~ ~ ~ container.5 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:3b,CustomModelData:1,display:{Name:'""'}}
 item replace block ~ ~ ~ container.6 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:4b,CustomModelData:6,display:{Name:'""'}}
 item replace block ~ ~ ~ container.7 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:5b,CustomModelData:1,display:{Name:'""'}}
 item replace block ~ ~ ~ container.8 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:6b,CustomModelData:1,display:{Name:'""'}}
 
 item replace block ~ ~ ~ container.9 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:7b,CustomModelData:1,display:{Name:'""'}}
 item replace block ~ ~ ~ container.13 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:8b,CustomModelData:1,display:{Name:'""'}}
 item replace block ~ ~ ~ container.14 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:9b,CustomModelData:4,display:{Name:'""'}}
 execute as @s[tag=!senba.crafter-recipe] run item replace block ~ ~ ~ container.15 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:10b,CustomModelData:3,display:{Name:'""'}}
 item replace block ~ ~ ~ container.16 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:11b,CustomModelData:1,display:{Name:'""'}}
 item replace block ~ ~ ~ container.17 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:12b,CustomModelData:5,display:{Name:'{"text":"bunch button","italic":false,"Bold":"true"}'}}
 
 item replace block ~ ~ ~ container.18 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:13b,CustomModelData:1,display:{Name:'""'}}
 item replace block ~ ~ ~ container.22 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:14b,CustomModelData:1,display:{Name:'""'}}
 item replace block ~ ~ ~ container.23 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:15b,CustomModelData:1,display:{Name:'""'}}
 item replace block ~ ~ ~ container.24 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:16b,CustomModelData:1,display:{Name:'""'}}
 item replace block ~ ~ ~ container.25 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:17b,CustomModelData:1,display:{Name:'""'}}
 item replace block ~ ~ ~ container.26 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:18b,CustomModelData:1,display:{Name:'""'}}


#お主、変なアイテムを持ってるんじゃなかろうな
schedule function senba.crafter:clear 1t
