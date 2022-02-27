

#クリアまでループ
execute as @s[tag=!senba.clear-finish] if data storage senba.clear {All:{Inventory:[{}]}} at @s run function senba.clear:clear/check

execute as @s[tag=!senba.clear-finish] if data storage senba.clear {All:{Inventory:[{}]}} at @s run function senba.clear:again

execute store result entity @s ArmorItems[0].tag.AttributeModifiers.[0].Amount double 1 run scoreboard players get @p test