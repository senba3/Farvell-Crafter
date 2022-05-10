# >senba.crafter:crafter/drop


#臨時スコア
scoreboard objectives add senba.dummy dummy

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

#デフォルトタグ=
# {"text":"senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}
#レシピ=
# {"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter[0]"}

#ブロックのデータを写す用アイテム
 tag @s remove senba.crafter-make_recipe_unform
 summon item ~ ~ ~ {Tags:["senba.crafter-get"],Item:{id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:3,goods:{},crafter:[{},{},{},{},{},{},{},{},{}]}}}
#データを写す(Count以外を写します)
 function senba.crafter:crafter/unform
 #idを写す
  data modify entity @e[type=item,limit=1,tag=senba.crafter-get] Item.tag.crafter set from block ~ ~ ~ Items
  data remove entity @e[type=item,limit=1,tag=senba.crafter-get] Item.tag.crafter[{tag:{senba.crafter-kill_item:1b}}]
  data remove entity @e[type=item,limit=1,tag=senba.crafter-get] Item.tag.crafter[{Slot:15b}]
  data remove entity @e[type=item,limit=1,tag=senba.crafter-get] Item.tag.crafter[{}].Slot
  data modify entity @e[type=item,limit=1,tag=senba.crafter-get] Item.tag.goods set from block ~ ~ ~ Items[{Slot:15b}]
 #Countを単位なしで取得する
 execute if data block ~ ~ ~ Items[{Slot: 1b}] store result score #senba.crafter-Slot1 senba.dummy run data get block ~ ~ ~ Items[{Slot: 1b}].Count
 execute if data block ~ ~ ~ Items[{Slot: 2b}] store result score #senba.crafter-Slot2 senba.dummy run data get block ~ ~ ~ Items[{Slot: 2b}].Count
 execute if data block ~ ~ ~ Items[{Slot: 3b}] store result score #senba.crafter-Slot3 senba.dummy run data get block ~ ~ ~ Items[{Slot: 3b}].Count
 execute if data block ~ ~ ~ Items[{Slot:10b}] store result score #senba.crafter-Slot4 senba.dummy run data get block ~ ~ ~ Items[{Slot:10b}].Count
 execute if data block ~ ~ ~ Items[{Slot:11b}] store result score #senba.crafter-Slot5 senba.dummy run data get block ~ ~ ~ Items[{Slot:11b}].Count
 execute if data block ~ ~ ~ Items[{Slot:12b}] store result score #senba.crafter-Slot6 senba.dummy run data get block ~ ~ ~ Items[{Slot:12b}].Count
 execute if data block ~ ~ ~ Items[{Slot:19b}] store result score #senba.crafter-Slot7 senba.dummy run data get block ~ ~ ~ Items[{Slot:19b}].Count
 execute if data block ~ ~ ~ Items[{Slot:20b}] store result score #senba.crafter-Slot8 senba.dummy run data get block ~ ~ ~ Items[{Slot:20b}].Count
 execute if data block ~ ~ ~ Items[{Slot:21b}] store result score #senba.crafter-Slot9 senba.dummy run data get block ~ ~ ~ Items[{Slot:21b}].Count
 execute store result score #senba.crafter-All senba.dummy run data get block ~ ~ ~ Items[{Slot: 1b}].Count
 execute store result score #senba.crafter-All1 senba.dummy run data get block ~ ~ ~ Items[{Slot: 2b}].Count
 execute store result score #senba.crafter-All2 senba.dummy run data get block ~ ~ ~ Items[{Slot: 3b}].Count
 execute store result score #senba.crafter-All3 senba.dummy run data get block ~ ~ ~ Items[{Slot:10b}].Count
 execute store result score #senba.crafter-All4 senba.dummy run data get block ~ ~ ~ Items[{Slot:11b}].Count
 execute store result score #senba.crafter-All5 senba.dummy run data get block ~ ~ ~ Items[{Slot:12b}].Count
 execute store result score #senba.crafter-All6 senba.dummy run data get block ~ ~ ~ Items[{Slot:19b}].Count
 execute store result score #senba.crafter-All7 senba.dummy run data get block ~ ~ ~ Items[{Slot:20b}].Count
 execute store result score #senba.crafter-All8 senba.dummy run data get block ~ ~ ~ Items[{Slot:21b}].Count
 scoreboard players operation #senba.crafter-All senba.dummy += #senba.crafter-All1 senba.dummy
 scoreboard players operation #senba.crafter-All senba.dummy += #senba.crafter-All2 senba.dummy
 scoreboard players operation #senba.crafter-All senba.dummy += #senba.crafter-All3 senba.dummy
 scoreboard players operation #senba.crafter-All senba.dummy += #senba.crafter-All4 senba.dummy
 scoreboard players operation #senba.crafter-All senba.dummy += #senba.crafter-All5 senba.dummy
 scoreboard players operation #senba.crafter-All senba.dummy += #senba.crafter-All6 senba.dummy
 scoreboard players operation #senba.crafter-All senba.dummy += #senba.crafter-All7 senba.dummy
 scoreboard players operation #senba.crafter-All senba.dummy += #senba.crafter-All8 senba.dummy

 #Countを消す
  data remove entity @e[type=item,limit=1,tag=senba.crafter-get] Item.tag.crafter[{}].Count
 #スコアボードを使って単位"b"をのけてgetさせる
 execute store result score @s senba.dummy run data get block ~ ~ ~ Items[{Slot:15b}].Count

