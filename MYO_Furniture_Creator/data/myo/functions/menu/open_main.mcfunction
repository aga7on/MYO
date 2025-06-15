# Открытие основного меню с примерами
scoreboard players set @s myo_menu 1
clear @s
item replace entity @s inventory.0 with paper[custom_name={text:'Создание Мебели',color:'green',bold:true},lore=[{text:'Нажмите для начала создания',color:'gray'}],custom_model_data=1,custom_data={myo_create:1b}]
item replace entity @s inventory.1 with book[custom_name={text:'Мои Творения',color:'blue',bold:true},lore=[{text:'Просмотр созданной мебели',color:'gray'}],custom_model_data=1,custom_data={myo_list:1b}]
item replace entity @s inventory.2 with knowledge_book[custom_name={text:'Примеры и Шаблоны',color:'purple',bold:true},lore=[{text:'Готовые примеры мебели',color:'gray'}],custom_model_data=1,custom_data={myo_examples:1b}]
item replace entity @s inventory.7 with emerald[custom_name={text:'Экспорт',color:'aqua',bold:true},lore=[{text:'Экспорт ваших творений',color:'gray'}],custom_model_data=1,custom_data={myo_export:1b}]
item replace entity @s inventory.8 with diamond[custom_name={text:'Импорт',color:'light_purple',bold:true},lore=[{text:'Импорт творений',color:'gray'}],custom_model_data=1,custom_data={myo_import:1b}]
title @s title {text:'MYO Furniture Creator',color:'gold'}
title @s subtitle {text:'Выберите действие',color:'yellow'}
