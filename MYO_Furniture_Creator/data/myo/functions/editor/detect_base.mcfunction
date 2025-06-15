# Обнаружение установки основы
execute as @e[type=item,nbt={Item:{tag:{myo_base:1b}}}] at @s if block ~ ~ ~ barrier run tag @s add myo_base_placed
execute as @e[tag=myo_base_placed] at @s run summon armor_stand ~ ~ ~ {Tags:["myo_base"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Основа Мебели","color":"gold"}]'}
execute as @e[tag=myo_base_placed] run kill @s
