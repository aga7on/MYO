# Движение курсора вперед
scoreboard players add @s myo_pos_z 1
execute if score @s myo_pos_z matches 17.. run scoreboard players set @s myo_pos_z 16
function myo:editor/update_cursor
