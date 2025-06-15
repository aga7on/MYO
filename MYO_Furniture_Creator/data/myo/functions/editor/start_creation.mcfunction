# Обновленное начало создания мебели
scoreboard players set @s myo_editor 1
scoreboard players set @s myo_page 1
scoreboard players set @s myo_pos_x 8
scoreboard players set @s myo_pos_y 8
scoreboard players set @s myo_pos_z 8
clear @s
give @s barrier[custom_name={{text:'Основа для Мебели',color:'red',bold:true],lore=['[{text:'Поставьте этот блок для начала',color:'gray'}},'[{text:'редактирования мебели',color:'gray'}]']},custom_model_data=1,myo_base:1b,CanPlaceOn:["#minecraft:all"]}
tellraw @s [{text:'[MYO] ",color:'gold'},{text:'Поставьте основу для начала создания мебели!',color:'green'}]
tellraw @s [{text:'[MYO] ",color:'gold'},{text:'После установки основы используйте хотбар для управления курсором',color:'yellow'}]
scoreboard players set @s myo_menu 0
