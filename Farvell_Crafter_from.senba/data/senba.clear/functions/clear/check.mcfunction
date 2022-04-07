
#準備
data modify storage senba.clear Item.Count set from storage senba.clear All.Inventory[0].Count
data modify storage senba.clear Item.Slot set from storage senba.clear All.Inventory[0].Slot

#同一かチェック
execute store result storage senba.clear All.check byte 1 run data modify storage senba.clear All.Inventory[0] set from storage senba.clear Item

#例のスロットが指定のものだとファンクションを実行
execute if data storage senba.clear {All:{check:0b}} run function senba.clear:clear/clear

#チェック済みだよ
data remove storage senba.clear All.Inventory[0]
