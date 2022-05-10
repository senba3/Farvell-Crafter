# >senba.crafter:crafter/main


#
#  |+| 私の軽量化技術がされ尽くした最終形態 |+|  
#


#作業台本体が実行 まとめて軽量化を図る   (ファンクションを読み込むのは重いって誰かが言ってたような気がするから今回は個別実行は避けておきます)

 #作業台の破壊判定
 execute as @e[type=glow_item_frame,tag=senba.crafting_table] at @s unless block ~ ~ ~ barrel run function senba.crafter:crafter/break/main

 #作業台が閉まったときに実行    (エンテテ検知は短くしたほうが軽量化な気がする ifとかも含め なのでタグを最低限度のものに...)
 execute as @e[type=glow_item_frame,tag=senba.crafter-open] at @s if block ~ ~ ~ barrel[open=false] run function senba.crafter:crafter/close

 #作業台が開いてるときに実行
 execute as @e[type=glow_item_frame,tag=senba.crafting_table] at @s if block ~ ~ ~ barrel[open=true] run function senba.crafter:crafter/open

 #作業台のアイテムが取られては大変だ! せき止めるぞ (万が一取られていいようにはなってはいるが､一応ね?)
 execute at @e[type=glow_item_frame,tag=senba.crafting_table] if block ~ ~-1 ~ hopper run data modify block ~ ~-1 ~ TransferCooldown set value 2

