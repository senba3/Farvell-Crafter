# >senba.crafter:crafter/open


#数コマンドのためだけにいったい何をやっているんだ？
stopsound @a block block.barrel.open
tag @s add senba.crafter-open


#他にやることがないのでとりあえずアイテムでも消しとく
schedule function senba.crafter:clear 1t

#それでもやることがないのでアイテムでも押し出しとく
function senba.crafter:crafter/drop
