# Движение курсора вправо
scoreboard players add @s myo_pos_x 1
execute if score @s myo_pos_x matches 17.. run scoreboard players set @s myo_pos_x 16
function myo:editor/update_cursor
