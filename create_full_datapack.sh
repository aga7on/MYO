#!/bin/bash

echo "Создание полного датапака MYO Furniture Creator..."

# Создание основной структуры
mkdir -p "MYO_Furniture_Creator_FULL/data/myo/functions/core"
mkdir -p "MYO_Furniture_Creator_FULL/data/myo/functions/menu"
mkdir -p "MYO_Furniture_Creator_FULL/data/myo/functions/editor"
mkdir -p "MYO_Furniture_Creator_FULL/data/myo/functions/storage"
mkdir -p "MYO_Furniture_Creator_FULL/data/myo/functions/commands"
mkdir -p "MYO_Furniture_Creator_FULL/data/myo/functions/examples"
mkdir -p "MYO_Furniture_Creator_FULL/data/myo/functions/utils"
mkdir -p "MYO_Furniture_Creator_FULL/data/minecraft/tags/functions"

cd "MYO_Furniture_Creator_FULL"

# pack.mcmeta
cat > pack.mcmeta << 'EOF'
{
  "pack": {
    "pack_format": 15,
    "description": "MYO Furniture Creator - Create your own custom furniture!"
  }
}
EOF

# Основные функции
cat > data/myo/functions/load.mcfunction << 'EOF'
# MYO Furniture Creator - Load Function
tellraw @a [{"text":"[MYO] ","color":"gold"},{"text":"Furniture Creator загружен! ","color":"green"},{"text":"[Помощь]","color":"yellow","clickEvent":{"action":"run_command","value":"/function myo:help"},"hoverEvent":{"action":"show_text","contents":"Нажмите для справки"}}]
tellraw @a [{"text":"Используйте ","color":"green"},{"text":"/function myo:give_creator","color":"yellow","clickEvent":{"action":"run_command","value":"/function myo:give_creator"}},{"text":" для получения создателя мебели.","color":"green"}]
scoreboard objectives add myo_data dummy
scoreboard objectives add myo_menu dummy
scoreboard objectives add myo_editor dummy
scoreboard objectives add myo_temp dummy
scoreboard objectives add myo_page dummy
scoreboard objectives add myo_pos_x dummy
scoreboard objectives add myo_pos_y dummy
scoreboard objectives add myo_pos_z dummy
gamerule maxCommandChainLength 1000000
data modify storage myo:settings version set value "1.0.0"
EOF

cat > data/myo/functions/tick.mcfunction << 'EOF'
# Основной тик
execute as @a[nbt={SelectedItem:{tag:{myo_creator:1b}}}] at @s run function myo:core/check_use
execute as @a[scores={myo_menu=1..}] at @s run function myo:menu/handle
execute as @a[scores={myo_editor=1..}] at @s run function myo:editor/handle
function myo:editor/detect_base
execute as @e[tag=myo_base] at @s run particle end_rod ~ ~1 ~ 0.2 0.2 0.2 0 1 force @a[distance=..10]
EOF

cat > data/myo/functions/give_creator.mcfunction << 'EOF'
# Выдача создателя мебели
give @s chest{display:{Name:'[{"text":"Создатель Мебели","color":"gold","bold":true}]',Lore:['[{"text":"Щелкните правой кнопкой для открытия","color":"gray"}]','[{"text":"меню создания мебели","color":"gray"}]']},CustomModelData:1,myo_creator:1b}
EOF

cat > data/myo/functions/help.mcfunction << 'EOF'
# Система помощи
tellraw @s [{"text":"========================================","color":"gold"}]
tellraw @s [{"text":"       MYO Furniture Creator - Помощь","color":"green","bold":true}]
tellraw @s [{"text":"========================================","color":"gold"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"🔧 Основные команды:","color":"yellow","bold":true}]
tellraw @s [{"text":"• ","color":"gray"},{"text":"/function myo:give_creator","color":"aqua","clickEvent":{"action":"run_command","value":"/function myo:give_creator"}},{"text":" - Получить создатель мебели","color":"white"}]
tellraw @s [{"text":"• ","color":"gray"},{"text":"/function myo:help","color":"aqua","clickEvent":{"action":"run_command","value":"/function myo:help"}},{"text":" - Показать эту справку","color":"white"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"🎨 Как создать мебель:","color":"yellow","bold":true}]
tellraw @s [{"text":"1. Получите создатель мебели","color":"white"}]
tellraw @s [{"text":"2. Выберите 'Создание Мебели'","color":"white"}]
tellraw @s [{"text":"3. Поставьте основу (барьер)","color":"white"}]
tellraw @s [{"text":"4. Используйте хотбар для управления","color":"white"}]
tellraw @s [{"text":"5. Сохраните готовую мебель","color":"white"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"⌨️ Управление в редакторе:","color":"yellow","bold":true}]
tellraw @s [{"text":"• Слоты 1-6: Движение курсора","color":"white"}]
tellraw @s [{"text":"• Слот 7: Установить блок","color":"white"}]
tellraw @s [{"text":"• Слот 8: Отменить действие","color":"white"}]
tellraw @s [{"text":"• Слот 9: Следующая страница","color":"white"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"========================================","color":"gold"}]
EOF

