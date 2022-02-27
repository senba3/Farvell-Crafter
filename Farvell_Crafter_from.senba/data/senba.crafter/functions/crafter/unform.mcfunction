# >#senba.crafter:recipe


#アイテムを外の世界に一瞬出す
summon chest_minecart ~ ~ ~ {Tags:["senba.crafter-chest"],Silent:1b}
execute positioned ~ ~ ~ run data modify entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] Items set from block ~ ~ ~ Items
execute positioned ~ ~ ~ run data modify entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] Items[{}].Count set value 1b
execute positioned ~ ~ ~ run data remove entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] Items[{Slot:15b}]
execute positioned ~ ~ ~ run data modify entity @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1] Items[{}].tag.senba-kill_item set value 4b
execute positioned ~ ~ ~ run kill @e[distance=..0.001,type=chest_minecart,tag=senba.crafter-chest,limit=1]
execute positioned ~ ~ ~ run tag @e[type=item,distance=..0.5,nbt={Item:{tag:{senba-kill_item:4b}}}] add senba.crafter-slot
execute positioned ~ ~ ~ run kill @e[distance=..0.5,type=item,tag=senba.crafter-slot,nbt={Item:{tag:{senba.crafter-kill_item:1b}}}]
