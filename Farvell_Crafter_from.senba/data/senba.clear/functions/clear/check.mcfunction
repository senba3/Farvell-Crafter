
#準備
data modify entity @s ArmorItems[3] set from storage senba.clear All.Inventory[0]
data remove storage senba.clear All.Inventory[0].Count
data modify storage senba.clear Item.Slot set from storage senba.clear All.Inventory[0].Slot

#同一かチェック
execute store result entity @s Small float 1 run data modify storage senba.clear All.Inventory[0] set from storage senba.clear Item

#例のスロットが指定のものだとファンクションを実行
execute as @s[nbt={Small:0b}] run function senba.clear:clear/clear

#チェック済みだよ
data remove storage senba.clear All.Inventory[0]
