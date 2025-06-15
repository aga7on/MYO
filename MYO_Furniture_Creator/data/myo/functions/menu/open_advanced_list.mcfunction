# Открытие расширенного меню списков
clear @s
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Ваши Листы Мебели","color":"green"}]
give @s oak_sign{display:{Name:'[{"text":"Домашняя Мебель","color":"brown","bold":true}]',Lore:['[{"text":"Мебель для дома","color":"gray"}]','[{"text":"Нажмите для просмотра","color":"yellow"}]']},CustomModelData:1,myo_list_home:1b}
give @s spruce_sign{display:{Name:'[{"text":"Офисная Мебель","color":"dark_green","bold":true}]',Lore:['[{"text":"Мебель для офиса","color":"gray"}]','[{"text":"Нажмите для просмотра","color":"yellow"}]']},CustomModelData:1,myo_list_office:1b}
give @s birch_sign{display:{Name:'[{"text":"Декоративная Мебель","color":"yellow","bold":true}]',Lore:['[{"text":"Декоративные элементы","color":"gray"}]','[{"text":"Нажмите для просмотра","color":"yellow"}]']},CustomModelData:1,myo_list_decor:1b}
give @s emerald{display:{Name:'[{"text":"Создать Новый Лист","color":"green","bold":true}]'},CustomModelData:1,myo_create_list:1b}
give @s barrier{display:{Name:'[{"text":"Назад в Главное Меню","color":"red"}]'},CustomModelData:1,myo_back_main:1b}