# Core функции
cat > data/myo/functions/core/check_use.mcfunction << 'EOF'
# Проверка использования создателя
execute if entity @s[nbt={SelectedItem:{tag:{myo_creator:1b}}}] run function myo:menu/open_main
EOF

# Меню функции
cat > data/myo/functions/menu/open_main.mcfunction << 'EOF'
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
EOF

cat > data/myo/functions/menu/handle.mcfunction << 'EOF'
# Обновленный обработчик меню с примерами
execute if entity @s[nbt={SelectedItem:{tag:{myo_create:1b}}}] run function myo:editor/start_creation
execute if entity @s[nbt={SelectedItem:{tag:{myo_list:1b}}}] run function myo:menu/open_advanced_list
execute if entity @s[nbt={SelectedItem:{tag:{myo_export:1b}}}] run function myo:storage/export_furniture
execute if entity @s[nbt={SelectedItem:{tag:{myo_import:1b}}}] run function myo:storage/import_furniture
execute if entity @s[nbt={SelectedItem:{tag:{myo_examples:1b}}}] run function myo:examples/open_examples_menu
execute if entity @s[nbt={SelectedItem:{tag:{myo_back_main:1b}}}] run function myo:menu/open_main
execute if entity @s[nbt={SelectedItem:{tag:{myo_create_list:1b}}}] run function myo:commands/newlist
execute if entity @s[nbt={SelectedItem:{tag:{myo_example_chair:1b}}}] run function myo:examples/create_chair
execute if entity @s[nbt={SelectedItem:{tag:{myo_example_table:1b}}}] run function myo:examples/create_table
execute if entity @s[nbt={SelectedItem:{tag:{myo_template_armchair:1b}}}] run function myo:examples/template_armchair
execute if entity @s[nbt={SelectedItem:{tag:{myo_template_sofa:1b}}}] run function myo:examples/template_sofa
execute if entity @s[nbt={SelectedItem:{tag:{myo_template_wardrobe:1b}}}] run function myo:examples/template_wardrobe
execute if entity @s[nbt={SelectedItem:{tag:{myo_guide:1b}}}] run function myo:examples/show_guide
EOF

cat > data/myo/functions/menu/open_advanced_list.mcfunction << 'EOF'
# Открытие расширенного меню списков
clear @s
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Ваши Листы Мебели","color":"green"}]
give @s oak_sign{display:{Name:'[{"text":"Домашняя Мебель","color":"brown","bold":true}]',Lore:['[{"text":"Мебель для дома","color":"gray"}]','[{"text":"Нажмите для просмотра","color":"yellow"}]']},CustomModelData:1,myo_list_home:1b}
give @s spruce_sign{display:{Name:'[{"text":"Офисная Мебель","color":"dark_green","bold":true}]',Lore:['[{"text":"Мебель для офиса","color":"gray"}]','[{"text":"Нажмите для просмотра","color":"yellow"}]']},CustomModelData:1,myo_list_office:1b}
give @s birch_sign{display:{Name:'[{"text":"Декоративная Мебель","color":"yellow","bold":true}]',Lore:['[{"text":"Декоративные элементы","color":"gray"}]','[{"text":"Нажмите для просмотра","color":"yellow"}]']},CustomModelData:1,myo_list_decor:1b}
give @s emerald{display:{Name:'[{"text":"Создать Новый Лист","color":"green","bold":true}]'},CustomModelData:1,myo_create_list:1b}
give @s barrier{display:{Name:'[{"text":"Назад в Главное Меню","color":"red"}]'},CustomModelData:1,myo_back_main:1b}
EOF

