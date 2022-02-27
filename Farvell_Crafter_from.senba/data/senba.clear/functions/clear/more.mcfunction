
#負の数を正の数にする
scoreboard players set $-1 senba.clear -1
scoreboard players operation #Select senba.clear = @s senba.clear
scoreboard players operation #Select senba.clear *= $-1 senba.clear
execute store result storage senba.clear All.Count float 1 run scoreboard players get #Select senba.clear
