# Открытие расширенного меню списков
clear @s
tellraw @s [{'text':'[MYO] ",color:'gold'},{text:'Ваши Листы Мебели',color:'green'}]
give @s oak_sign[custom_name={{'text':'Домашняя Мебель','color':'brown','bold':true],lore=['[{'text':'Мебель для дома','color':'gray'}},'[{'text':'Нажмите для просмотра','color':'yellow'}]']},custom_model_data=1,myo_list_home:1b}
give @s spruce_sign[custom_name={{'text':'Офисная Мебель','color':'dark_green','bold':true],lore=['[{'text':'Мебель для офиса','color':'gray'}},'[{'text':'Нажмите для просмотра','color':'yellow'}]']},custom_model_data=1,myo_list_office:1b}
give @s birch_sign[custom_name={{'text':'Декоративная Мебель','color':'yellow','bold':true],lore=['[{'text':'Декоративные элементы','color':'gray'}},'[{'text':'Нажмите для просмотра','color':'yellow'}]']},custom_model_data=1,myo_list_decor:1b}
give @s emerald[custom_name='[{'text':'Создать Новый Лист','color':'green','bold':true]},custom_model_data=1,myo_create_list:1b}
give @s barrier[custom_name='[{'text':'Назад в Главное Меню','color':'red']},custom_model_data=1,myo_back_main:1b}