# Редактор функции
cat > data/myo/functions/editor/start_creation.mcfunction << 'EOF'
# Обновленное начало создания мебели
scoreboard players set @s myo_editor 1
scoreboard players set @s myo_page 1
scoreboard players set @s myo_pos_x 8
scoreboard players set @s myo_pos_y 8
scoreboard players set @s myo_pos_z 8
clear @s
give @s barrier{display:{Name:'[{"text":"Основа для Мебели","color":"red","bold":true}]',Lore:['[{"text":"Поставьте этот блок для начала","color":"gray"}]','[{"text":"редактирования мебели","color":"gray"}]']},CustomModelData:1,myo_base:1b,CanPlaceOn:["#minecraft:all"]}
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Поставьте основу для начала создания мебели!","color":"green"}]
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"После установки основы используйте хотбар для управления курсором","color":"yellow"}]
scoreboard players set @s myo_menu 0
EOF

cat > data/myo/functions/editor/handle.mcfunction << 'EOF'
# Полный обработчик редактора
execute if entity @s[scores={myo_page=1}] run function myo:editor/setup_hotbar_1
execute if entity @s[scores={myo_page=2}] run function myo:editor/setup_hotbar_2
execute if entity @s[nbt={SelectedItem:{tag:{myo_up:1b}}}] run function myo:editor/move_up
execute if entity @s[nbt={SelectedItem:{tag:{myo_down:1b}}}] run function myo:editor/move_down
execute if entity @s[nbt={SelectedItem:{tag:{myo_left:1b}}}] run function myo:editor/move_left
execute if entity @s[nbt={SelectedItem:{tag:{myo_right:1b}}}] run function myo:editor/move_right
execute if entity @s[nbt={SelectedItem:{tag:{myo_forward:1b}}}] run function myo:editor/move_forward
execute if entity @s[nbt={SelectedItem:{tag:{myo_back:1b}}}] run function myo:editor/move_back
execute if entity @s[nbt={SelectedItem:{tag:{myo_place:1b}}}] run function myo:editor/place_block
execute if entity @s[nbt={SelectedItem:{tag:{myo_undo:1b}}}] run function myo:editor/undo_action
execute if entity @s[nbt={SelectedItem:{tag:{myo_next_page:1b}}}] run function myo:editor/next_page
execute if entity @s[nbt={SelectedItem:{tag:{myo_prev_page:1b}}}] run function myo:editor/prev_page
execute if entity @s[nbt={SelectedItem:{tag:{myo_texture:1b}}}] run function myo:editor/open_texture_menu
execute if entity @s[nbt={SelectedItem:{tag:{myo_properties:1b}}}] run function myo:editor/open_properties_menu
execute if entity @s[nbt={SelectedItem:{tag:{myo_save:1b}}}] run function myo:editor/save_furniture
execute if entity @s[nbt={SelectedItem:{tag:{myo_back_editor:1b}}}] run function myo:editor/back_to_editor
EOF

cat > data/myo/functions/editor/setup_hotbar_1.mcfunction << 'EOF'
# Настройка хотбара редактора - страница 1
item replace entity @s hotbar.0 with arrow{display:{Name:'[{"text":"Вверх","color":"green"}]'},CustomModelData:1,myo_up:1b}
item replace entity @s hotbar.1 with arrow{display:{Name:'[{"text":"Вниз","color":"green"}]'},CustomModelData:2,myo_down:1b}
item replace entity @s hotbar.2 with arrow{display:{Name:'[{"text":"Влево","color":"green"}]'},CustomModelData:3,myo_left:1b}
item replace entity @s hotbar.3 with arrow{display:{Name:'[{"text":"Вправо","color":"green"}]'},CustomModelData:4,myo_right:1b}
item replace entity @s hotbar.4 with arrow{display:{Name:'[{"text":"Вперед","color":"green"}]'},CustomModelData:5,myo_forward:1b}
item replace entity @s hotbar.5 with arrow{display:{Name:'[{"text":"Назад","color":"green"}]'},CustomModelData:6,myo_back:1b}
item replace entity @s hotbar.6 with redstone_block{display:{Name:'[{"text":"Установить Блок","color":"red","bold":true}]'},CustomModelData:1,myo_place:1b}
item replace entity @s hotbar.7 with barrier{display:{Name:'[{"text":"Отменить","color":"yellow"}]'},CustomModelData:1,myo_undo:1b}
item replace entity @s hotbar.8 with paper{display:{Name:'[{"text":"Следующая Страница","color":"aqua"}]'},CustomModelData:1,myo_next_page:1b}
EOF

