@echo off
echo ========================================
echo    MYO Furniture Creator Datapack Setup
echo ========================================
echo.

REM Создание основной структуры датапака
mkdir "MYO_Furniture_Creator" 2>nul
cd "MYO_Furniture_Creator"

REM Создание основных папок
mkdir "data" 2>nul
mkdir "data\myo" 2>nul
mkdir "data\myo\functions" 2>nul
mkdir "data\myo\functions\core" 2>nul
mkdir "data\myo\functions\menu" 2>nul
mkdir "data\myo\functions\editor" 2>nul
mkdir "data\myo\functions\storage" 2>nul
mkdir "data\myo\functions\utils" 2>nul
mkdir "data\myo\advancements" 2>nul
mkdir "data\myo\recipes" 2>nul
mkdir "data\myo\loot_tables" 2>nul
mkdir "data\minecraft\tags" 2>nul
mkdir "data\minecraft\tags\functions" 2>nul

echo Создание pack.mcmeta...
echo { > pack.mcmeta
echo   "pack": { >> pack.mcmeta
echo     "pack_format": 15, >> pack.mcmeta
echo     "description": "MYO Furniture Creator - Create your own custom furniture!" >> pack.mcmeta
echo   } >> pack.mcmeta
echo } >> pack.mcmeta

echo Создание основных функций...

REM Основная функция загрузки
echo # MYO Furniture Creator - Load Function > data\myo\functions\load.mcfunction
echo tellraw @a [{"text":"[MYO] ","color":"gold"},{"text":"Furniture Creator загружен! Используйте ","color":"green"},{"text":"/function myo:give_creator","color":"yellow","clickEvent":{"action":"run_command","value":"/function myo:give_creator"}},{"text":" для получения создателя мебели.","color":"green"}] >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_data dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_menu dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_editor dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_temp dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_page dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_pos_x dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_pos_y dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_pos_z dummy >> data\myo\functions\load.mcfunction
echo gamerule maxCommandChainLength 1000000 >> data\myo\functions\load.mcfunction

REM Функция выдачи создателя мебели
echo # Выдача создателя мебели > data\myo\functions\give_creator.mcfunction
echo give @s chest{display:{Name:'[{"text":"Создатель Мебели","color":"gold","bold":true}]',Lore:['[{"text":"Щелкните правой кнопкой для открытия","color":"gray"}]','[{"text":"меню создания мебели","color":"gray"}]']},CustomModelData:1,myo_creator:1b} >> data\myo\functions\give_creator.mcfunction

REM Основная функция тика
echo # Основной тик > data\myo\functions\tick.mcfunction
echo execute as @a[nbt={SelectedItem:{tag:{myo_creator:1b}}}] at @s run function myo:core/check_use >> data\myo\functions\tick.mcfunction
echo execute as @a[scores={myo_menu=1..}] at @s run function myo:menu/handle >> data\myo\functions\tick.mcfunction
echo execute as @a[scores={myo_editor=1..}] at @s run function myo:editor/handle >> data\myo\functions\tick.mcfunction

echo Создание функций меню...

REM Основное меню
echo # Открытие основного меню > data\myo\functions\menu\open_main.mcfunction
echo scoreboard players set @s myo_menu 1 >> data\myo\functions\menu\open_main.mcfunction
echo clear @s >> data\myo\functions\menu\open_main.mcfunction
echo item replace entity @s inventory.0 with paper{display:{Name:'[{"text":"Создание Мебели","color":"green","bold":true}]',Lore:['[{"text":"Нажмите для начала создания","color":"gray"}]']},CustomModelData:1,myo_create:1b} >> data\myo\functions\menu\open_main.mcfunction
echo item replace entity @s inventory.1 with book{display:{Name:'[{"text":"Мои Творения","color":"blue","bold":true}]',Lore:['[{"text":"Просмотр созданной мебели","color":"gray"}]']},CustomModelData:1,myo_list:1b} >> data\myo\functions\menu\open_main.mcfunction
echo item replace entity @s inventory.7 with emerald{display:{Name:'[{"text":"Экспорт","color":"aqua","bold":true}]',Lore:['[{"text":"Экспорт ваших творений","color":"gray"}]']},CustomModelData:1,myo_export:1b} >> data\myo\functions\menu\open_main.mcfunction
echo item replace entity @s inventory.8 with diamond{display:{Name:'[{"text":"Импорт","color":"light_purple","bold":true}]',Lore:['[{"text":"Импорт творений","color":"gray"}]']},CustomModelData:1,myo_import:1b} >> data\myo\functions\menu\open_main.mcfunction
echo title @s title [{"text":"MYO Furniture Creator","color":"gold"}] >> data\myo\functions\menu\open_main.mcfunction
echo title @s subtitle [{"text":"Выберите действие","color":"yellow"}] >> data\myo\functions\menu\open_main.mcfunction

