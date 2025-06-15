# Пример создания стула
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Создание примера стула...","color":"green"}]
summon armor_stand ~ ~ ~ {Tags:["myo_base"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Основа Стула","color":"gold"}]'}
# Сиденье стула
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.25 ~0.5 ~0.25 {Tags:["myo_placed","chair_seat"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.5 ~0.5 ~0.25 {Tags:["myo_placed","chair_seat"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.75 ~0.5 ~0.25 {Tags:["myo_placed","chair_seat"],Invisible:1b,NoGravity:1b,Marker:1b}
# Ножки стула
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.25 ~0.0625 ~0.25 {Tags:["myo_placed","chair_leg"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.75 ~0.0625 ~0.25 {Tags:["myo_placed","chair_leg"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.25 ~0.0625 ~0.75 {Tags:["myo_placed","chair_leg"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.75 ~0.0625 ~0.75 {Tags:["myo_placed","chair_leg"],Invisible:1b,NoGravity:1b,Marker:1b}
# Спинка стула
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.25 ~0.75 ~0.75 {Tags:["myo_placed","chair_back"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.5 ~0.75 ~0.75 {Tags:["myo_placed","chair_back"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.75 ~0.75 ~0.75 {Tags:["myo_placed","chair_back"],Invisible:1b,NoGravity:1b,Marker:1b}
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Стул создан! Используйте редактор для изменений.","color":"green"}]