cat > data/myo/functions/editor/setup_hotbar_2.mcfunction << 'EOF'
# Настройка хотбара редактора - страница 2
item replace entity @s hotbar.0 with book{display:{Name:'[{"text":"Первая Страница","color":"aqua"}]'},CustomModelData:1,myo_prev_page:1b}
item replace entity @s hotbar.1 with painting{display:{Name:'[{"text":"Установить Текстуру","color":"gold","bold":true}]'},CustomModelData:1,myo_texture:1b}
item replace entity @s hotbar.2 with writable_book{display:{Name:'[{"text":"Свойства Блока","color":"purple","bold":true}]'},CustomModelData:1,myo_properties:1b}
item replace entity @s hotbar.3 with emerald{display:{Name:'[{"text":"Сохранить Мебель","color":"green","bold":true}]'},CustomModelData:1,myo_save:1b}
item replace entity @s hotbar.4 with air
item replace entity @s hotbar.5 with air
item replace entity @s hotbar.6 with air
item replace entity @s hotbar.7 with air
item replace entity @s hotbar.8 with air
EOF

# Движение курсора
cat > data/myo/functions/editor/move_up.mcfunction << 'EOF'
# Движение курсора вверх
scoreboard players add @s myo_pos_y 1
execute if score @s myo_pos_y matches 17.. run scoreboard players set @s myo_pos_y 16
function myo:editor/update_cursor
EOF

cat > data/myo/functions/editor/move_down.mcfunction << 'EOF'
# Движение курсора вниз
scoreboard players remove @s myo_pos_y 1
execute if score @s myo_pos_y matches ..-1 run scoreboard players set @s myo_pos_y 0
function myo:editor/update_cursor
EOF

cat > data/myo/functions/editor/move_left.mcfunction << 'EOF'
# Движение курсора влево
scoreboard players remove @s myo_pos_x 1
execute if score @s myo_pos_x matches ..-1 run scoreboard players set @s myo_pos_x 0
function myo:editor/update_cursor
EOF

cat > data/myo/functions/editor/move_right.mcfunction << 'EOF'
# Движение курсора вправо
scoreboard players add @s myo_pos_x 1
execute if score @s myo_pos_x matches 17.. run scoreboard players set @s myo_pos_x 16
function myo:editor/update_cursor
EOF

cat > data/myo/functions/editor/move_forward.mcfunction << 'EOF'
# Движение курсора вперед
scoreboard players add @s myo_pos_z 1
execute if score @s myo_pos_z matches 17.. run scoreboard players set @s myo_pos_z 16
function myo:editor/update_cursor
EOF

cat > data/myo/functions/editor/move_back.mcfunction << 'EOF'
# Движение курсора назад
scoreboard players remove @s myo_pos_z 1
execute if score @s myo_pos_z matches ..-1 run scoreboard players set @s myo_pos_z 0
function myo:editor/update_cursor
EOF

