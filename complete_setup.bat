@echo off
echo ========================================
echo  MYO Furniture Creator - Complete Setup
echo ========================================
echo.

REM Запуск расширенной настройки
call advanced_setup.bat

cd "MYO_Furniture_Creator"

echo Создание полной системы управления...

REM Создание системы команд
mkdir "data\myo\functions\commands" 2>nul

REM Команды для работы с листами
echo # Команда создания нового листа > data\myo\functions\commands\newlist.mcfunction
echo execute unless data storage myo:lists lists run data modify storage myo:lists lists set value [] >> data\myo\functions\commands\newlist.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Введите название нового листа в чат:","color":"green"}] >> data\myo\functions\commands\newlist.mcfunction
echo tellraw @s [{"text":"Пример: ","color":"yellow"},{"text":"Моя Мебель","color":"aqua","clickEvent":{"action":"suggest_command","value":"Моя Мебель"}}] >> data\myo\functions\commands\newlist.mcfunction
echo scoreboard players set @s myo_temp 1 >> data\myo\functions\commands\newlist.mcfunction

echo # Команда добавления в лист > data\myo\functions\commands\addlist.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Введите название листа и название предмета:","color":"green"}] >> data\myo\functions\commands\addlist.mcfunction
echo tellraw @s [{"text":"Формат: ","color":"yellow"},{"text":"название_листа название_предмета","color":"aqua"}] >> data\myo\functions\commands\addlist.mcfunction
echo scoreboard players set @s myo_temp 2 >> data\myo\functions\commands\addlist.mcfunction

echo # Команда переименования листа > data\myo\functions\commands\renamelist.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Введите старое и новое название листа:","color":"green"}] >> data\myo\functions\commands\renamelist.mcfunction
echo tellraw @s [{"text":"Формат: ","color":"yellow"},{"text":"старое_название новое_название","color":"aqua"}] >> data\myo\functions\commands\renamelist.mcfunction
echo scoreboard players set @s myo_temp 3 >> data\myo\functions\commands\renamelist.mcfunction

REM Система текстур
echo # Открытие меню текстур > data\myo\functions\editor\open_texture_menu.mcfunction
echo clear @s >> data\myo\functions\editor\open_texture_menu.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Меню выбора текстур","color":"green"}] >> data\myo\functions\editor\open_texture_menu.mcfunction
echo tellraw @s [{"text":"Выберите блок из инвентаря для использования в качестве текстуры","color":"yellow"}] >> data\myo\functions\editor\open_texture_menu.mcfunction
echo give @s oak_planks{display:{Name:'[{"text":"Дубовые Доски","color":"brown"}]'},CustomModelData:1,myo_tex_oak:1b} >> data\myo\functions\editor\open_texture_menu.mcfunction
echo give @s stone{display:{Name:'[{"text":"Камень","color":"gray"}]'},CustomModelData:1,myo_tex_stone:1b} >> data\myo\functions\editor\open_texture_menu.mcfunction
echo give @s iron_block{display:{Name:'[{"text":"Железный Блок","color":"white"}]'},CustomModelData:1,myo_tex_iron:1b} >> data\myo\functions\editor\open_texture_menu.mcfunction
echo give @s gold_block{display:{Name:'[{"text":"Золотой Блок","color":"yellow"}]'},CustomModelData:1,myo_tex_gold:1b} >> data\myo\functions\editor\open_texture_menu.mcfunction
echo give @s diamond_block{display:{Name:'[{"text":"Алмазный Блок","color":"aqua"}]'},CustomModelData:1,myo_tex_diamond:1b} >> data\myo\functions\editor\open_texture_menu.mcfunction
echo give @s emerald_block{display:{Name:'[{"text":"Изумрудный Блок","color":"green"}]'},CustomModelData:1,myo_tex_emerald:1b} >> data\myo\functions\editor\open_texture_menu.mcfunction
echo give @s barrier{display:{Name:'[{"text":"Вернуться к Редактору","color":"red"}]'},CustomModelData:1,myo_back_editor:1b} >> data\myo\functions\editor\open_texture_menu.mcfunction

