#
#  <進捗の解除条件>   多いかもしれないけど常時実行よりかはマシでしょ
#1. 装飾用アイテムがインベントリに入る
#2. 作業台を設置する
#3. 額縁に作用する
#4. この作業台を設置する
#
#+. なんか怪しそうだったら実行


#進捗を解除し、再検知狩野永徳にする
advancement revoke @a only senba.crafter:check


#クラフターの読み込み
execute at @a as @e[distance=..9,type=glow_item_frame,tag=senba.crafting_table,tag=senba.born] at @s run function senba.crafter:loot

#作業台を作る 鉄インゴットか金塊(額縁が選びに選んだ究極の(訳:nbtタグが付いてない))の額縁の下に作業台があれば...
execute at @a as @e[distance=..9,type=item_frame,tag=!senba.R.crafter,x_rotation=-90,nbt=!{Item:{tag:{}},Fixed:1b}] unless entity @s[nbt=!{Item:{id:"minecraft:iron_ingot"}},nbt=!{Item:{id:"minecraft:paper"}},nbt=!{Item:{id:"minecraft:gold_nugget"}}] at @s positioned ~ ~-1 ~ if block ~ ~ ~ crafting_table run function senba.crafter:loot

#アイテムを没収する
clear @a paper{senba.crafter-kill_item:1b}
kill @e[type=item,nbt={Item:{tag:{senba.crafter-kill_item:1b}}}]
