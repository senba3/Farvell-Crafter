# >crafter

#アイテムがドロップしたかを記憶させる
execute if entity @e[type=item,distance=..1,limit=1,nbt={Age:0s,Item:{id:"minecraft:barrel",Count:1b}}] run tag @s add senba.crafter-loot

#消す
 #余計なものを消す
 execute if entity @s[tag=senba.crafter-loot] run kill @e[type=item,distance=..1,limit=1,nbt={Age:0s,Item:{id:"minecraft:barrel",Count:1b}}]
 clear @a paper{senba.crafter-kill_item:1b}
 #残留アイテム日本孤児 クラフト中に作業台が壊されたときに  拾ってしまったとき / 完成品を消す
 execute if entity @s[tag=senba.crafter-recipe] run function senba.crafter:crafter/break/summon
 #本体を消す
 kill @s[type=glow_item_frame]
 #念のためね?
 setblock ~ ~ ~ air destroy

#アイテムを出す(条件下で)
 execute if entity @s[tag=senba.crafter-loot] run loot spawn ~ ~ ~ loot senba.crafter:item
 
#お主、変なアイテムを持ってるんじゃなかろうな
schedule function senba.crafter:clear 1t
