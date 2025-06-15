# Пример создания стола
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Создание примера стола...","color":"green"}]
summon armor_stand ~ ~ ~ {Tags:["myo_base"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Основа Стола","color":"gold"}]'}
# Столешница
execute at @e[tag=myo_base,limit=1] run fill ~0.125 ~0.75 ~0.125 ~0.875 ~0.8125 ~0.875 oak_planks replace air
# Ножки стола
execute at @e[tag=myo_base,limit=1] run fill ~0.125 ~0 ~0.125 ~0.25 ~0.75 ~0.25 oak_log replace air
execute at @e[tag=myo_base,limit=1] run fill ~0.75 ~0 ~0.125 ~0.875 ~0.75 ~0.25 oak_log replace air
execute at @e[tag=myo_base,limit=1] run fill ~0.125 ~0 ~0.75 ~0.25 ~0.75 ~0.875 oak_log replace air
execute at @e[tag=myo_base,limit=1] run fill ~0.75 ~0 ~0.75 ~0.875 ~0.75 ~0.875 oak_log replace air
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Стол создан!","color":"green"}]
