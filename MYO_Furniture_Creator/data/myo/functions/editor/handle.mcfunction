# Полный обработчик редактора
execute if entity @s[scores={myo_page=1}] run function myo:editor/setup_hotbar_1
execute if entity @s[scores={myo_page=2}] run function myo:editor/setup_hotbar_2
execute if items entity @s weapon.mainhand *[custom_data~{myo_up:1b}] run function myo:editor/move_up
execute if items entity @s weapon.mainhand *[custom_data~{myo_down:1b}] run function myo:editor/move_down
execute if items entity @s weapon.mainhand *[custom_data~{myo_left:1b}] run function myo:editor/move_left
execute if items entity @s weapon.mainhand *[custom_data~{myo_right:1b}] run function myo:editor/move_right
execute if items entity @s weapon.mainhand *[custom_data~{myo_forward:1b}] run function myo:editor/move_forward
execute if items entity @s weapon.mainhand *[custom_data~{myo_back:1b}] run function myo:editor/move_back
execute if items entity @s weapon.mainhand *[custom_data~{myo_place:1b}] run function myo:editor/place_block
execute if items entity @s weapon.mainhand *[custom_data~{myo_undo:1b}] run function myo:editor/undo_action
execute if items entity @s weapon.mainhand *[custom_data~{myo_next_page:1b}] run function myo:editor/next_page
execute if items entity @s weapon.mainhand *[custom_data~{myo_prev_page:1b}] run function myo:editor/prev_page
execute if items entity @s weapon.mainhand *[custom_data~{myo_texture:1b}] run function myo:editor/open_texture_menu
execute if items entity @s weapon.mainhand *[custom_data~{myo_properties:1b}] run function myo:editor/open_properties_menu
execute if items entity @s weapon.mainhand *[custom_data~{myo_save:1b}] run function myo:editor/save_furniture
execute if items entity @s weapon.mainhand *[custom_data~{myo_back_editor:1b}] run function myo:editor/back_to_editor
