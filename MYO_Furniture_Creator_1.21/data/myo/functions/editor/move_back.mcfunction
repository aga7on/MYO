# Движение курсора назад
scoreboard players remove @s myo_pos_z 1
execute if score @s myo_pos_z matches ..-1 run scoreboard players set @s myo_pos_z 0
function myo:editor/update_cursor
