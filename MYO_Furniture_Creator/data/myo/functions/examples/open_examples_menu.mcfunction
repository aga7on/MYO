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
