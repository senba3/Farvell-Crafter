

#アイテムを指定分減らす
data modify storage senba.clear All.Inventory[0].checked set value 1b
execute store result score @s senba.clear run data get entity @s ArmorItems[3].Count
data modify entity @s Air set from storage senba.clear All.Count
execute store result score #Select senba.clear run data get entity @s Air
scoreboard players operation @s senba.clear -= #Select senba.clear
execute store result entity @s ArmorItems[3].Count float 1 run scoreboard players get @s senba.clear


#アイテムを適用
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:0b}]}} run item replace entity @p hotbar.0 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:1b}]}} run item replace entity @p hotbar.1 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:2b}]}} run item replace entity @p hotbar.2 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:3b}]}} run item replace entity @p hotbar.3 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:4b}]}} run item replace entity @p hotbar.4 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:5b}]}} run item replace entity @p hotbar.5 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:6b}]}} run item replace entity @p hotbar.6 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:7b}]}} run item replace entity @p hotbar.7 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:8b}]}} run item replace entity @p hotbar.8 from entity @s armor.head

execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:9b}]}} run item replace entity @p inventory.0 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:10b}]}} run item replace entity @p inventory.1 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:11b}]}} run item replace entity @p inventory.2 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:12b}]}} run item replace entity @p inventory.3 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:13b}]}} run item replace entity @p inventory.4 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:14b}]}} run item replace entity @p inventory.5 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:15b}]}} run item replace entity @p inventory.6 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:16b}]}} run item replace entity @p inventory.7 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:17b}]}} run item replace entity @p inventory.8 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:18b}]}} run item replace entity @p inventory.9 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:19b}]}} run item replace entity @p inventory.10 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:20b}]}} run item replace entity @p inventory.11 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:21b}]}} run item replace entity @p inventory.12 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:22b}]}} run item replace entity @p inventory.13 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:23b}]}} run item replace entity @p inventory.14 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:24b}]}} run item replace entity @p inventory.15 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:25b}]}} run item replace entity @p inventory.16 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:26b}]}} run item replace entity @p inventory.17 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:27b}]}} run item replace entity @p inventory.18 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:28b}]}} run item replace entity @p inventory.19 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:29b}]}} run item replace entity @p inventory.20 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:30b}]}} run item replace entity @p inventory.21 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:31b}]}} run item replace entity @p inventory.22 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:32b}]}} run item replace entity @p inventory.23 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:33b}]}} run item replace entity @p inventory.24 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:34b}]}} run item replace entity @p inventory.25 from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:35b}]}} run item replace entity @p inventory.26 from entity @s armor.head

execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:100b}]}} run item replace entity @p armor.feet from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:101b}]}} run item replace entity @p armor.legs from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:102b}]}} run item replace entity @p armor.chest from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:103b}]}} run item replace entity @p armor.head from entity @s armor.head
execute as @e[type=armor_stand,tag=senba.clear] if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:-106b}]}} run item replace entity @p weapon.offhand from entity @s armor.head

#この後どうすんの?減らすの?減らさないの?
execute if score @s senba.clear matches 0.. run function senba.clear:clear/finish
execute if score @s senba.clear matches ..-1 run function senba.clear:clear/more

#戻す
data modify entity @s Small set value 1b