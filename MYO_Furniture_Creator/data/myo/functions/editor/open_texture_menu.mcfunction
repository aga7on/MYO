# Открытие меню текстур
clear @s
tellraw @s [{'text':'[MYO] ",color:'gold'},{text:'Меню выбора текстур',color:'green'}]
tellraw @s [{'text':'Выберите блок из инвентаря для использования в качестве текстуры','color':'yellow'}]
give @s oak_planks[custom_name='[{'text':'Дубовые Доски','color':'brown']},custom_model_data=1,myo_tex_oak:1b}
give @s stone[custom_name='[{'text':'Камень','color':'gray']},custom_model_data=1,myo_tex_stone:1b}
give @s iron_block[custom_name='[{'text':'Железный Блок','color':'white']},custom_model_data=1,myo_tex_iron:1b}
give @s gold_block[custom_name='[{'text':'Золотой Блок','color':'yellow']},custom_model_data=1,myo_tex_gold:1b}
give @s diamond_block[custom_name='[{'text':'Алмазный Блок','color':'aqua']},custom_model_data=1,myo_tex_diamond:1b}
give @s emerald_block[custom_name='[{'text':'Изумрудный Блок','color':'green']},custom_model_data=1,myo_tex_emerald:1b}
give @s barrier[custom_name='[{'text':'Вернуться к Редактору','color':'red']},custom_model_data=1,myo_back_editor:1b}
