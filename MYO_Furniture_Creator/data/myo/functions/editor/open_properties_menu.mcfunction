# Открытие меню свойств
clear @s
tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Меню свойств блока","color":"green"}]
give @s lime_concrete[custom_name='[{"text":"Осязаемый: ВКЛ","color":"green","bold":true]]',Lore:['[{"text":"Игроки могут стоять на блоке","color":"gray"}]']},CustomModelData:1,myo_prop_solid_on:1b}
give @s red_concrete[custom_name='[{"text":"Осязаемый: ВЫКЛ","color":"red","bold":true]]',Lore:['[{"text":"Игроки проходят сквозь блок","color":"gray"}]']},CustomModelData:1,myo_prop_solid_off:1b}
give @s blue_concrete[custom_name='[{"text":"Можно Сесть: ВКЛ","color":"blue","bold":true]]',Lore:['[{"text":"На блок можно сесть","color":"gray"}]']},CustomModelData:1,myo_prop_sit_on:1b}
give @s gray_concrete[custom_name='[{"text":"Можно Сесть: ВЫКЛ","color":"gray","bold":true]]',Lore:['[{"text":"На блок нельзя сесть","color":"gray"}]']},CustomModelData:1,myo_prop_sit_off:1b}
give @s yellow_concrete[custom_name='[{"text":"Светится: ВКЛ","color":"yellow","bold":true]]',Lore:['[{"text":"Блок излучает свет","color":"gray"}]']},CustomModelData:1,myo_prop_light_on:1b}
give @s black_concrete[custom_name='[{"text":"Светится: ВЫКЛ","color":"dark_gray","bold":true]]',Lore:['[{"text":"Блок не излучает свет","color":"gray"}]']},CustomModelData:1,myo_prop_light_off:1b}
give @s barrier[custom_name='[{"text":"Вернуться к Редактору","color":"red"]]'},CustomModelData:1,myo_back_editor:1b}
