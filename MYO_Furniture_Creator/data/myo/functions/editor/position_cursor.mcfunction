# Позиционирование курсора
execute store result entity @s Pos[0] double 0.0625 run scoreboard players get @p myo_pos_x
execute store result entity @s Pos[1] double 0.0625 run scoreboard players get @p myo_pos_y
execute store result entity @s Pos[2] double 0.0625 run scoreboard players get @p myo_pos_z
execute at @s run particle redstone 1 0 0 1 ~ ~0.5 ~ 0.1 0.1 0.1 0 5 force @p