cat > data/myo/functions/editor/update_cursor.mcfunction << 'EOF'
# Обновление позиции курсора
execute at @e[tag=myo_base,limit=1,sort=nearest] run kill @e[tag=myo_cursor,distance=..2]
execute at @e[tag=myo_base,limit=1,sort=nearest] run summon armor_stand ~ ~ ~ {Tags:["myo_cursor"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Курсор","color":"red"}]'}
execute as @e[tag=myo_cursor,limit=1,sort=nearest] at @s run function myo:editor/position_cursor
EOF

cat > data/myo/functions/editor/position_cursor.mcfunction << 'EOF'
# Позиционирование курсора
execute store result entity @s Pos[0] double 0.0625 run scoreboard players get @p myo_pos_x
execute store result entity @s Pos[1] double 0.0625 run scoreboard players get @p myo_pos_y
execute store result entity @s Pos[2] double 0.0625 run scoreboard players get @p myo_pos_z
execute at @s run particle redstone 1 0 0 1 ~ ~0.5 ~ 0.1 0.1 0.1 0 5 force @p
EOF

cat > data/myo/functions/editor/place_block.mcfunction << 'EOF'
# Установка блока
execute at @e[tag=myo_base,limit=1,sort=nearest] run summon armor_stand ~ ~ ~ {Tags:["myo_placed"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Блок","color":"blue"}]'}
execute as @e[tag=myo_placed,limit=1,sort=nearest] at @s run function myo:editor/position_placed
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Блок установлен!","color":"green"}]
EOF

cat > data/myo/functions/editor/position_placed.mcfunction << 'EOF'
# Позиционирование установленного блока
execute store result entity @s Pos[0] double 0.0625 run scoreboard players get @p myo_pos_x
execute store result entity @s Pos[1] double 0.0625 run scoreboard players get @p myo_pos_y
execute store result entity @s Pos[2] double 0.0625 run scoreboard players get @p myo_pos_z
execute at @s run particle dust 0 0 1 1 ~ ~0.5 ~ 0.1 0.1 0.1 0 5 force @p
EOF

cat > data/myo/functions/editor/undo_action.mcfunction << 'EOF'
# Отмена последнего действия
execute at @e[tag=myo_base,limit=1,sort=nearest] run kill @e[tag=myo_placed,limit=1,sort=furthest,distance=..2]
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Последнее действие отменено!","color":"yellow"}]
EOF

cat > data/myo/functions/editor/next_page.mcfunction << 'EOF'
# Следующая страница
scoreboard players set @s myo_page 2
EOF

cat > data/myo/functions/editor/prev_page.mcfunction << 'EOF'
# Предыдущая страница
scoreboard players set @s myo_page 1
EOF

cat > data/myo/functions/editor/detect_base.mcfunction << 'EOF'
# Обнаружение установки основы
execute as @e[type=item,nbt={Item:{tag:{myo_base:1b}}}] at @s if block ~ ~ ~ barrier run tag @s add myo_base_placed
execute as @e[tag=myo_base_placed] at @s run summon armor_stand ~ ~ ~ {Tags:["myo_base"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Основа Мебели","color":"gold"}]'}
execute as @e[tag=myo_base_placed] run kill @s
EOF

cat > data/myo/functions/editor/open_texture_menu.mcfunction << 'EOF'
# Открытие меню текстур
clear @s
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Меню выбора текстур","color":"green"}]
tellraw @s [{"text":"Выберите блок из инвентаря для использования в качестве текстуры","color":"yellow"}]
give @s oak_planks{display:{Name:'[{"text":"Дубовые Доски","color":"brown"}]'},CustomModelData:1,myo_tex_oak:1b}
give @s stone{display:{Name:'[{"text":"Камень","color":"gray"}]'},CustomModelData:1,myo_tex_stone:1b}
give @s iron_block{display:{Name:'[{"text":"Железный Блок","color":"white"}]'},CustomModelData:1,myo_tex_iron:1b}
give @s gold_block{display:{Name:'[{"text":"Золотой Блок","color":"yellow"}]'},CustomModelData:1,myo_tex_gold:1b}
give @s diamond_block{display:{Name:'[{"text":"Алмазный Блок","color":"aqua"}]'},CustomModelData:1,myo_tex_diamond:1b}
give @s emerald_block{display:{Name:'[{"text":"Изумрудный Блок","color":"green"}]'},CustomModelData:1,myo_tex_emerald:1b}
give @s barrier{display:{Name:'[{"text":"Вернуться к Редактору","color":"red"}]'},CustomModelData:1,myo_back_editor:1b}
EOF

cat > data/myo/functions/editor/open_properties_menu.mcfunction << 'EOF'
# Открытие меню свойств
clear @s
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Меню свойств блока","color":"green"}]
give @s lime_concrete{display:{Name:'[{"text":"Осязаемый: ВКЛ","color":"green","bold":true}]',Lore:['[{"text":"Игроки могут стоять на блоке","color":"gray"}]']},CustomModelData:1,myo_prop_solid_on:1b}
give @s red_concrete{display:{Name:'[{"text":"Осязаемый: ВЫКЛ","color":"red","bold":true}]',Lore:['[{"text":"Игроки проходят сквозь блок","color":"gray"}]']},CustomModelData:1,myo_prop_solid_off:1b}
give @s blue_concrete{display:{Name:'[{"text":"Можно Сесть: ВКЛ","color":"blue","bold":true}]',Lore:['[{"text":"На блок можно сесть","color":"gray"}]']},CustomModelData:1,myo_prop_sit_on:1b}
give @s gray_concrete{display:{Name:'[{"text":"Можно Сесть: ВЫКЛ","color":"gray","bold":true}]',Lore:['[{"text":"На блок нельзя сесть","color":"gray"}]']},CustomModelData:1,myo_prop_sit_off:1b}
give @s yellow_concrete{display:{Name:'[{"text":"Светится: ВКЛ","color":"yellow","bold":true}]',Lore:['[{"text":"Блок излучает свет","color":"gray"}]']},CustomModelData:1,myo_prop_light_on:1b}
give @s black_concrete{display:{Name:'[{"text":"Светится: ВЫКЛ","color":"dark_gray","bold":true}]',Lore:['[{"text":"Блок не излучает свет","color":"gray"}]']},CustomModelData:1,myo_prop_light_off:1b}
give @s barrier{display:{Name:'[{"text":"Вернуться к Редактору","color":"red"}]'},CustomModelData:1,myo_back_editor:1b}
EOF

cat > data/myo/functions/editor/save_furniture.mcfunction << 'EOF'
# Сохранение мебели
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Для сохранения мебели используйте команды:","color":"green"}]
tellraw @s [{"text":"Создать новый лист: ","color":"yellow"},{"text":"/myo newlist \"название_листа\"","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function myo:storage/new_list"}}]
tellraw @s [{"text":"Добавить в существующий: ","color":"yellow"},{"text":"/myo addlist \"лист\" \"название\"","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function myo:storage/add_to_list"}}]
EOF

cat > data/myo/functions/editor/back_to_editor.mcfunction << 'EOF'
# Возврат к редактору
scoreboard players set @s myo_page 1
function myo:editor/setup_hotbar_1
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Возврат к редактору","color":"green"}]
EOF

# Система хранения
cat > data/myo/functions/storage/new_list.mcfunction << 'EOF'
# Создание нового листа
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Новый лист создан! (Функция в разработке)","color":"green"}]
EOF

cat > data/myo/functions/storage/add_to_list.mcfunction << 'EOF'
# Добавление в лист
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Мебель добавлена в лист! (Функция в разработке)","color":"green"}]
EOF

cat > data/myo/functions/storage/export_furniture.mcfunction << 'EOF'
# Экспорт мебели
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"=== ЭКСПОРТ МЕБЕЛИ ===","color":"green","bold":true}]
tellraw @s [{"text":"Ваш код экспорта:","color":"yellow"}]
tellraw @s [{"text":"MYO_EXPORT_CODE_12345","color":"aqua","bold":true,"clickEvent":{"action":"copy_to_clipboard","value":"MYO_EXPORT_CODE_12345"},"hoverEvent":{"action":"show_text","contents":"Нажмите для копирования"}}]
tellraw @s [{"text":"Поделитесь этим кодом с друзьями!","color":"green"}]
EOF

cat > data/myo/functions/storage/import_furniture.mcfunction << 'EOF'
# Импорт мебели
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"=== ИМПОРТ МЕБЕЛИ ===","color":"green","bold":true}]
tellraw @s [{"text":"Введите код импорта в чат:","color":"yellow"}]
tellraw @s [{"text":"Пример: ","color":"gray"},{"text":"MYO_IMPORT_CODE_67890","color":"aqua","clickEvent":{"action":"suggest_command","value":"MYO_IMPORT_CODE_67890"}}]
scoreboard players set @s myo_temp 4
EOF