#tellrawでコマンド生成
 tellraw @p[tag=senba.crafter-looking] [{"text":"\n---------------------------------\n---------------------------------\n","color": "gray"}]

 #クラフトファンクション

  #通常レシピコマンド
   #コピー
    tellraw @p[tag=senba.crafter-looking] [{"text":"data modify entity @s Item.tag.senba-Items[{Slot:15b}] set from block ~ ~ ~ Items[{Slot:15b}]"}]
    
   #アイテム設置
    tellraw @p[tag=senba.crafter-looking] [{"text":"execute as @s[tag=!senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"},{"text":"] run item replace block ~ ~ ~ container.15 with "},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.goods.id"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.goods.tag"},{"text":" "},{"score":{"name":"@s","objective":"senba.dummy"}}]

   #クラフト準備のタグ
    tellraw @p[tag=senba.crafter-looking] [{"text":"tag @s[type=!player] add senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]

   #クラフト欄にアイテムがあったとき用
    tellraw @p[tag=senba.crafter-looking] [{"text":"execute unless data block ~ ~ ~ {Items:["},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.goods"},{"text":"]}"},{"text":" run function senba.crafter:crafter/craft"}]
  
  #数検知
   tellraw @p[tag=senba.crafter-looking] [{"text":"function senba.crafter:crafter/unform"}]
   execute if data block ~ ~ ~ Items[{Slot: 1b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute store result entity @s Item.tag.unform."},{"block":"~ ~ ~","nbt":"Items[{Slot: 1b}].Slot"},{"text":" byte 1 run execute if entity @e[type=item,tag=senba.crafter-slot,distance=..1,nbt={Item:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter[0]"},{"text":"}]"}]
   execute if data block ~ ~ ~ Items[{Slot: 2b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute store result entity @s Item.tag.unform."},{"block":"~ ~ ~","nbt":"Items[{Slot: 2b}].Slot"},{"text":" byte 1 run execute if entity @e[type=item,tag=senba.crafter-slot,distance=..1,nbt={Item:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter[1]"},{"text":"}]"}]
   execute if data block ~ ~ ~ Items[{Slot: 3b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute store result entity @s Item.tag.unform."},{"block":"~ ~ ~","nbt":"Items[{Slot: 3b}].Slot"},{"text":" byte 1 run execute if entity @e[type=item,tag=senba.crafter-slot,distance=..1,nbt={Item:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter[2]"},{"text":"}]"}]
   execute if data block ~ ~ ~ Items[{Slot:10b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute store result entity @s Item.tag.unform."},{"block":"~ ~ ~","nbt":"Items[{Slot:10b}].Slot"},{"text":" byte 1 run execute if entity @e[type=item,tag=senba.crafter-slot,distance=..1,nbt={Item:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter[3]"},{"text":"}]"}]
   execute if data block ~ ~ ~ Items[{Slot:11b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute store result entity @s Item.tag.unform."},{"block":"~ ~ ~","nbt":"Items[{Slot:11b}].Slot"},{"text":" byte 1 run execute if entity @e[type=item,tag=senba.crafter-slot,distance=..1,nbt={Item:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter[4]"},{"text":"}]"}]
   execute if data block ~ ~ ~ Items[{Slot:12b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute store result entity @s Item.tag.unform."},{"block":"~ ~ ~","nbt":"Items[{Slot:12b}].Slot"},{"text":" byte 1 run execute if entity @e[type=item,tag=senba.crafter-slot,distance=..1,nbt={Item:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter[5]"},{"text":"}]"}]
   execute if data block ~ ~ ~ Items[{Slot:19b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute store result entity @s Item.tag.unform."},{"block":"~ ~ ~","nbt":"Items[{Slot:19b}].Slot"},{"text":" byte 1 run execute if entity @e[type=item,tag=senba.crafter-slot,distance=..1,nbt={Item:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter[6]"},{"text":"}]"}]
   execute if data block ~ ~ ~ Items[{Slot:20b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute store result entity @s Item.tag.unform."},{"block":"~ ~ ~","nbt":"Items[{Slot:20b}].Slot"},{"text":" byte 1 run execute if entity @e[type=item,tag=senba.crafter-slot,distance=..1,nbt={Item:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter[7]"},{"text":"}]"}]
   execute if data block ~ ~ ~ Items[{Slot:21b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute store result entity @s Item.tag.unform."},{"block":"~ ~ ~","nbt":"Items[{Slot:21b}].Slot"},{"text":" byte 1 run execute if entity @e[type=item,tag=senba.crafter-slot,distance=..1,nbt={Item:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter[8]"},{"text":"}]"}]
   
   execute if data block ~ ~ ~ Items[{Slot: 1b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute unless data entity @s {Item:{tag:{unform:{"},{"block":"~ ~ ~","nbt":"Items[{Slot: 1b}].Slot"},{"text":":"},{"block":"~ ~ ~","nbt":"Items[{Slot: 1b}].Count"},{"text":"}}}} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   execute if data block ~ ~ ~ Items[{Slot: 2b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute unless data entity @s {Item:{tag:{unform:{"},{"block":"~ ~ ~","nbt":"Items[{Slot: 2b}].Slot"},{"text":":"},{"block":"~ ~ ~","nbt":"Items[{Slot: 2b}].Count"},{"text":"}}}} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   execute if data block ~ ~ ~ Items[{Slot: 3b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute unless data entity @s {Item:{tag:{unform:{"},{"block":"~ ~ ~","nbt":"Items[{Slot: 3b}].Slot"},{"text":":"},{"block":"~ ~ ~","nbt":"Items[{Slot: 3b}].Count"},{"text":"}}}} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   execute if data block ~ ~ ~ Items[{Slot:10b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute unless data entity @s {Item:{tag:{unform:{"},{"block":"~ ~ ~","nbt":"Items[{Slot:10b}].Slot"},{"text":":"},{"block":"~ ~ ~","nbt":"Items[{Slot:10b}].Count"},{"text":"}}}} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   execute if data block ~ ~ ~ Items[{Slot:11b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute unless data entity @s {Item:{tag:{unform:{"},{"block":"~ ~ ~","nbt":"Items[{Slot:11b}].Slot"},{"text":":"},{"block":"~ ~ ~","nbt":"Items[{Slot:11b}].Count"},{"text":"}}}} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   execute if data block ~ ~ ~ Items[{Slot:12b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute unless data entity @s {Item:{tag:{unform:{"},{"block":"~ ~ ~","nbt":"Items[{Slot:12b}].Slot"},{"text":":"},{"block":"~ ~ ~","nbt":"Items[{Slot:12b}].Count"},{"text":"}}}} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   execute if data block ~ ~ ~ Items[{Slot:19b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute unless data entity @s {Item:{tag:{unform:{"},{"block":"~ ~ ~","nbt":"Items[{Slot:19b}].Slot"},{"text":":"},{"block":"~ ~ ~","nbt":"Items[{Slot:19b}].Count"},{"text":"}}}} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   execute if data block ~ ~ ~ Items[{Slot:20b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute unless data entity @s {Item:{tag:{unform:{"},{"block":"~ ~ ~","nbt":"Items[{Slot:20b}].Slot"},{"text":":"},{"block":"~ ~ ~","nbt":"Items[{Slot:20b}].Count"},{"text":"}}}} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   execute if data block ~ ~ ~ Items[{Slot:21b}] run tellraw @p[tag=senba.crafter-looking] [{"text":"execute unless data entity @s {Item:{tag:{unform:{"},{"block":"~ ~ ~","nbt":"Items[{Slot:21b}].Slot"},{"text":":"},{"block":"~ ~ ~","nbt":"Items[{Slot:21b}].Count"},{"text":"}}}} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   tellraw @p[tag=senba.crafter-looking] [{"text":"execute unless data entity @s {Item:{tag:{unform:{All:"},{"score":{"name":"#senba.crafter-All","objective":"senba.dummy"}},{"text":"b}}}} run tag @s remove "},{"text":"senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   #クラフト準備のタグ
   tellraw @p[tag=senba.crafter-looking] [{"text":"tag @s[type=!player,tag=senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"},{"text":"] add senba.crafter-recipe"}]
  #共通
    tellraw @p[tag=senba.crafter-looking] [{"text":"execute as @s[type=!player,tag=!senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"},{"text":"] run function senba.crafter:crafter/space"}]
  
  #自分用 プレイヤーがファンクションを実行したらgiveされる
   tellraw @p[tag=senba.crafter-looking] [{"text":"give @s[type=player] "},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.goods.id"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.goods.tag"},{"text":" "},{"score":{"name":"@s","objective":"senba.dummy"}}]
  
  #アイテムキル
  tellraw @p[tag=senba.crafter-looking] [{"text":"kill @e[type=item,tag=senba.crafter-slot]"}]
  kill @e[type=item,tag=senba.crafter-slot]
 
 #レシピファンクション
 tellraw @p[tag=senba.crafter-looking] [{"text":"---------------------------------","color": "gray"}]
   #
   tellraw @p[tag=senba.crafter-looking] [{"text":"execute if entity @s[tag=!senba.crafter-recipe,tag="},{"text":"senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"},{"text":"] unless data block ~ ~ ~ {Items:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter"},{"text":"} run function senba.crafter:crafter/space"}]
   tellraw @p[tag=senba.crafter-looking] [{"text":"execute if entity @s[tag=!senba.crafter-recipe] data block ~ ~ ~ {Items:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter"},{"text":"} run function "},{"selector":"@p"},{"text":":craft"}]

 tellraw @p[tag=senba.crafter-looking] [{"text":"\n---------------------------------\n---------------------------------\n","color": "gray"}]

#音
playsound minecraft:block.brewing_stand.brew master @a ~ ~1 ~ 1 1.5
particle minecraft:wax_on ~ ~ ~ 0.1 0.3 0.1 10 10
tag @s remove senba.crafter-make_unform
tag @a[tag=senba.crafter-looking] remove senba.crafter-looking

tag @s remove senba.crafter-make
scoreboard objectives remove senba.dummy
