# Команда создания нового листа
execute unless data storage myo:lists lists run data modify storage myo:lists lists set value []
tellraw @s [{text:'[MYO] ",color:'gold'},{text:'Введите название нового листа в чат:',color:'green'}]
tellraw @s [{text:'Пример: ',color:'yellow'},{text:'Моя Мебель',color:'aqua',click_event:{'action':'suggest_command',value:'Моя Мебель'}}]
scoreboard players set @s myo_temp 1
