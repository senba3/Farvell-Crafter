

#クリアまでループ
execute if data storage senba.clear {All:{Inventory:[{}]}} at @s run function senba.clear:clear/check

execute if data storage senba.clear {All:{Inventory:[{}]}} at @s run function senba.clear:again
