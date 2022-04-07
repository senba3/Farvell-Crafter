

#アイテムを指定分減らす
data modify storage senba.clear All.Inventory[0].checked set value 1b
execute store result score @s senba.clear run data get storage senba.clear All.Inventory[0].Count
scoreboard players operation @s senba.clear -= #Select senba.clear


#アイテムを適用
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot: 0b}]}} run item modify entity @p hotbar.0 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot: 1b}]}} run item modify entity @p hotbar.1 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot: 2b}]}} run item modify entity @p hotbar.2 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot: 3b}]}} run item modify entity @p hotbar.3 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot: 4b}]}} run item modify entity @p hotbar.4 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot: 5b}]}} run item modify entity @p hotbar.5 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot: 6b}]}} run item modify entity @p hotbar.6 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot: 7b}]}} run item modify entity @p hotbar.7 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot: 8b}]}} run item modify entity @p hotbar.8 senba.clear:count

execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot: 9b}]}} run item modify entity @p inventory.0 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:10b}]}} run item modify entity @p inventory.1 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:11b}]}} run item modify entity @p inventory.2 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:12b}]}} run item modify entity @p inventory.3 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:13b}]}} run item modify entity @p inventory.4 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:14b}]}} run item modify entity @p inventory.5 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:15b}]}} run item modify entity @p inventory.6 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:16b}]}} run item modify entity @p inventory.7 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:17b}]}} run item modify entity @p inventory.8 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:18b}]}} run item modify entity @p inventory.9 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:19b}]}} run item modify entity @p inventory.10 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:20b}]}} run item modify entity @p inventory.11 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:21b}]}} run item modify entity @p inventory.12 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:22b}]}} run item modify entity @p inventory.13 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:23b}]}} run item modify entity @p inventory.14 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:24b}]}} run item modify entity @p inventory.15 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:25b}]}} run item modify entity @p inventory.16 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:26b}]}} run item modify entity @p inventory.17 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:27b}]}} run item modify entity @p inventory.18 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:28b}]}} run item modify entity @p inventory.19 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:29b}]}} run item modify entity @p inventory.20 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:30b}]}} run item modify entity @p inventory.21 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:31b}]}} run item modify entity @p inventory.22 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:32b}]}} run item modify entity @p inventory.23 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:33b}]}} run item modify entity @p inventory.24 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:34b}]}} run item modify entity @p inventory.25 senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:35b}]}} run item modify entity @p inventory.26 senba.clear:count

execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:100b}]}} run item modify entity @p armor.feet senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:101b}]}} run item modify entity @p armor.legs senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:102b}]}} run item modify entity @p armor.chest senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:103b}]}} run item modify entity @p armor.head senba.clear:count
execute if data storage senba.clear {All:{Inventory:[{checked:1b,Slot:-106b}]}} run item modify entity @p weapon.offhand senba.clear:count

#この後どうすんの?減らすの?減らさないの?
execute if score @s senba.clear matches 0.. run function senba.clear:clear/finish
execute if score @s senba.clear matches ..-1 run function senba.clear:clear/more
