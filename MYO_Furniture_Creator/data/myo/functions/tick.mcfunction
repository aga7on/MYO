# Основной тик
execute as @a at @s if items entity @s weapon.mainhand chest[custom_data~{myo_creator:1b}] run function myo:core/check_use
execute as @a[scores={myo_menu=1..}] at @s run function myo:menu/handle
execute as @a[scores={myo_editor=1..}] at @s run function myo:editor/handle
function myo:editor/detect_base
execute as @e[tag=myo_base] at @s run particle end_rod ~ ~1 ~ 0.2 0.2 0.2 0 1 force @a[distance=..10]
