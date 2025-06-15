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