echo Создание функций редактора...

REM Начало редактирования
echo # Начало создания мебели > data\myo\functions\editor\start_creation.mcfunction
echo scoreboard players set @s myo_editor 1 >> data\myo\functions\editor\start_creation.mcfunction
echo scoreboard players set @s myo_page 1 >> data\myo\functions\editor\start_creation.mcfunction
echo scoreboard players set @s myo_pos_x 8 >> data\myo\functions\editor\start_creation.mcfunction
echo scoreboard players set @s myo_pos_y 8 >> data\myo\functions\editor\start_creation.mcfunction
echo scoreboard players set @s myo_pos_z 8 >> data\myo\functions\editor\start_creation.mcfunction
echo clear @s >> data\myo\functions\editor\start_creation.mcfunction
echo give @s barrier{display:{Name:'[{"text":"Основа для Мебели","color":"red","bold":true}]',Lore:['[{"text":"Поставьте этот блок для начала","color":"gray"}]','[{"text":"редактирования мебели","color":"gray"}]']},CustomModelData:1,myo_base:1b} >> data\myo\functions\editor\start_creation.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Поставьте основу для начала создания мебели!","color":"green"}] >> data\myo\functions\editor\start_creation.mcfunction
echo scoreboard players set @s myo_menu 0 >> data\myo\functions\editor\start_creation.mcfunction

REM Настройка хотбара редактора (страница 1)
echo # Настройка хотбара редактора - страница 1 > data\myo\functions\editor\setup_hotbar_1.mcfunction
echo item replace entity @s hotbar.0 with arrow{display:{Name:'[{"text":"Вверх","color":"green"}]'},CustomModelData:1,myo_up:1b} >> data\myo\functions\editor\setup_hotbar_1.mcfunction
echo item replace entity @s hotbar.1 with arrow{display:{Name:'[{"text":"Вниз","color":"green"}]'},CustomModelData:2,myo_down:1b} >> data\myo\functions\editor\setup_hotbar_1.mcfunction
echo item replace entity @s hotbar.2 with arrow{display:{Name:'[{"text":"Влево","color":"green"}]'},CustomModelData:3,myo_left:1b} >> data\myo\functions\editor\setup_hotbar_1.mcfunction
echo item replace entity @s hotbar.3 with arrow{display:{Name:'[{"text":"Вправо","color":"green"}]'},CustomModelData:4,myo_right:1b} >> data\myo\functions\editor\setup_hotbar_1.mcfunction
echo item replace entity @s hotbar.4 with arrow{display:{Name:'[{"text":"Вперед","color":"green"}]'},CustomModelData:5,myo_forward:1b} >> data\myo\functions\editor\setup_hotbar_1.mcfunction
echo item replace entity @s hotbar.5 with arrow{display:{Name:'[{"text":"Назад","color":"green"}]'},CustomModelData:6,myo_back:1b} >> data\myo\functions\editor\setup_hotbar_1.mcfunction
echo item replace entity @s hotbar.6 with redstone_block{display:{Name:'[{"text":"Установить Блок","color":"red","bold":true}]'},CustomModelData:1,myo_place:1b} >> data\myo\functions\editor\setup_hotbar_1.mcfunction
echo item replace entity @s hotbar.7 with barrier{display:{Name:'[{"text":"Отменить","color":"yellow"}]'},CustomModelData:1,myo_undo:1b} >> data\myo\functions\editor\setup_hotbar_1.mcfunction
echo item replace entity @s hotbar.8 with paper{display:{Name:'[{"text":"Следующая Страница","color":"aqua"}]'},CustomModelData:1,myo_next_page:1b} >> data\myo\functions\editor\setup_hotbar_1.mcfunction

