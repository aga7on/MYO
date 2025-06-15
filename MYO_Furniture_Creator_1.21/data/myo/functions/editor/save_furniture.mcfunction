# Сохранение мебели
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Для сохранения мебели используйте команды:","color":"green"}]
tellraw @s [{"text":"Создать новый лист: ","color":"yellow"},{"text":"/myo newlist \"название_листа\"","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function myo:storage/new_list"}}]
tellraw @s [{"text":"Добавить в существующий: ","color":"yellow"},{"text":"/myo addlist \"лист\" \"название\"","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function myo:storage/add_to_list"}}]
