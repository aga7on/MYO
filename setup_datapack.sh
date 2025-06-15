#!/bin/bash

echo "========================================"
echo "   MYO Furniture Creator Datapack Setup"
echo "========================================"
echo

# Создание основной структуры датапака
mkdir -p "MYO_Furniture_Creator"
cd "MYO_Furniture_Creator"

# Создание основных папок
mkdir -p "data/myo/functions/core"
mkdir -p "data/myo/functions/menu"
mkdir -p "data/myo/functions/editor"
mkdir -p "data/myo/functions/storage"
mkdir -p "data/myo/functions/utils"
mkdir -p "data/myo/advancements"
mkdir -p "data/myo/recipes"
mkdir -p "data/myo/loot_tables"
mkdir -p "data/minecraft/tags/functions"

echo "Создание pack.mcmeta..."
cat > pack.mcmeta << 'EOF'
{
  "pack": {
    "pack_format": 15,
    "description": "MYO Furniture Creator - Create your own custom furniture!"
  }
}
EOF

echo "Создание основных функций..."

# Основная функция загрузки
cat > data/myo/functions/load.mcfunction << 'EOF'
# MYO Furniture Creator - Load Function
tellraw @a [{"text":"[MYO] ","color":"gold"},{"text":"Furniture Creator загружен! Используйте ","color":"green"},{"text":"/function myo:give_creator","color":"yellow","clickEvent":{"action":"run_command","value":"/function myo:give_creator"}},{"text":" для получения создателя мебели.","color":"green"}]
scoreboard objectives add myo_data dummy
scoreboard objectives add myo_menu dummy
scoreboard objectives add myo_editor dummy
scoreboard objectives add myo_temp dummy
scoreboard objectives add myo_page dummy
scoreboard objectives add myo_pos_x dummy
scoreboard objectives add myo_pos_y dummy
scoreboard objectives add myo_pos_z dummy
gamerule maxCommandChainLength 1000000
EOF

# Функция выдачи создателя мебели
cat > data/myo/functions/give_creator.mcfunction << 'EOF'
# Выдача создателя мебели
give @s chest{display:{Name:'[{"text":"Создатель Мебели","color":"gold","bold":true}]',Lore:['[{"text":"Щелкните правой кнопкой для открытия","color":"gray"}]','[{"text":"меню создания мебели","color":"gray"}]']},CustomModelData:1,myo_creator:1b}
EOF

# Основная функция тика
cat > data/myo/functions/tick.mcfunction << 'EOF'
# Основной тик
execute as @a[nbt={SelectedItem:{tag:{myo_creator:1b}}}] at @s run function myo:core/check_use
execute as @a[scores={myo_menu=1..}] at @s run function myo:menu/handle
execute as @a[scores={myo_editor=1..}] at @s run function myo:editor/handle
EOF

echo "Создание функций меню..."

# Основное меню
cat > data/myo/functions/menu/open_main.mcfunction << 'EOF'
# Открытие основного меню
scoreboard players set @s myo_menu 1
clear @s
item replace entity @s inventory.0 with paper{display:{Name:'[{"text":"Создание Мебели","color":"green","bold":true}]',Lore:['[{"text":"Нажмите для начала создания","color":"gray"}]']},CustomModelData:1,myo_create:1b}
item replace entity @s inventory.1 with book{display:{Name:'[{"text":"Мои Творения","color":"blue","bold":true}]',Lore:['[{"text":"Просмотр созданной мебели","color":"gray"}]']},CustomModelData:1,myo_list:1b}
item replace entity @s inventory.7 with emerald{display:{Name:'[{"text":"Экспорт","color":"aqua","bold":true}]',Lore:['[{"text":"Экспорт ваших творений","color":"gray"}]']},CustomModelData:1,myo_export:1b}
item replace entity @s inventory.8 with diamond{display:{Name:'[{"text":"Импорт","color":"light_purple","bold":true}]',Lore:['[{"text":"Импорт творений","color":"gray"}]']},CustomModelData:1,myo_import:1b}
title @s title [{"text":"MYO Furniture Creator","color":"gold"}]
title @s subtitle [{"text":"Выберите действие","color":"yellow"}]
EOF

echo "Создание функций редактора..."

# Начало редактирования
cat > data/myo/functions/editor/start_creation.mcfunction << 'EOF'
# Начало создания мебели
scoreboard players set @s myo_editor 1
scoreboard players set @s myo_page 1
scoreboard players set @s myo_pos_x 8
scoreboard players set @s myo_pos_y 8
scoreboard players set @s myo_pos_z 8
clear @s
give @s barrier{display:{Name:'[{"text":"Основа для Мебели","color":"red","bold":true}]',Lore:['[{"text":"Поставьте этот блок для начала","color":"gray"}]','[{"text":"редактирования мебели","color":"gray"}]']},CustomModelData:1,myo_base:1b}
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Поставьте основу для начала создания мебели!","color":"green"}]
scoreboard players set @s myo_menu 0
EOF

echo "Создание вспомогательных функций..."

# Функция проверки использования
cat > data/myo/functions/core/check_use.mcfunction << 'EOF'
# Проверка использования создателя
execute if entity @s[nbt={SelectedItem:{tag:{myo_creator:1b}}}] run function myo:menu/open_main
EOF

# Обработчик меню
cat > data/myo/functions/menu/handle.mcfunction << 'EOF'
# Обработчик меню
execute if entity @s[nbt={SelectedItem:{tag:{myo_create:1b}}}] run function myo:editor/start_creation
execute if entity @s[nbt={SelectedItem:{tag:{myo_list:1b}}}] run function myo:menu/open_list
EOF

# Обработчик редактора
cat > data/myo/functions/editor/handle.mcfunction << 'EOF'
# Обработчик редактора
execute if entity @s[scores={myo_page=1}] run function myo:editor/setup_hotbar_1
execute if entity @s[scores={myo_page=2}] run function myo:editor/setup_hotbar_2
EOF

# Настройка хотбара редактора (страница 1)
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

# Настройка хотбара редактора (страница 2)
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

# Открытие списка творений
cat > data/myo/functions/menu/open_list.mcfunction << 'EOF'
# Открытие списка творений
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Функция списка творений в разработке!","color":"yellow"}]
EOF

echo "Создание тегов функций..."

# Тег загрузки
cat > data/minecraft/tags/functions/load.json << 'EOF'
{
  "values": [
    "myo:load"
  ]
}
EOF

# Тег тика
cat > data/minecraft/tags/functions/tick.json << 'EOF'
{
  "values": [
    "myo:tick"
  ]
}
EOF

echo
echo "========================================"
echo "   Датапак успешно создан!"
echo "========================================"
echo
echo "Инструкции по установке:"
echo "1. Скопируйте папку 'MYO_Furniture_Creator' в папку datapacks вашего мира"
echo "2. Перезагрузите мир или используйте /reload"
echo "3. Используйте /function myo:give_creator для получения создателя мебели"
echo
echo "Удачного создания мебели!"
echo