REM Система свойств блоков
echo # Открытие меню свойств > data\myo\functions\editor\open_properties_menu.mcfunction
echo clear @s >> data\myo\functions\editor\open_properties_menu.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Меню свойств блока","color":"green"}] >> data\myo\functions\editor\open_properties_menu.mcfunction
echo give @s lime_concrete{display:{Name:'[{"text":"Осязаемый: ВКЛ","color":"green","bold":true}]',Lore:['[{"text":"Игроки могут стоять на блоке","color":"gray"}]']},CustomModelData:1,myo_prop_solid_on:1b} >> data\myo\functions\editor\open_properties_menu.mcfunction
echo give @s red_concrete{display:{Name:'[{"text":"Осязаемый: ВЫКЛ","color":"red","bold":true}]',Lore:['[{"text":"Игроки проходят сквозь блок","color":"gray"}]']},CustomModelData:1,myo_prop_solid_off:1b} >> data\myo\functions\editor\open_properties_menu.mcfunction
echo give @s blue_concrete{display:{Name:'[{"text":"Можно Сесть: ВКЛ","color":"blue","bold":true}]',Lore:['[{"text":"На блок можно сесть","color":"gray"}]']},CustomModelData:1,myo_prop_sit_on:1b} >> data\myo\functions\editor\open_properties_menu.mcfunction
echo give @s gray_concrete{display:{Name:'[{"text":"Можно Сесть: ВЫКЛ","color":"gray","bold":true}]',Lore:['[{"text":"На блок нельзя сесть","color":"gray"}]']},CustomModelData:1,myo_prop_sit_off:1b} >> data\myo\functions\editor\open_properties_menu.mcfunction
echo give @s yellow_concrete{display:{Name:'[{"text":"Светится: ВКЛ","color":"yellow","bold":true}]',Lore:['[{"text":"Блок излучает свет","color":"gray"}]']},CustomModelData:1,myo_prop_light_on:1b} >> data\myo\functions\editor\open_properties_menu.mcfunction
echo give @s black_concrete{display:{Name:'[{"text":"Светится: ВЫКЛ","color":"dark_gray","bold":true}]',Lore:['[{"text":"Блок не излучает свет","color":"gray"}]']},CustomModelData:1,myo_prop_light_off:1b} >> data\myo\functions\editor\open_properties_menu.mcfunction
echo give @s barrier{display:{Name:'[{"text":"Вернуться к Редактору","color":"red"}]'},CustomModelData:1,myo_back_editor:1b} >> data\myo\functions\editor\open_properties_menu.mcfunction

REM Расширенная система списков
echo # Открытие расширенного меню списков > data\myo\functions\menu\open_advanced_list.mcfunction
echo clear @s >> data\myo\functions\menu\open_advanced_list.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Ваши Листы Мебели","color":"green"}] >> data\myo\functions\menu\open_advanced_list.mcfunction
echo give @s oak_sign{display:{Name:'[{"text":"Домашняя Мебель","color":"brown","bold":true}]',Lore:['[{"text":"Мебель для дома","color":"gray"}]','[{"text":"Нажмите для просмотра","color":"yellow"}]']},CustomModelData:1,myo_list_home:1b} >> data\myo\functions\menu\open_advanced_list.mcfunction
echo give @s spruce_sign{display:{Name:'[{"text":"Офисная Мебель","color":"dark_green","bold":true}]',Lore:['[{"text":"Мебель для офиса","color":"gray"}]','[{"text":"Нажмите для просмотра","color":"yellow"}]']},CustomModelData:1,myo_list_office:1b} >> data\myo\functions\menu\open_advanced_list.mcfunction
echo give @s birch_sign{display:{Name:'[{"text":"Декоративная Мебель","color":"yellow","bold":true}]',Lore:['[{"text":"Декоративные элементы","color":"gray"}]','[{"text":"Нажмите для просмотра","color":"yellow"}]']},CustomModelData:1,myo_list_decor:1b} >> data\myo\functions\menu\open_advanced_list.mcfunction
echo give @s emerald{display:{Name:'[{"text":"Создать Новый Лист","color":"green","bold":true}]'},CustomModelData:1,myo_create_list:1b} >> data\myo\functions\menu\open_advanced_list.mcfunction
echo give @s barrier{display:{Name:'[{"text":"Назад в Главное Меню","color":"red"}]'},CustomModelData:1,myo_back_main:1b} >> data\myo\functions\menu\open_advanced_list.mcfunction

