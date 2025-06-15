@echo off
echo ========================================
echo   MYO Furniture Creator - Примеры
echo ========================================
echo.

REM Запуск полной настройки
call complete_setup.bat

cd "MYO_Furniture_Creator"

echo Создание примеров мебели и шаблонов...

REM Создание папки для примеров
mkdir "data\myo\functions\examples" 2>nul

REM Пример создания стула
echo # Пример создания стула > data\myo\functions\examples\create_chair.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Создание примера стула...","color":"green"}] >> data\myo\functions\examples\create_chair.mcfunction
echo summon armor_stand ~ ~ ~ {Tags:["myo_base"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Основа Стула","color":"gold"}]'} >> data\myo\functions\examples\create_chair.mcfunction
echo # Сиденье стула >> data\myo\functions\examples\create_chair.mcfunction
echo execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.25 ~0.5 ~0.25 {Tags:["myo_placed","chair_seat"],Invisible:1b,NoGravity:1b,Marker:1b} >> data\myo\functions\examples\create_chair.mcfunction
echo execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.5 ~0.5 ~0.25 {Tags:["myo_placed","chair_seat"],Invisible:1b,NoGravity:1b,Marker:1b} >> data\myo\functions\examples\create_chair.mcfunction
echo execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.75 ~0.5 ~0.25 {Tags:["myo_placed","chair_seat"],Invisible:1b,NoGravity:1b,Marker:1b} >> data\myo\functions\examples\create_chair.mcfunction
echo # Ножки стула >> data\myo\functions\examples\create_chair.mcfunction
echo execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.25 ~0.0625 ~0.25 {Tags:["myo_placed","chair_leg"],Invisible:1b,NoGravity:1b,Marker:1b} >> data\myo\functions\examples\create_chair.mcfunction
echo execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.75 ~0.0625 ~0.25 {Tags:["myo_placed","chair_leg"],Invisible:1b,NoGravity:1b,Marker:1b} >> data\myo\functions\examples\create_chair.mcfunction
echo execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.25 ~0.0625 ~0.75 {Tags:["myo_placed","chair_leg"],Invisible:1b,NoGravity:1b,Marker:1b} >> data\myo\functions\examples\create_chair.mcfunction
echo execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.75 ~0.0625 ~0.75 {Tags:["myo_placed","chair_leg"],Invisible:1b,NoGravity:1b,Marker:1b} >> data\myo\functions\examples\create_chair.mcfunction
echo # Спинка стула >> data\myo\functions\examples\create_chair.mcfunction
echo execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.25 ~0.75 ~0.75 {Tags:["myo_placed","chair_back"],Invisible:1b,NoGravity:1b,Marker:1b} >> data\myo\functions\examples\create_chair.mcfunction
echo execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.5 ~0.75 ~0.75 {Tags:["myo_placed","chair_back"],Invisible:1b,NoGravity:1b,Marker:1b} >> data\myo\functions\examples\create_chair.mcfunction
echo execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.75 ~0.75 ~0.75 {Tags:["myo_placed","chair_back"],Invisible:1b,NoGravity:1b,Marker:1b} >> data\myo\functions\examples\create_chair.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Стул создан! Используйте редактор для изменений.","color":"green"}] >> data\myo\functions\examples\create_chair.mcfunction

REM Пример создания стола
echo # Пример создания стола > data\myo\functions\examples\create_table.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Создание примера стола...","color":"green"}] >> data\myo\functions\examples\create_table.mcfunction
echo summon armor_stand ~ ~ ~ {Tags:["myo_base"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Основа Стола","color":"gold"}]'} >> data\myo\functions\examples\create_table.mcfunction
echo # Столешница >> data\myo\functions\examples\create_table.mcfunction
echo execute at @e[tag=myo_base,limit=1] run fill ~0.125 ~0.75 ~0.125 ~0.875 ~0.8125 ~0.875 oak_planks replace air >> data\myo\functions\examples\create_table.mcfunction
echo # Ножки стола >> data\myo\functions\examples\create_table.mcfunction
echo execute at @e[tag=myo_base,limit=1] run fill ~0.125 ~0 ~0.125 ~0.25 ~0.75 ~0.25 oak_log replace air >> data\myo\functions\examples\create_table.mcfunction
echo execute at @e[tag=myo_base,limit=1] run fill ~0.75 ~0 ~0.125 ~0.875 ~0.75 ~0.25 oak_log replace air >> data\myo\functions\examples\create_table.mcfunction
echo execute at @e[tag=myo_base,limit=1] run fill ~0.125 ~0 ~0.75 ~0.25 ~0.75 ~0.875 oak_log replace air >> data\myo\functions\examples\create_table.mcfunction
echo execute at @e[tag=myo_base,limit=1] run fill ~0.75 ~0 ~0.75 ~0.875 ~0.75 ~0.875 oak_log replace air >> data\myo\functions\examples\create_table.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Стол создан!","color":"green"}] >> data\myo\functions\examples\create_table.mcfunction

REM Шаблоны для быстрого создания
echo # Шаблон кресла > data\myo\functions\examples\template_armchair.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Загрузка шаблона кресла...","color":"green"}] >> data\myo\functions\examples\template_armchair.mcfunction
echo give @s structure_block{display:{Name:'[{"text":"Шаблон Кресла","color":"purple","bold":true}]',Lore:['[{"text":"Готовый шаблон для создания","color":"gray"}]','[{"text":"удобного кресла","color":"gray"}]']},CustomModelData:1,myo_template_armchair:1b} >> data\myo\functions\examples\template_armchair.mcfunction

echo # Шаблон дивана > data\myo\functions\examples\template_sofa.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Загрузка шаблона дивана...","color":"green"}] >> data\myo\functions\examples\template_sofa.mcfunction
echo give @s structure_block{display:{Name:'[{"text":"Шаблон Дивана","color":"blue","bold":true}]',Lore:['[{"text":"Готовый шаблон для создания","color":"gray"}]','[{"text":"комфортного дивана","color":"gray"}]']},CustomModelData:1,myo_template_sofa:1b} >> data\myo\functions\examples\template_sofa.mcfunction

echo # Шаблон шкафа > data\myo\functions\examples\template_wardrobe.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Загрузка шаблона шкафа...","color":"green"}] >> data\myo\functions\examples\template_wardrobe.mcfunction
echo give @s structure_block{display:{Name:'[{"text":"Шаблон Шкафа","color":"brown","bold":true}]',Lore:['[{"text":"Готовый шаблон для создания","color":"gray"}]','[{"text":"вместительного шкафа","color":"gray"}]']},CustomModelData:1,myo_template_wardrobe:1b} >> data\myo\functions\examples\template_wardrobe.mcfunction

REM Меню примеров
echo # Меню примеров и шаблонов > data\myo\functions\examples\open_examples_menu.mcfunction
echo clear @s >> data\myo\functions\examples\open_examples_menu.mcfunction
echo tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Примеры и Шаблоны","color":"green","bold":true}] >> data\myo\functions\examples\open_examples_menu.mcfunction
echo give @s oak_stairs{display:{Name:'[{"text":"Создать Стул","color":"brown","bold":true}]',Lore:['[{"text":"Пример простого стула","color":"gray"}]']},CustomModelData:1,myo_example_chair:1b} >> data\myo\functions\examples\open_examples_menu.mcfunction
echo give @s oak_slab{display:{Name:'[{"text":"Создать Стол","color":"brown","bold":true}]',Lore:['[{"text":"Пример обеденного стола","color":"gray"}]']},CustomModelData:1,myo_example_table:1b} >> data\myo\functions\examples\open_examples_menu.mcfunction
echo give @s red_bed{display:{Name:'[{"text":"Шаблон Кресла","color":"red","bold":true}]',Lore:['[{"text":"Готовый шаблон кресла","color":"gray"}]']},CustomModelData:1,myo_template_armchair:1b} >> data\myo\functions\examples\open_examples_menu.mcfunction
echo give @s blue_bed{display:{Name:'[{"text":"Шаблон Дивана","color":"blue","bold":true}]',Lore:['[{"text":"Готовый шаблон дивана","color":"gray"}]']},CustomModelData:1,myo_template_sofa:1b} >> data\myo\functions\examples\open_examples_menu.mcfunction
echo give @s chest{display:{Name:'[{"text":"Шаблон Шкафа","color":"brown","bold":true}]',Lore:['[{"text":"Готовый шаблон шкафа","color":"gray"}]']},CustomModelData:1,myo_template_wardrobe:1b} >> data\myo\functions\examples\open_examples_menu.mcfunction
echo give @s book{display:{Name:'[{"text":"Руководство по Созданию","color":"green","bold":true}]',Lore:['[{"text":"Советы и хитрости","color":"gray"}]']},CustomModelData:1,myo_guide:1b} >> data\myo\functions\examples\open_examples_menu.mcfunction
echo give @s barrier{display:{Name:'[{"text":"Назад в Главное Меню","color":"red"}]'},CustomModelData:1,myo_back_main:1b} >> data\myo\functions\examples\open_examples_menu.mcfunction

REM Руководство по созданию
echo # Руководство по созданию мебели > data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"========================================","color":"gold"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"    Руководство по Созданию Мебели","color":"green","bold":true}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"========================================","color":"gold"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":""}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"💡 Советы для начинающих:","color":"yellow","bold":true}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"• Начинайте с простых форм","color":"white"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"• Используйте симметрию","color":"white"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"• Планируйте размеры заранее","color":"white"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"• Экспериментируйте с текстурами","color":"white"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":""}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"🪑 Создание стула:","color":"yellow","bold":true}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"1. Создайте сиденье (4x4 блока)","color":"white"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"2. Добавьте 4 ножки по углам","color":"white"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"3. Постройте спинку сзади","color":"white"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"4. Настройте свойство 'Можно сесть'","color":"white"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":""}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"🔧 Полезные хитрости:","color":"yellow","bold":true}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"• Используйте отмену для исправлений","color":"white"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"• Сохраняйте промежуточные версии","color":"white"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"• Копируйте удачные элементы","color":"white"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"• Делитесь творениями с друзьями","color":"white"}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":""}] >> data\myo\functions\examples\show_guide.mcfunction
echo tellraw @s [{"text":"========================================","color":"gold"}] >> data\myo\functions\examples\show_guide.mcfunction

REM Обновленный обработчик меню с примерами
echo # Обновленный обработчик меню с примерами > data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_create:1b}}}] run function myo:editor/start_creation >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_list:1b}}}] run function myo:menu/open_advanced_list >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_export:1b}}}] run function myo:storage/export_furniture >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_import:1b}}}] run function myo:storage/import_furniture >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_examples:1b}}}] run function myo:examples/open_examples_menu >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_back_main:1b}}}] run function myo:menu/open_main >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_create_list:1b}}}] run function myo:commands/newlist >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_example_chair:1b}}}] run function myo:examples/create_chair >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_example_table:1b}}}] run function myo:examples/create_table >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_template_armchair:1b}}}] run function myo:examples/template_armchair >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_template_sofa:1b}}}] run function myo:examples/template_sofa >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_template_wardrobe:1b}}}] run function myo:examples/template_wardrobe >> data\myo\functions\menu\handle.mcfunction
echo execute if entity @s[nbt={SelectedItem:{tag:{myo_guide:1b}}}] run function myo:examples/show_guide >> data\myo\functions\menu\handle.mcfunction

REM Обновленное главное меню с примерами
echo # Обновленное основное меню с примерами > data\myo\functions\menu\open_main.mcfunction
echo scoreboard players set @s myo_menu 1 >> data\myo\functions\menu\open_main.mcfunction
echo clear @s >> data\myo\functions\menu\open_main.mcfunction
echo item replace entity @s inventory.0 with paper{display:{Name:'[{"text":"Создание Мебели","color":"green","bold":true}]',Lore:['[{"text":"Нажмите для начала создания","color":"gray"}]']},CustomModelData:1,myo_create:1b} >> data\myo\functions\menu\open_main.mcfunction
echo item replace entity @s inventory.1 with book{display:{Name:'[{"text":"Мои Творения","color":"blue","bold":true}]',Lore:['[{"text":"Просмотр созданной мебели","color":"gray"}]']},CustomModelData:1,myo_list:1b} >> data\myo\functions\menu\open_main.mcfunction
echo item replace entity @s inventory.2 with knowledge_book{display:{Name:'[{"text":"Примеры и Шаблоны","color":"purple","bold":true}]',Lore:['[{"text":"Готовые примеры мебели","color":"gray"}]']},CustomModelData:1,myo_examples:1b} >> data\myo\functions\menu\open_main.mcfunction
echo item replace entity @s inventory.7 with emerald{display:{Name:'[{"text":"Экспорт","color":"aqua","bold":true}]',Lore:['[{"text":"Экспорт ваших творений","color":"gray"}]']},CustomModelData:1,myo_export:1b} >> data\myo\functions\menu\open_main.mcfunction
echo item replace entity @s inventory.8 with diamond{display:{Name:'[{"text":"Импорт","color":"light_purple","bold":true}]',Lore:['[{"text":"Импорт творений","color":"gray"}]']},CustomModelData:1,myo_import:1b} >> data\myo\functions\menu\open_main.mcfunction
echo title @s title [{"text":"MYO Furniture Creator","color":"gold"}] >> data\myo\functions\menu\open_main.mcfunction
echo title @s subtitle [{"text":"Выберите действие","color":"yellow"}] >> data\myo\functions\menu\open_main.mcfunction

echo.
echo ========================================
echo    Примеры и шаблоны добавлены!
echo ========================================
echo.
echo ✨ Новые возможности:
echo - Готовые примеры мебели (стул, стол)
echo - Шаблоны для быстрого создания
echo - Подробное руководство
echo - Советы и хитрости
echo - Расширенное главное меню
echo.
echo 📚 Доступные примеры:
echo - Стул (простой пример)
echo - Стол (обеденный стол)
echo - Шаблоны: кресло, диван, шкаф
echo.
echo 🎯 Как использовать:
echo 1. Откройте главное меню
echo 2. Выберите "Примеры и Шаблоны"
echo 3. Выберите нужный пример
echo 4. Изучайте и модифицируйте!
echo.
pause