@echo off
echo ========================================
echo  MYO Furniture Creator - Advanced Setup
echo ========================================
echo.

REM Запуск базовой настройки
call setup_datapack.bat

cd "MYO_Furniture_Creator"

echo Создание расширенных функций...

REM Функции управления позицией курсора
echo # Движение курсора вверх > data\myo\functions\editor\move_up.mcfunction
echo scoreboard players add @s myo_pos_y 1 >> data\myo\functions\editor\move_up.mcfunction
echo execute if score @s myo_pos_y matches 17.. run scoreboard players set @s myo_pos_y 16 >> data\myo\functions\editor\move_up.mcfunction
echo function myo:editor/update_cursor >> data\myo\functions\editor\move_up.mcfunction

echo # Движение курсора вниз > data\myo\functions\editor\move_down.mcfunction
echo scoreboard players remove @s myo_pos_y 1 >> data\myo\functions\editor\move_down.mcfunction
echo execute if score @s myo_pos_y matches ..-1 run scoreboard players set @s myo_pos_y 0 >> data\myo\functions\editor\move_down.mcfunction
echo function myo:editor/update_cursor >> data\myo\functions\editor\move_down.mcfunction

echo # Движение курсора влево > data\myo\functions\editor\move_left.mcfunction
echo scoreboard players remove @s myo_pos_x 1 >> data\myo\functions\editor\move_left.mcfunction
echo execute if score @s myo_pos_x matches ..-1 run scoreboard players set @s myo_pos_x 0 >> data\myo\functions\editor\move_left.mcfunction
echo function myo:editor/update_cursor >> data\myo\functions\editor\move_left.mcfunction

echo # Движение курсора вправо > data\myo\functions\editor\move_right.mcfunction
echo scoreboard players add @s myo_pos_x 1 >> data\myo\functions\editor\move_right.mcfunction
echo execute if score @s myo_pos_x matches 17.. run scoreboard players set @s myo_pos_x 16 >> data\myo\functions\editor\move_right.mcfunction
echo function myo:editor/update_cursor >> data\myo\functions\editor\move_right.mcfunction

echo # Движение курсора вперед > data\myo\functions\editor\move_forward.mcfunction
echo scoreboard players add @s myo_pos_z 1 >> data\myo\functions\editor\move_forward.mcfunction
echo execute if score @s myo_pos_z matches 17.. run scoreboard players set @s myo_pos_z 16 >> data\myo\functions\editor\move_forward.mcfunction
echo function myo:editor/update_cursor >> data\myo\functions\editor\move_forward.mcfunction

echo # Движение курсора назад > data\myo\functions\editor\move_back.mcfunction
echo scoreboard players remove @s myo_pos_z 1 >> data\myo\functions\editor\move_back.mcfunction
echo execute if score @s myo_pos_z matches ..-1 run scoreboard players set @s myo_pos_z 0 >> data\myo\functions\editor\move_back.mcfunction
echo function myo:editor/update_cursor >> data\myo\functions\editor\move_back.mcfunction