# Команды
cat > data/myo/functions/commands/newlist.mcfunction << 'EOF'
# Команда создания нового листа
execute unless data storage myo:lists lists run data modify storage myo:lists lists set value []
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Введите название нового листа в чат:","color":"green"}]
tellraw @s [{"text":"Пример: ","color":"yellow"},{"text":"Моя Мебель","color":"aqua","clickEvent":{"action":"suggest_command","value":"Моя Мебель"}}]
scoreboard players set @s myo_temp 1
EOF

cat > data/myo/functions/commands/addlist.mcfunction << 'EOF'
# Команда добавления в лист
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Введите название листа и название предмета:","color":"green"}]
tellraw @s [{"text":"Формат: ","color":"yellow"},{"text":"название_листа название_предмета","color":"aqua"}]
scoreboard players set @s myo_temp 2
EOF

cat > data/myo/functions/commands/renamelist.mcfunction << 'EOF'
# Команда переименования листа
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Введите старое и новое название листа:","color":"green"}]
tellraw @s [{"text":"Формат: ","color":"yellow"},{"text":"старое_название новое_название","color":"aqua"}]
scoreboard players set @s myo_temp 3
EOF

# Примеры
cat > data/myo/functions/examples/open_examples_menu.mcfunction << 'EOF'
# Меню примеров и шаблонов
clear @s
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Примеры и Шаблоны","color":"green","bold":true}]
give @s oak_stairs{display:{Name:'[{"text":"Создать Стул","color":"brown","bold":true}]',Lore:['[{"text":"Пример простого стула","color":"gray"}]']},CustomModelData:1,myo_example_chair:1b}
give @s oak_slab{display:{Name:'[{"text":"Создать Стол","color":"brown","bold":true}]',Lore:['[{"text":"Пример обеденного стола","color":"gray"}]']},CustomModelData:1,myo_example_table:1b}
give @s red_bed{display:{Name:'[{"text":"Шаблон Кресла","color":"red","bold":true}]',Lore:['[{"text":"Готовый шаблон кресла","color":"gray"}]']},CustomModelData:1,myo_template_armchair:1b}
give @s blue_bed{display:{Name:'[{"text":"Шаблон Дивана","color":"blue","bold":true}]',Lore:['[{"text":"Готовый шаблон дивана","color":"gray"}]']},CustomModelData:1,myo_template_sofa:1b}
give @s chest{display:{Name:'[{"text":"Шаблон Шкафа","color":"brown","bold":true}]',Lore:['[{"text":"Готовый шаблон шкафа","color":"gray"}]']},CustomModelData:1,myo_template_wardrobe:1b}
give @s book{display:{Name:'[{"text":"Руководство по Созданию","color":"green","bold":true}]',Lore:['[{"text":"Советы и хитрости","color":"gray"}]']},CustomModelData:1,myo_guide:1b}
give @s barrier{display:{Name:'[{"text":"Назад в Главное Меню","color":"red"}]'},CustomModelData:1,myo_back_main:1b}
EOF

