# >crafter >break

#
kill @e[type=item,distance=..2,nbt={Item:{tag:{senba.crafter-kill_item:1b}}}]

#スコア
scoreboard objectives add sen.dummy dummy
execute store result score @s sen.dummy run data get entity @s Item.tag.senba-Items[{Slot:15b}].Count


#まずは完成品が外にあるかないを探す
#準備
data modify storage senba.crafter All.15b set from entity @s Item.tag.senba-Items[{Slot:15b}]
data remove storage senba.crafter All.15b.Slot
data modify storage senba.crafter All.15b_ set from storage senba.crafter All.15b
#サーチ
function senba.crafter:crafter/break/surch

#アイテムを消し切れているか
execute as @e[type=item,distance=..2,tag=senba.crafter-15b] store result score @s sen.dummy run data get entity @s Item.Count
scoreboard players operation @s sen.dummy -= @e[type=item,distance=..2,tag=senba.crafter-15b] sen.dummy

#アイテムがなければクリアする
data modify storage senba.clear Item set from entity @s Item.tag.senba-Items[{Slot:15b}]
execute store result storage senba.clear Item.Count byte 1 run scoreboard players get @s sen.dummy
execute if data entity @s {Item:{tag:{senba-Items:[{Slot:15b}]}}} as @p at @s run function senba.clear:main

#万が一アイテムを消しすぎていた場合のため、アイテムを召喚しておく
summon item ~ ~ ~ {Item:{Count:1b,id:"minecraft:paper",tag:{senba.crafter-kill_item:1b,CustomModelData:3}}}
data modify entity @e[type=item,distance=..0.001,limit=1,sort=nearest] Item set from entity @s Item.tag.senba-Items[{Slot:15b}]
execute store result entity @e[type=item,distance=..0.001,limit=1,sort=nearest] Item.Count byte -1 run scoreboard players get @s sen.dummy

#アイテムがあれば消す
kill @e[type=item,distance=..2,tag=senba.crafter-15b]
tag @e[type=item,distance=..2,tag=senba.crafter-checked] remove senba.crafter-checked
