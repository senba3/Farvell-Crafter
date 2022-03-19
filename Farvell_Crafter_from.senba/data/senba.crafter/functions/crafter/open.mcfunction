# >senba.crafter:if


#樽の開閉音は耳障りなのでとりまストップサウンドする 開時のみ
execute unless entity @s[tag=senba.crafter-open] run function senba.crafter:crafter/begin


#レシピを生成したい
execute unless entity @s[tag=senba.crafter-make] if predicate senba.crafter:command_block_here run function senba.crafter:crafter/recipe

#もし､GUIが正常じゃなかった場合、急速に修正に入る )
execute unless data block ~ ~ ~ {Items:[{Slot:0b,tag:{senba.crafter-Titem:1b}},{Slot:4b,tag:{senba.crafter-Titem:2b}},{Slot:5b,tag:{senba.crafter-Titem:3b}},{Slot:6b,tag:{senba.crafter-Titem:4b}},{Slot:7b,tag:{senba.crafter-Titem:5b}},{Slot:8b,tag:{senba.crafter-Titem:6b}},{Slot:9b,tag:{senba.crafter-Titem:7b}},{Slot:13b,tag:{senba.crafter-Titem:8b}},{Slot:14b,tag:{senba.crafter-Titem:9b}},{Slot:16b,tag:{senba.crafter-Titem:11b}},{Slot:17b,tag:{senba.crafter-Titem:12b}},{Slot:18b,tag:{senba.crafter-Titem:13b}},{Slot:22b,tag:{senba.crafter-Titem:14b}},{Slot:23b,tag:{senba.crafter-Titem:15b}},{Slot:24b,tag:{senba.crafter-Titem:16b}},{Slot:25b,tag:{senba.crafter-Titem:17b}},{Slot:26b,tag:{senba.crafter-Titem:18b}}]} run function senba.crafter:crafter/drop
execute unless entity @s[tag=senba.crafter-recipe] unless block ~ ~ ~ barrel{Items:[{Slot:15b,tag:{senba.crafter-kill_item:1b}}]} run function senba.crafter:crafter/drop


#アイテムを記憶させる 緊急時に使用
data modify entity @s Item.tag.senba-Items[{Slot:15b}] set from block ~ ~ ~ Items[{Slot:15b}]

#クラフトレシピがあるかのファンクションを読み込む
tag @s[tag=senba.crafter-recipe] remove senba.crafter-recipe
execute unless entity @e[distance=..2,type=hopper_minecart] unless entity @s[tag=senba.crafter-make] run function #senba.crafter:recipe


#ホッパートロッコ対策   (一気に来られるとアイテムが盗まれる)
execute if entity @e[distance=..2,type=hopper_minecart] run item replace block ~ ~ ~ container.15 with paper{senba.crafter-kill_item:1b,senba.crafter-Titem:10b,CustomModelData:3,display:{Name:'""'}}

#アイテム消去
execute unless entity @s[tag=senba.crafter-recipe] run item replace block ~ ~ ~ container.15 with paper{CustomModelData:3,senba.crafter-kill_item:1b,display:{Name:'""'}}

#アイテムを記憶させる(二回目) 緊急時に使用
execute if entity @s[tag=senba.crafter-recipe] run data modify entity @s Item.tag.senba-Items set from block ~ ~ ~ Items
