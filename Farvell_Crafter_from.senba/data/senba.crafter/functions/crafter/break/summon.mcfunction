# >crafter >break


kill @e[type=item,distance=..2,nbt={Item:{tag:{senba.crafter-kill_item:1b}}}]


#まずは完成品が外にあるかないを探す
#準備
data modify storage senba.crafter All.15b set from entity @s Item.tag.senba-Items[{Slot:15b}]
data remove storage senba.crafter All.15b.Slot
data modify storage senba.crafter All.15b_ set from storage senba.crafter All.15b

function senba.crafter:crafter/break/surch

data remove storage senba.crafter All


#アイテムがなければクリアする
execute unless entity @e[type=item,distance=..2,tag=senba.crafter-15b] run data modify storage senba.clear Item set from entity @s Item.tag.senba-Items[{Slot:15b}]
execute unless entity @e[type=item,distance=..2,tag=senba.crafter-15b] if data entity @s {Item:{tag:{senba-Items:[{Slot:15b}]}}} as @p at @s run function senba.clear:main


#アイテムがあれば消して召喚
kill @e[type=item,distance=..2,tag=senba.crafter-15b]
tag @e[type=item,distance=..2,tag=senba.crafter-checked] remove senba.crafter-checked
