# Движение курсора вниз
scoreboard players remove @s myo_pos_y 1
execute if score @s myo_pos_y matches ..-1 run scoreboard players set @s myo_pos_y 0
function myo:editor/update_cursor
