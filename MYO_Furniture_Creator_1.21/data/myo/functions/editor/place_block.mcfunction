# Установка блока
execute at @e[tag=myo_base,limit=1,sort=nearest] run summon armor_stand ~ ~ ~ {Tags:["myo_placed"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Блок","color":"blue"}]'}
execute as @e[tag=myo_placed,limit=1,sort=nearest] at @s run function myo:editor/position_placed
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Блок установлен!","color":"green"}]
