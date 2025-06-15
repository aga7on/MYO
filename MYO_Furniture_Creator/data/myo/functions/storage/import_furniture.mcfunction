# Импорт мебели
tellraw @s [{text:'[MYO] ",color:'gold'},{text:'=== ИМПОРТ МЕБЕЛИ ===',color:'green",bold:true}]
tellraw @s [{text:'Введите код импорта в чат:',color:'yellow'}]
tellraw @s [{text:'Пример: ',color:'gray'},{text:'MYO_IMPORT_CODE_67890',color:'aqua',click_event:{'action':'suggest_command',value:'MYO_IMPORT_CODE_67890'}}]
scoreboard players set @s myo_temp 4
