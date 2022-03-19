# >#senba.crafter:recipe


#アイテムを外の世界に一瞬出す
summon chest_minecart ~ ~ ~ {Tags:["senba.crafter-chest"],Silent:1b}
data modify entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] Items set from block ~ ~ ~ Items
data modify entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] Items[{}].Count set value 1b
data remove entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] Items[{Slot:15b}]
data modify entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] Items[{}].tag.senba-kill_item set value 4b
kill @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1]
tag @e[type=item,distance=..1,nbt={Item:{tag:{senba-kill_item:4b}}}] add senba.crafter-slot
kill @e[distance=..1,type=item,tag=senba.crafter-slot,nbt={Item:{tag:{senba.crafter-kill_item:1b}}}]

execute store result entity @s Item.tag.unform.All byte 1 run execute if entity @e[distance=..1,type=item,tag=senba.crafter-slot]
#tellraw @a {"entity":"@s","nbt":"Item.tag.unform.All"}
