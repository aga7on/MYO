# Возврат к редактору
scoreboard players set @s myo_page 1
function myo:editor/setup_hotbar_1
tellraw @s [{text:'[MYO] ",color:'gold'},{text:'Возврат к редактору',color:'green'}]
