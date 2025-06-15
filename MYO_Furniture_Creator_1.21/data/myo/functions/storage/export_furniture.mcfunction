# Экспорт мебели
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"=== ЭКСПОРТ МЕБЕЛИ ===","color":"green","bold":true}]
tellraw @s [{"text":"Ваш код экспорта:","color":"yellow"}]
tellraw @s [{"text":"MYO_EXPORT_CODE_12345","color":"aqua","bold":true,"clickEvent":{"action":"copy_to_clipboard","value":"MYO_EXPORT_CODE_12345"},"hoverEvent":{"action":"show_text","contents":"Нажмите для копирования"}}]
tellraw @s [{"text":"Поделитесь этим кодом с друзьями!","color":"green"}]
