# Движение курсора вверх
scoreboard players add @s myo_pos_y 1
execute if score @s myo_pos_y matches 17.. run scoreboard players set @s myo_pos_y 16
function myo:editor/update_cursor