REM Настройка хотбара редактора (страница 2)
echo # Настройка хотбара редактора - страница 2 > data\myo\functions\editor\setup_hotbar_2.mcfunction
echo item replace entity @s hotbar.0 with book{display:{Name:'[{"text":"Первая Страница","color":"aqua"}]'},CustomModelData:1,myo_prev_page:1b} >> data\myo\functions\editor\setup_hotbar_2.mcfunction
echo item replace entity @s hotbar.1 with painting{display:{Name:'[{"text":"Установить Текстуру","color":"gold","bold":true}]'},CustomModelData:1,myo_texture:1b} >> data\myo\functions\editor\setup_hotbar_2.mcfunction
echo item replace entity @s hotbar.2 with writable_book{display:{Name:'[{"text":"Свойства Блока","color":"purple","bold":true}]'},CustomModelData:1,myo_properties:1b} >> data\myo\functions\editor\setup_hotbar_2.mcfunction
echo item replace entity @s hotbar.3 with emerald{display:{Name:'[{"text":"Сохранить Мебель","color":"green","bold":true}]'},CustomModelData:1,myo_save:1b} >> data\myo\functions\editor\setup_hotbar_2.mcfunction
echo item replace entity @s hotbar.4 with air >> data\myo\functions\editor\setup_hotbar_2.mcfunction
echo item replace entity @s hotbar.5 with air >> data\myo\functions\editor\setup_hotbar_2.mcfunction
echo item replace entity @s hotbar.6 with air >> data\myo\functions\editor\setup_hotbar_2.mcfunction
echo item replace entity @s hotbar.7 with air >> data\myo\functions\editor\setup_hotbar_2.mcfunction
echo item replace entity @s hotbar.8 with air >> data\myo\functions\editor\setup_hotbar_2.mcfunction

echo Создание вспомогательных функций...

REM Функция проверки использования
echo # Проверка использования создателя > data\myo\functions\core\check_use.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_creator:1b}}}] run function myo:menu/open_main >> data\myo\functions\core\check_use.mcfunction

REM Обработчик меню
echo # Обработчик меню > data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_create:1b}}}] run function myo:editor/start_creation >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_list:1b}}}] run function myo:menu/open_list >> data\myo\functions\menu\handle.mcfunction

REM Обработчик редактора
echo # Обработчик редактора > data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[scores={myo_page=1}] run function myo:editor/setup_hotbar_1 >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[scores={myo_page=2}] run function myo:editor/setup_hotbar_2 >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_next_page:1b}}}] run function myo:editor/next_page >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_prev_page:1b}}}] run function myo:editor/prev_page >> data\myo\functions\editor\handle.mcfunction

REM Переключение страниц
echo # Следующая страница > data\myo\functions\editor\next_page.mcfunction
echo scoreboard players set @s myo_page 2 >> data\myo\functions\editor\next_page.mcfunction

echo # Предыдущая страница > data\myo\functions\editor\prev_page.mcfunction
echo scoreboard players set @s myo_page 1 >> data\myo\functions\editor\prev_page.mcfunction

REM Открытие списка творений
echo # Открытие списка творений > data\myo\functions\menu\open_list.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Функция списка творений в разработке!","color":"yellow"}] >> data\myo\functions\menu\open_list.mcfunction

echo Создание тегов функций...

REM Тег загрузки
echo { > data\minecraft\tags\functions\load.json
echo   "values": [ >> data\minecraft\tags\functions\load.json
echo     "myo:load" >> data\minecraft\tags\functions\load.json
echo   ] >> data\minecraft\tags\functions\load.json
echo } >> data\minecraft\tags\functions\load.json

REM Тег тика
echo { > data\minecraft\tags\functions\tick.json
echo   "values": [ >> data\minecraft\tags\functions\tick.json
echo     "myo:tick" >> data\minecraft\tags\functions\tick.json
echo   ] >> data\minecraft\tags\functions\tick.json
echo } >> data\minecraft\tags\functions\tick.json

echo.
echo ========================================
echo    Датапак успешно создан!
echo ========================================
echo.
echo Инструкции по установке:
echo 1. Скопируйте папку "MYO_Furniture_Creator" в папку datapacks вашего мира
echo 2. Перезагрузите мир или используйте /reload
echo 3. Используйте /function myo:give_creator для получения создателя мебели
echo.
echo Удачного создания мебели!
echo.
pause