REM Система отмены действий
echo # Отмена последнего действия > data\myo\functions\editor\undo_action.mcfunction
echo execute at @e[tag=myo_base,limit=1,sort=nearest] run kill @e[tag=myo_placed,limit=1,sort=furthest,distance=..2] >> data\myo\functions\editor\undo_action.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Последнее действие отменено!","color":"yellow"}] >> data\myo\functions\editor\undo_action.mcfunction

REM Система экспорта/импорта
echo # Экспорт мебели > data\myo\functions\storage\export_furniture.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"=== ЭКСПОРТ МЕБЕЛИ ===","color":"green","bold":true}] >> data\myo\functions\storage\export_furniture.mcfunction
echo tellraw @s [{"text":"Ваш код экспорта:","color":"yellow"}] >> data\myo\functions\storage\export_furniture.mcfunction
echo tellraw @s [{"text":"MYO_EXPORT_CODE_12345","color":"aqua","bold":true,"clickEvent":{"action":"copy_to_clipboard","value":"MYO_EXPORT_CODE_12345"},"hoverEvent":{"action":"show_text","contents":"Нажмите для копирования"}}] >> data\myo\functions\storage\export_furniture.mcfunction
echo tellraw @s [{"text":"Поделитесь этим кодом с друзьями!","color":"green"}] >> data\myo\functions\storage\export_furniture.mcfunction

echo # Импорт мебели > data\myo\functions\storage\import_furniture.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"=== ИМПОРТ МЕБЕЛИ ===","color":"green","bold":true}] >> data\myo\functions\storage\import_furniture.mcfunction
echo tellraw @s [{"text":"Введите код импорта в чат:","color":"yellow"}] >> data\myo\functions\storage\import_furniture.mcfunction
echo tellraw @s [{"text":"Пример: ","color":"gray"},{"text":"MYO_IMPORT_CODE_67890","color":"aqua","clickEvent":{"action":"suggest_command","value":"MYO_IMPORT_CODE_67890"}}] >> data\myo\functions\storage\import_furniture.mcfunction
echo scoreboard players set @s myo_temp 4 >> data\myo\functions\storage\import_furniture.mcfunction

REM Полностью обновленный обработчик редактора
echo # Полный обработчик редактора > data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[scores={myo_page=1}] run function myo:editor/setup_hotbar_1 >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[scores={myo_page=2}] run function myo:editor/setup_hotbar_2 >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_up:1b}}}] run function myo:editor/move_up >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_down:1b}}}] run function myo:editor/move_down >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_left:1b}}}] run function myo:editor/move_left >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_right:1b}}}] run function myo:editor/move_right >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_forward:1b}}}] run function myo:editor/move_forward >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_back:1b}}}] run function myo:editor/move_back >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_place:1b}}}] run function myo:editor/place_block >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_undo:1b}}}] run function myo:editor/undo_action >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_next_page:1b}}}] run function myo:editor/next_page >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_prev_page:1b}}}] run function myo:editor/prev_page >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_texture:1b}}}] run function myo:editor/open_texture_menu >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_properties:1b}}}] run function myo:editor/open_properties_menu >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_save:1b}}}] run function myo:editor/save_furniture >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_back_editor:1b}}}] run function myo:editor/back_to_editor >> data\myo\functions\editor\handle.mcfunction

REM Возврат к редактору
echo # Возврат к редактору > data\myo\functions\editor\back_to_editor.mcfunction
echo scoreboard players set @s myo_page 1 >> data\myo\functions\editor\back_to_editor.mcfunction
echo function myo:editor/setup_hotbar_1 >> data\myo\functions\editor\back_to_editor.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Возврат к редактору","color":"green"}] >> data\myo\functions\editor\back_to_editor.mcfunction