cat > data/myo/functions/examples/create_chair.mcfunction << 'EOF'
# Пример создания стула
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Создание примера стула...","color":"green"}]
summon armor_stand ~ ~ ~ {Tags:["myo_base"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Основа Стула","color":"gold"}]'}
# Сиденье стула
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.25 ~0.5 ~0.25 {Tags:["myo_placed","chair_seat"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.5 ~0.5 ~0.25 {Tags:["myo_placed","chair_seat"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.75 ~0.5 ~0.25 {Tags:["myo_placed","chair_seat"],Invisible:1b,NoGravity:1b,Marker:1b}
# Ножки стула
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.25 ~0.0625 ~0.25 {Tags:["myo_placed","chair_leg"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.75 ~0.0625 ~0.25 {Tags:["myo_placed","chair_leg"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.25 ~0.0625 ~0.75 {Tags:["myo_placed","chair_leg"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.75 ~0.0625 ~0.75 {Tags:["myo_placed","chair_leg"],Invisible:1b,NoGravity:1b,Marker:1b}
# Спинка стула
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.25 ~0.75 ~0.75 {Tags:["myo_placed","chair_back"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.5 ~0.75 ~0.75 {Tags:["myo_placed","chair_back"],Invisible:1b,NoGravity:1b,Marker:1b}
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.75 ~0.75 ~0.75 {Tags:["myo_placed","chair_back"],Invisible:1b,NoGravity:1b,Marker:1b}
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Стул создан! Используйте редактор для изменений.","color":"green"}]
EOF

cat > data/myo/functions/examples/create_table.mcfunction << 'EOF'
# Пример создания стола
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Создание примера стола...","color":"green"}]
summon armor_stand ~ ~ ~ {Tags:["myo_base"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Основа Стола","color":"gold"}]'}
# Столешница
execute at @e[tag=myo_base,limit=1] run fill ~0.125 ~0.75 ~0.125 ~0.875 ~0.8125 ~0.875 oak_planks replace air
# Ножки стола
execute at @e[tag=myo_base,limit=1] run fill ~0.125 ~0 ~0.125 ~0.25 ~0.75 ~0.25 oak_log replace air
execute at @e[tag=myo_base,limit=1] run fill ~0.75 ~0 ~0.125 ~0.875 ~0.75 ~0.25 oak_log replace air
execute at @e[tag=myo_base,limit=1] run fill ~0.125 ~0 ~0.75 ~0.25 ~0.75 ~0.875 oak_log replace air
execute at @e[tag=myo_base,limit=1] run fill ~0.75 ~0 ~0.75 ~0.875 ~0.75 ~0.875 oak_log replace air
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Стол создан!","color":"green"}]
EOF

cat > data/myo/functions/examples/template_armchair.mcfunction << 'EOF'
# Шаблон кресла
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Загрузка шаблона кресла...","color":"green"}]
give @s structure_block{display:{Name:'[{"text":"Шаблон Кресла","color":"purple","bold":true}]',Lore:['[{"text":"Готовый шаблон для создания","color":"gray"}]','[{"text":"удобного кресла","color":"gray"}]']},CustomModelData:1,myo_template_armchair:1b}
EOF

cat > data/myo/functions/examples/template_sofa.mcfunction << 'EOF'
# Шаблон дивана
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Загрузка шаблона дивана...","color":"green"}]
give @s structure_block{display:{Name:'[{"text":"Шаблон Дивана","color":"blue","bold":true}]',Lore:['[{"text":"Готовый шаблон для создания","color":"gray"}]','[{"text":"комфортного дивана","color":"gray"}]']},CustomModelData:1,myo_template_sofa:1b}
EOF

cat > data/myo/functions/examples/template_wardrobe.mcfunction << 'EOF'
# Шаблон шкафа
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Загрузка шаблона шкафа...","color":"green"}]
give @s structure_block{display:{Name:'[{"text":"Шаблон Шкафа","color":"brown","bold":true}]',Lore:['[{"text":"Готовый шаблон для создания","color":"gray"}]','[{"text":"вместительного шкафа","color":"gray"}]']},CustomModelData:1,myo_template_wardrobe:1b}
EOF

cat > data/myo/functions/examples/show_guide.mcfunction << 'EOF'
# Руководство по созданию мебели
tellraw @s [{"text":"========================================","color":"gold"}]
tellraw @s [{"text":"    Руководство по Созданию Мебели","color":"green","bold":true}]
tellraw @s [{"text":"========================================","color":"gold"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"💡 Советы для начинающих:","color":"yellow","bold":true}]
tellraw @s [{"text":"• Начинайте с простых форм","color":"white"}]
tellraw @s [{"text":"• Используйте симметрию","color":"white"}]
tellraw @s [{"text":"• Планируйте размеры заранее","color":"white"}]
tellraw @s [{"text":"• Экспериментируйте с текстурами","color":"white"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"🪑 Создание стула:","color":"yellow","bold":true}]
tellraw @s [{"text":"1. Создайте сиденье (4x4 блока)","color":"white"}]
tellraw @s [{"text":"2. Добавьте 4 ножки по углам","color":"white"}]
tellraw @s [{"text":"3. Постройте спинку сзади","color":"white"}]
tellraw @s [{"text":"4. Настройте свойство 'Можно сесть'","color":"white"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"🔧 Полезные хитрости:","color":"yellow","bold":true}]
tellraw @s [{"text":"• Используйте отмену для исправлений","color":"white"}]
tellraw @s [{"text":"• Сохраняйте промежуточные версии","color":"white"}]
tellraw @s [{"text":"• Копируйте удачные элементы","color":"white"}]
tellraw @s [{"text":"• Делитесь творениями с друзьями","color":"white"}]
tellraw @s [{"text":""}]
tellraw @s [{"text":"========================================","color":"gold"}]
EOF

# Теги функций
cat > data/minecraft/tags/functions/load.json << 'EOF'
{
  "values": [
    "myo:load"
  ]
}
EOF

cat > data/minecraft/tags/functions/tick.json << 'EOF'
{
  "values": [
    "myo:tick"
  ]
}
EOF

echo "Полный датапак создан!"
echo "Структура:"
find . -name "*.mcfunction" | wc -l
echo "функций создано"