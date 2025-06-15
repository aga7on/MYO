# Движение курсора влево
scoreboard players remove @s myo_pos_x 1
execute if score @s myo_pos_x matches ..-1 run scoreboard players set @s myo_pos_x 0
function myo:editor/update_cursor
