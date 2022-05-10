# >#senba.crafter:recipe


#何があろうと完成品は渡さんぞ
data modify block ~ ~ ~ Items[{Slot:15b}] set from entity @s Item.tag.senba-Items[{Slot:15b}]

#さっきまで完成品があったのにないと言うことは誰かに取られた可能性アリ。完成品を@pからクリアーしろ
execute unless block ~ ~ ~ barrel{Items:[{Slot:15b}]} run data modify storage senba.clear Item set from entity @s Item.tag.senba-Items[{Slot:15b}]
execute unless block ~ ~ ~ barrel{Items:[{Slot:15b}]} as @p at @s run function senba.clear:main

#タグ消し
data merge entity @s {Tags:[senba.R.crafter,senba.crafting_table,senba.crafter-open]}
