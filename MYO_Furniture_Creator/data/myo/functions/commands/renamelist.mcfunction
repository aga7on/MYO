# Команда переименования листа
tellraw @s [{text:'[MYO] ",color:'gold'},{text:'Введите старое и новое название листа:',color:'green'}]
tellraw @s [{text:'Формат: ',color:'yellow'},{text:'старое_название новое_название',color:'aqua'}]
scoreboard players set @s myo_temp 3
