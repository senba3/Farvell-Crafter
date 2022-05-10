# >senba.crafter:crafter/drop


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
# {"storage":"senba.crafter","nbt":"All.UUID[0]"}
#レシピ=
# {"storage":"senba.crafter","nbt":"All.crafter"}
#完成アイテム=
# {"text":"[{id:\""},{"storage":"senba.crafter","nbt":"All.goods.id"},{"text":"\",tag:"},{"storage":"senba.crafter","nbt":"All.goods.tag"},{"text":"}]}"}

#ブロックのデータを写す用アイテム
 tag @s remove senba.crafter-make_recipe
 summon area_effect_cloud

#データを写す(Count以外を写します)
 #idを写す
  data modify storage senba.crafter All.crafter set from block ~ ~ ~ Items
  data remove storage senba.crafter All.crafter[{tag:{senba.crafter-kill_item:1b}}]
  data remove storage senba.crafter All.crafter[{Slot:15b}]
  data modify storage senba.crafter All.goods set from block ~ ~ ~ Items[{Slot:15b}]
 #Countを消す
  data remove storage senba.crafter All.crafter[{}].Count
 #bをのける
 execute store result storage senba.crafter All.Count int 1 run data get block ~ ~ ~ Items[{Slot:15b}].Count
 #被らないであろう数字
 data modify storage senba.crafter All.UUID set from entity @e[type=area_effect_cloud,limit=1] UUID

#tellrawでコマンド生成
 tellraw @p[tag=senba.crafter-looking] [{"text":"\n---------------------------------\n---------------------------------\n","color": "gray"}]

 #クラフトファンクション

  #通常レシピコマンド
   #コピー
    tellraw @p[tag=senba.crafter-looking] [{"text":"data modify entity @s Item.tag.senba-Items[{Slot:15b}] set from block ~ ~ ~ Items[{Slot:15b}]"}]

   #アイテム設置
    tellraw @p[tag=senba.crafter-looking] [{"text":"execute as @s[tag=!senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"},{"text":"] run item replace block ~ ~ ~ container.15 with "},{"storage":"senba.crafter","nbt":"All.goods.id"},{"storage":"senba.crafter","nbt":"All.goods.tag"},{"text":" "},{"storage":"senba.crafter","nbt":"All.Count"}]

   #クラフト準備のタグ
    tellraw @p[tag=senba.crafter-looking] [{"text":"tag @s[type=!player] add senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"}]

   #クラフト欄にアイテムがあったとき用
    tellraw @p[tag=senba.crafter-looking] [{"text":"execute unless data block ~ ~ ~ {Items:["},{"storage":"senba.crafter","nbt":"All.goods"},{"text":"]}"},{"text":" run function senba.crafter:crafter/craft"}]

  #空白アイテムに対応
   #1
    execute unless block ~ ~ ~ barrel{Items:[{Slot: 1b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot: 1b}]} run tag @s remove senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"}]
   #2
    execute unless block ~ ~ ~ barrel{Items:[{Slot: 2b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot: 2b}]} run tag @s remove senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"}]
   #3
    execute unless block ~ ~ ~ barrel{Items:[{Slot: 3b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot: 3b}]} run tag @s remove senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"}]
   #4
    execute unless block ~ ~ ~ barrel{Items:[{Slot:10b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot:10b}]} run tag @s remove senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"}]
   #5
    execute unless block ~ ~ ~ barrel{Items:[{Slot:11b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot:11b}]} run tag @s remove senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"}]
   #6
    execute unless block ~ ~ ~ barrel{Items:[{Slot:12b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot:12b}]} run tag @s remove senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"}]
   #7
    execute unless block ~ ~ ~ barrel{Items:[{Slot:19b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot:19b}]} run tag @s remove senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"}]
   #8
    execute unless block ~ ~ ~ barrel{Items:[{Slot:20b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot:20b}]} run tag @s remove senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"}]
   #9
    execute unless block ~ ~ ~ barrel{Items:[{Slot:21b}]} run tellraw @p[tag=senba.crafter-looking] [{"text":"execute if data block ~ ~ ~ {Items:[{Slot:21b}]} run tag @s remove senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"}]
   #クラフト準備のタグ
    tellraw @p[tag=senba.crafter-looking] [{"text":"tag @s[type=!player,tag=senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"},{"text":"] add senba.crafter-recipe"}]
   #共通
    tellraw @p[tag=senba.crafter-looking] [{"text":"execute as @s[type=!player,tag=!senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"},{"text":"] run function senba.crafter:crafter/space"}]
  
  #自分用 プレイヤーがファンクションを実行したらgiveされる
   tellraw @p[tag=senba.crafter-looking] [{"text":"give @s[type=player] "},{"storage":"senba.crafter","nbt":"All.goods.id"},{"storage":"senba.crafter","nbt":"All.goods.tag"},{"text":" "},{"storage":"senba.crafter","nbt":"All.Count"}]
 
 
 #レシピファンクション
 tellraw @p[tag=senba.crafter-looking] [{"text":"---------------------------------","color": "gray"}]
   #
   tellraw @p[tag=senba.crafter-looking] [{"text":"execute if entity @s[tag=!senba.crafter-recipe,tag="},{"text":"senba.craft+"},{"storage":"senba.crafter","nbt":"All.UUID[0]"},{"text":"] unless data block ~ ~ ~ {Items:"},{"storage":"senba.crafter","nbt":"All.crafter"},{"text":"} run function senba.crafter:crafter/space"}]
   tellraw @p[tag=senba.crafter-looking] [{"text":"execute if entity @s[tag=!senba.crafter-recipe] if data block ~ ~ ~ {Items:"},{"storage":"senba.crafter","nbt":"All.crafter"},{"text":"} run function "},{"selector":"@p"},{"text":":craft"}]

 tellraw @p[tag=senba.crafter-looking] [{"text":"\n---------------------------------\n---------------------------------\n","color": "gray"}]

#音
playsound minecraft:block.brewing_stand.brew master @a ~ ~1 ~ 1 1.5
particle minecraft:wax_off ~ ~ ~ 0.1 0.3 0.1 10 10
tag @a[tag=senba.crafter-looking] remove senba.crafter-looking

tag @s remove senba.crafter-make
scoreboard objectives remove senba.dummy