REM Обновление курсора
echo # Обновление позиции курсора > data\myo\functions\editor\update_cursor.mcfunction
echo execute at @e[tag=myo_base,limit=1,sort=nearest] run kill @e[tag=myo_cursor,distance=..2] >> data\myo\functions\editor\update_cursor.mcfunction
echo execute at @e[tag=myo_base,limit=1,sort=nearest] run summon armor_stand ~ ~ ~ {Tags:["myo_cursor"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Курсор","color":"red"}]'} >> data\myo\functions\editor\update_cursor.mcfunction
echo execute as @e[tag=myo_cursor,limit=1,sort=nearest] at @s run function myo:editor/position_cursor >> data\myo\functions\editor\update_cursor.mcfunction

REM Позиционирование курсора
echo # Позиционирование курсора > data\myo\functions\editor\position_cursor.mcfunction
echo execute store result entity @s Pos[0] double 0.0625 run scoreboard players get @p myo_pos_x >> data\myo\functions\editor\position_cursor.mcfunction
echo execute store result entity @s Pos[1] double 0.0625 run scoreboard players get @p myo_pos_y >> data\myo\functions\editor\position_cursor.mcfunction
echo execute store result entity @s Pos[2] double 0.0625 run scoreboard players get @p myo_pos_z >> data\myo\functions\editor\position_cursor.mcfunction
echo execute at @s run particle redstone 1 0 0 1 ~ ~0.5 ~ 0.1 0.1 0.1 0 5 force @p >> data\myo\functions\editor\position_cursor.mcfunction

REM Установка блока
echo # Установка блока > data\myo\functions\editor\place_block.mcfunction
echo execute at @e[tag=myo_base,limit=1,sort=nearest] run summon armor_stand ~ ~ ~ {Tags:["myo_placed"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Блок","color":"blue"}]'} >> data\myo\functions\editor\place_block.mcfunction
echo execute as @e[tag=myo_placed,limit=1,sort=nearest] at @s run function myo:editor/position_placed >> data\myo\functions\editor\place_block.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Блок установлен!","color":"green"}] >> data\myo\functions\editor\place_block.mcfunction

REM Позиционирование установленного блока
echo # Позиционирование установленного блока > data\myo\functions\editor\position_placed.mcfunction
echo execute store result entity @s Pos[0] double 0.0625 run scoreboard players get @p myo_pos_x >> data\myo\functions\editor\position_placed.mcfunction
echo execute store result entity @s Pos[1] double 0.0625 run scoreboard players get @p myo_pos_y >> data\myo\functions\editor\position_placed.mcfunction
echo execute store result entity @s Pos[2] double 0.0625 run scoreboard players get @p myo_pos_z >> data\myo\functions\editor\position_placed.mcfunction
echo execute at @s run particle dust 0 0 1 1 ~ ~0.5 ~ 0.1 0.1 0.1 0 5 force @p >> data\myo\functions\editor\position_placed.mcfunction

REM Обновленный обработчик редактора с движениями
echo # Обновленный обработчик редактора > data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[scores={myo_page=1}] run function myo:editor/setup_hotbar_1 >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[scores={myo_page=2}] run function myo:editor/setup_hotbar_2 >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_up:1b}}}] run function myo:editor/move_up >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_down:1b}}}] run function myo:editor/move_down >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_left:1b}}}] run function myo:editor/move_left >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_right:1b}}}] run function myo:editor/move_right >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_forward:1b}}}] run function myo:editor/move_forward >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_back:1b}}}] run function myo:editor/move_back >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_place:1b}}}] run function myo:editor/place_block >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_next_page:1b}}}] run function myo:editor/next_page >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_prev_page:1b}}}] run function myo:editor/prev_page >> data\myo\functions\editor\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_save:1b}}}] run function myo:editor/save_furniture >> data\myo\functions\editor\handle.mcfunction

REM Система сохранения мебели
echo # Сохранение мебели > data\myo\functions\editor\save_furniture.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Для сохранения мебели используйте команды:","color":"green"}] >> data\myo\functions\editor\save_furniture.mcfunction
echo tellraw @s [{"text":"Создать новый лист: ","color":"yellow"},{"text":"/myo newlist \"название_листа\"","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function myo:storage/new_list"}}] >> data\myo\functions\editor\save_furniture.mcfunction
echo tellraw @s [{"text":"Добавить в существующий: ","color":"yellow"},{"text":"/myo addlist \"лист\" \"название\"","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function myo:storage/add_to_list"}}] >> data\myo\functions\editor\save_furniture.mcfunction

REM Система хранения
mkdir "data\myo\functions\storage" 2>nul

echo # Создание нового листа > data\myo\functions\storage\new_list.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Новый лист создан! (Функция в разработке)","color":"green"}] >> data\myo\functions\storage\new_list.mcfunction

echo # Добавление в лист > data\myo\functions\storage\add_to_list.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Мебель добавлена в лист! (Функция в разработке)","color":"green"}] >> data\myo\functions\storage\add_to_list.mcfunction

REM Обновленная функция начала создания с инициализацией курсора
echo # Обновленное начало создания мебели > data\myo\functions\editor\start_creation.mcfunction
echo scoreboard players set @s myo_editor 1 >> data\myo\functions\editor\start_creation.mcfunction
echo scoreboard players set @s myo_page 1 >> data\myo\functions\editor\start_creation.mcfunction
echo scoreboard players set @s myo_pos_x 8 >> data\myo\functions\editor\start_creation.mcfunction
echo scoreboard players set @s myo_pos_y 8 >> data\myo\functions\editor\start_creation.mcfunction
echo scoreboard players set @s myo_pos_z 8 >> data\myo\functions\editor\start_creation.mcfunction
echo clear @s >> data\myo\functions\editor\start_creation.mcfunction
echo give @s barrier{display:{Name:'[{"text":"Основа для Мебели","color":"red","bold":true}]',Lore:['[{"text":"Поставьте этот блок для начала","color":"gray"}]','[{"text":"редактирования мебели","color":"gray"}]']},CustomModelData:1,myo_base:1b,CanPlaceOn:["#minecraft:all"]} >> data\myo\functions\editor\start_creation.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Поставьте основу для начала создания мебели!","color":"green"}] >> data\myo\functions\editor\start_creation.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"После установки основы используйте хотбар для управления курсором","color":"yellow"}] >> data\myo\functions\editor\start_creation.mcfunction
echo scoreboard players set @s myo_menu 0 >> data\myo\functions\editor\start_creation.mcfunction

REM Обнаружение установки основы
echo # Обнаружение установки основы > data\myo\functions\editor\detect_base.mcfunction
echo execute as @e[type=item,nbt={Item:{tag:{myo_base:1b}}}] at @s if block ~ ~ ~ barrier run tag @s add myo_base_placed >> data\myo\functions\editor\detect_base.mcfunction
echo execute as @e[tag=myo_base_placed] at @s run summon armor_stand ~ ~ ~ {Tags:["myo_base"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Основа Мебели","color":"gold"}]'} >> data\myo\functions\editor\detect_base.mcfunction
echo execute as @e[tag=myo_base_placed] run kill @s >> data\myo\functions\editor\detect_base.mcfunction

REM Добавление обнаружения основы в тик
echo # Обновленный основной тик > data\myo\functions\tick.mcfunction
echo execute as @a[nbt={SelectedItem:{tag:{myo_creator:1b}}}] at @s run function myo:core/check_use >> data\myo\functions\tick.mcfunction
echo execute as @a[scores={myo_menu=1..}] at @s run function myo:menu/handle >> data\myo\functions\tick.mcfunction
echo execute as @a[scores={myo_editor=1..}] at @s run function myo:editor/handle >> data\myo\functions\tick.mcfunction
echo function myo:editor/detect_base >> data\myo\functions\tick.mcfunction
echo execute as @e[tag=myo_base] at @s run particle end_rod ~ ~1 ~ 0.2 0.2 0.2 0 1 force @a[distance=..10] >> data\myo\functions\tick.mcfunction

echo.
echo ========================================
echo   Расширенный датапак создан!
echo ========================================
echo.
echo Новые возможности:
echo - Полноценная система управления курсором
echo - Визуальные эффекты для курсора и блоков
echo - Система сохранения (базовая структура)
echo - Обнаружение установки основы
echo - Улучшенный интерфейс
echo.
echo Инструкции остаются теми же:
echo 1. Скопируйте папку в datapacks
echo 2. Используйте /reload
echo 3. /function myo:give_creator
echo.
pause