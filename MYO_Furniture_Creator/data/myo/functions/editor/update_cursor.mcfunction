# Обновление позиции курсора
execute at @e[tag=myo_base,limit=1,sort=nearest] run kill @e[tag=myo_cursor,distance=..2]
execute at @e[tag=myo_base,limit=1,sort=nearest] run summon armor_stand ~ ~ ~ {Tags:["myo_cursor"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{text:'Курсор',color:"red'}]'}
execute as @e[tag=myo_cursor,limit=1,sort=nearest] at @s run function myo:editor/position_cursor
