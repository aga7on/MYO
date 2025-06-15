# Меню примеров и шаблонов
clear @s
tellraw @s [{text:'[MYO] ',color:'gold'},{text:'Примеры и Шаблоны',color:'green',bold:true}]
give @s oak_stairs[custom_name={text:'Создать Стул',color:'brown',bold:true},lore=[{text:'Пример простого стула',color:'gray'}],custom_model_data=1,custom_data={myo_example_chair:1b}]
give @s oak_slab[custom_name={text:'Создать Стол',color:'brown',bold:true},lore=[{text:'Пример обеденного стола',color:'gray'}],custom_model_data=1,custom_data={myo_example_table:1b}]
give @s red_bed[custom_name={text:'Шаблон Кресла',color:'red',bold:true},lore=[{text:'Готовый шаблон кресла',color:'gray'}],custom_model_data=1,custom_data={myo_template_armchair:1b}]
give @s blue_bed[custom_name={text:'Шаблон Дивана',color:'blue',bold:true},lore=[{text:'Готовый шаблон дивана',color:'gray'}],custom_model_data=1,custom_data={myo_template_sofa:1b}]
give @s chest[custom_name={text:'Шаблон Шкафа',color:'brown',bold:true},lore=[{text:'Готовый шаблон шкафа',color:'gray'}],custom_model_data=1,custom_data={myo_template_wardrobe:1b}]
give @s book[custom_name={text:'Руководство по Созданию',color:'green',bold:true},lore=[{text:'Советы и хитрости',color:'gray'}],custom_model_data=1,custom_data={myo_guide:1b}]
give @s barrier[custom_name={text:'Назад в Главное Меню',color:'red'},custom_model_data=1,custom_data={myo_back_main:1b}]
