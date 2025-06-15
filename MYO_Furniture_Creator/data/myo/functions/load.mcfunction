# MYO Furniture Creator - Load Function
tellraw @a [{"text":"[MYO] ","color":"gold"},{"text":"Furniture Creator загружен! ","color":"green"},{"text":"[Помощь]","color":"yellow","clickEvent":{"action":"run_command","value":"/function myo:help"},"hoverEvent":{"action":"show_text","contents":"Нажмите для справки"}}]
tellraw @a [{"text":"Используйте ","color":"green"},{"text":"/function myo:give_creator","color":"yellow","clickEvent":{"action":"run_command","value":"/function myo:give_creator"}},{"text":" для получения создателя мебели.","color":"green"}]
scoreboard objectives add myo_data dummy
scoreboard objectives add myo_menu dummy
scoreboard objectives add myo_editor dummy
scoreboard objectives add myo_temp dummy
scoreboard objectives add myo_page dummy
scoreboard objectives add myo_pos_x dummy
scoreboard objectives add myo_pos_y dummy
scoreboard objectives add myo_pos_z dummy
gamerule maxCommandChainLength 1000000
data modify storage myo:settings version set value "1.0.0"
