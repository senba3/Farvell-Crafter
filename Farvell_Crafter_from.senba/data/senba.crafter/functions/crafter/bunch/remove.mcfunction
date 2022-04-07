#>snba.crafter:crafter/open


#アイテムの数を減らす 小数点以下はすべて切り捨てされる仕様を利用
 #1
 execute store result block ~ ~ ~ Items[{Slot: 1b}].Count float 1 run data get block ~ ~ ~ Items[{Slot:1b}].Count 0.99999
 #2
 execute store result block ~ ~ ~ Items[{Slot: 2b}].Count float 1 run data get block ~ ~ ~ Items[{Slot:2b}].Count 0.99999
 #3
 execute store result block ~ ~ ~ Items[{Slot: 3b}].Count float 1 run data get block ~ ~ ~ Items[{Slot:3b}].Count 0.99999
 #4
 execute store result block ~ ~ ~ Items[{Slot:10b}].Count float 1 run data get block ~ ~ ~ Items[{Slot:10b}].Count 0.99999
 #5
 execute store result block ~ ~ ~ Items[{Slot:11b}].Count float 1 run data get block ~ ~ ~ Items[{Slot:11b}].Count 0.99999
 #6
 execute store result block ~ ~ ~ Items[{Slot:12b}].Count float 1 run data get block ~ ~ ~ Items[{Slot:12b}].Count 0.99999
 #7
 execute store result block ~ ~ ~ Items[{Slot:19b}].Count float 1 run data get block ~ ~ ~ Items[{Slot:19b}].Count 0.99999
 #8
 execute store result block ~ ~ ~ Items[{Slot:20b}].Count float 1 run data get block ~ ~ ~ Items[{Slot:20b}].Count 0.99999
 #9
 execute store result block ~ ~ ~ Items[{Slot:21b}].Count float 1 run data get block ~ ~ ~ Items[{Slot:21b}].Count 0.99999
