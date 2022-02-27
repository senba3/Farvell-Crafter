# >snba.crafter:crafter/open


#完成品の押し出し
execute at @p[tag=senba.crafter-looking] run summon item ~ ~ ~ {Tags:[senba.crafter-item],Item:{id:"minecraft:paper",Count:1b,tag:{senba.crafter-kill_item:1b}}}
data modify entity @e[type=item,tag=senba.crafter-item,limit=1,sort=nearest] Item set from block ~ ~ ~ Items[{Slot:15b}]
execute at @p[tag=senba.crafter-looking] run tag @e[type=item,distance=..0.01,tag=senba.crafter-item] remove senba.crafter-item

#数滅
 #1
 execute store result block ~ ~ ~ Items[{Slot: 1b}].Count float 1 run data get block ~ ~ ~ Items[{Slot: 1b}].Count 0.99999
 #2
 execute store result block ~ ~ ~ Items[{Slot: 2b}].Count float 1 run data get block ~ ~ ~ Items[{Slot: 2b}].Count 0.99999
 #3
 execute store result block ~ ~ ~ Items[{Slot: 3b}].Count float 1 run data get block ~ ~ ~ Items[{Slot: 3b}].Count 0.99999
 #4
 execute store result block ~ ~ ~ Items[{Slot:10b}].Count float 1 run data get block ~ ~ ~ Items[{Slot: 10b}].Count 0.99999
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

#メキシコ参照ウオ
 #今の現状を的確にチェック
 data modify storage senba.crafter All.nowing set from block ~ ~ ~ Items
 data remove storage senba.crafter All.nowing[{tag:{senba.crafter-kill_item:1b}}]
 data remove storage senba.crafter All.nowing[{Slot:15b}]
 data remove storage senba.crafter All.nowing[{}].Count
 #ウーパールーパー(参照)する
 execute store result storage senba.crafter All.check byte 1 run data modify storage senba.crafter All.nowing set from storage senba.crafter All.now


#まだいけるな? もう一回! 気合が足りないぞ?!
execute if data storage senba.crafter {All:{check:0b}} run function senba.crafter:crafter/bunch/check
