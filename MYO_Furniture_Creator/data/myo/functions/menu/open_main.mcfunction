# Открытие основного меню с примерами
scoreboard players set @s myo_menu 1
clear @s
item replace entity @s inventory.0 with paper{display:{Name:'[{"text":"Создание Мебели","color":"green","bold":true}]',Lore:['[{"text":"Нажмите для начала создания","color":"gray"}]']},CustomModelData:1,myo_create:1b}
item replace entity @s inventory.1 with book{display:{Name:'[{"text":"Мои Творения","color":"blue","bold":true}]',Lore:['[{"text":"Просмотр созданной мебели","color":"gray"}]']},CustomModelData:1,myo_list:1b}
item replace entity @s inventory.2 with knowledge_book{display:{Name:'[{"text":"Примеры и Шаблоны","color":"purple","bold":true}]',Lore:['[{"text":"Готовые примеры мебели","color":"gray"}]']},CustomModelData:1,myo_examples:1b}
item replace entity @s inventory.7 with emerald{display:{Name:'[{"text":"Экспорт","color":"aqua","bold":true}]',Lore:['[{"text":"Экспорт ваших творений","color":"gray"}]']},CustomModelData:1,myo_export:1b}
item replace entity @s inventory.8 with diamond{display:{Name:'[{"text":"Импорт","color":"light_purple","bold":true}]',Lore:['[{"text":"Импорт творений","color":"gray"}]']},CustomModelData:1,myo_import:1b}
title @s title [{"text":"MYO Furniture Creator","color":"gold"}]
title @s subtitle [{"text":"Выберите действие","color":"yellow"}]
