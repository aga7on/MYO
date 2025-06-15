# Команда добавления в лист
tellraw @s [{text:'[MYO] ",color:'gold'},{text:'Введите название листа и название предмета:',color:'green'}]
tellraw @s [{text:'Формат: ',color:'yellow'},{text:'название_листа название_предмета',color:'aqua'}]
scoreboard players set @s myo_temp 2