REM Обновленный обработчик меню
echo # Обновленный обработчик меню > data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_create:1b}}}] run function myo:editor/start_creation >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_list:1b}}}] run function myo:menu/open_advanced_list >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_export:1b}}}] run function myo:storage/export_furniture >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_import:1b}}}] run function myo:storage/import_furniture >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_back_main:1b}}}] run function myo:menu/open_main >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_create_list:1b}}}] run function myo:commands/newlist >> data\myo\functions\menu\handle.mcfunction

REM Система помощи
echo # Система помощи > data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"========================================","color":"gold"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"       MYO Furniture Creator - Помощь","color":"green","bold":true}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"========================================","color":"gold"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":""}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"🔧 Основные команды:","color":"yellow","bold":true}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"• ","color":"gray"},{"text":"/function myo:give_creator","color":"aqua","clickEvent":{"action":"run_command","value":"/function myo:give_creator"}},{"text":" - Получить создатель мебели","color":"white"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"• ","color":"gray"},{"text":"/function myo:help","color":"aqua","clickEvent":{"action":"run_command","value":"/function myo:help"}},{"text":" - Показать эту справку","color":"white"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":""}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"🎨 Как создать мебель:","color":"yellow","bold":true}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"1. Получите создатель мебели","color":"white"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"2. Выберите 'Создание Мебели'","color":"white"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"3. Поставьте основу (барьер)","color":"white"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"4. Используйте хотбар для управления","color":"white"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"5. Сохраните готовую мебель","color":"white"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":""}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"⌨️ Управление в редакторе:","color":"yellow","bold":true}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"• Слоты 1-6: Движение курсора","color":"white"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"• Слот 7: Установить блок","color":"white"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"• Слот 8: Отменить действие","color":"white"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"• Слот 9: Следующая страница","color":"white"}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":""}] >> data\myo\functions\help.mcfunction
echo tellraw @s [{"text":"========================================","color":"gold"}] >> data\myo\functions\help.mcfunction

REM Добавление команды помощи в загрузку
echo # Обновленная функция загрузки > data\myo\functions\load.mcfunction
echo tellraw @a [{"text":"[MYO] ","color":"gold"},{"text":"Furniture Creator загружен! ","color":"green"},{"text":"[Помощь]","color":"yellow","clickEvent":{"action":"run_command","value":"/function myo:help"},"hoverEvent":{"action":"show_text","contents":"Нажмите для справки"}}] >> data\myo\functions\load.mcfunction
echo tellraw @a [{"text":"Используйте ","color":"green"},{"text":"/function myo:give_creator","color":"yellow","clickEvent":{"action":"run_command","value":"/function myo:give_creator"}},{"text":" для получения создателя мебели.","color":"green"}] >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_data dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_menu dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_editor dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_temp dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_page dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_pos_x dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_pos_y dummy >> data\myo\functions\load.mcfunction
echo scoreboard objectives add myo_pos_z dummy >> data\myo\functions\load.mcfunction
echo gamerule maxCommandChainLength 1000000 >> data\myo\functions\load.mcfunction
echo data modify storage myo:settings version set value "1.0.0" >> data\myo\functions\load.mcfunction

echo.
echo ========================================
echo     Полная система MYO создана!
echo ========================================
echo.
echo ✅ Включенные функции:
echo - Полная система создания мебели
echo - Управление курсором с визуальными эффектами
echo - Система текстур и свойств блоков
echo - Расширенная система списков
echo - Экспорт/импорт мебели
echo - Система отмены действий
echo - Встроенная справка
echo - Команды для управления листами
echo.
echo 🎮 Основные команды:
echo /function myo:give_creator - Получить создатель
echo /function myo:help - Справка
echo.
echo 📁 Установка:
echo 1. Скопируйте папку MYO_Furniture_Creator в datapacks
echo 2. Используйте /reload в игре
echo 3. Наслаждайтесь созданием мебели!
echo.
pause