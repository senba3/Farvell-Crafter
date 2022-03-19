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
# {"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}
#レシピ=
# {"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter"}
#完成アイテム=
# {"text":"[{id:\""},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.goods.id"},{"text":"\",tag:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.goods.tag"},{"text":"}]}"}

#ブロックのデータを写す用アイテム
 tag @s remove senba.crafter-make_recipe
 summon item ~ ~ ~ {Tags:["senba.crafter-get"],Item:{id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b,CustomModelData:3,goods:{},crafter:[]}}}
#データを写す(Count以外を写します)
 #idを写す
  data modify entity @e[type=item,limit=1,tag=senba.crafter-get] Item.tag.crafter set from block ~ ~ ~ Items
  data remove entity @e[type=item,limit=1,tag=senba.crafter-get] Item.tag.crafter[{tag:{senba.crafter-kill_item:1b}}]
  data remove entity @e[type=item,limit=1,tag=senba.crafter-get] Item.tag.crafter[{Slot:15b}]
  data modify entity @e[type=item,limit=1,tag=senba.crafter-get] Item.tag.goods set from block ~ ~ ~ Items[{Slot:15b}]
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
    tellraw @p[tag=senba.crafter-looking] [{"text":"execute as @s[tag=senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"},{"text":"] unless block ~ ~ ~ barrel{Items:["},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.goods"},{"text":"]}"},{"text":" run function senba.crafter:crafter/craft"}]

  #空白アイテムに対応
   #1
    execute unless block ~ ~ ~ barrel{Items:[{Slot: 1b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot: 1b}]} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   #2
    execute unless block ~ ~ ~ barrel{Items:[{Slot: 2b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot: 2b}]} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   #3
    execute unless block ~ ~ ~ barrel{Items:[{Slot: 3b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot: 3b}]} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   #4
    execute unless block ~ ~ ~ barrel{Items:[{Slot:10b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot:10b}]} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   #5
    execute unless block ~ ~ ~ barrel{Items:[{Slot:11b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot:11b}]} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   #6
    execute unless block ~ ~ ~ barrel{Items:[{Slot:12b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot:12b}]} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   #7
    execute unless block ~ ~ ~ barrel{Items:[{Slot:19b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot:19b}]} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   #8
    execute unless block ~ ~ ~ barrel{Items:[{Slot:20b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot:20b}]} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   #9
    execute unless block ~ ~ ~ barrel{Items:[{Slot:21b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot:21b}]} run tag @s remove senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"}]
   #クラフト準備のタグ
    tellraw @p[tag=senba.crafter-looking] [{"text":"tag @s[type=!player,tag=senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"},{"text":"] add senba.crafter-recipe"}]
   #共通
    tellraw @p[tag=senba.crafter-looking] [{"text":"execute as @s[type=!player,tag=!senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"},{"text":"] run function senba.crafter:crafter/space"}]
  
  #自分用 プレイヤーがファンクションを実行したらgiveされる
   tellraw @p[tag=senba.crafter-looking] [{"text":"give @s[type=player] "},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.goods.id"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.goods.tag"},{"text":" "},{"score":{"name":"@s","objective":"senba.dummy"}}]
 
 
 #レシピファンクション
 tellraw @p[tag=senba.crafter-looking] [{"text":"---------------------------------","color": "gray"}]
   #
   tellraw @p[tag=senba.crafter-looking] [{"text":"execute if entity @s[tag=!senba.crafter-recipe,tag="},{"text":"senba.craft+"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"UUID[0]"},{"text":"] unless data block ~ ~ ~ {Items:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter"},{"text":"} run function senba.crafter:crafter/space"}]
   tellraw @p[tag=senba.crafter-looking] [{"text":"execute if entity @s[tag=!senba.crafter-recipe] if data block ~ ~ ~ {Items:"},{"entity":"@e[type=item,limit=1,tag=senba.crafter-get]","nbt":"Item.tag.crafter"},{"text":"} run function "},{"selector":"@p"},{"text":":craft"}]

 tellraw @p[tag=senba.crafter-looking] [{"text":"\n---------------------------------\n---------------------------------\n","color": "gray"}]

#音
playsound minecraft:block.brewing_stand.brew master @a ~ ~1 ~ 1 1.5
particle minecraft:wax_off ~ ~ ~ 0.1 0.3 0.1 10 10
tag @a[tag=senba.crafter-looking] remove senba.crafter-looking

tag @s remove senba.crafter-make
scoreboard objectives remove senba.dummy