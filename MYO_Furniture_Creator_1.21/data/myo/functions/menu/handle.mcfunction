# Обновленный обработчик меню с примерами
execute if entity @s[nbt={SelectedItem:{tag:{myo_create:1b}}}] run function myo:editor/start_creation
execute if entity @s[nbt={SelectedItem:{tag:{myo_list:1b}}}] run function myo:menu/open_advanced_list
execute if entity @s[nbt={SelectedItem:{tag:{myo_export:1b}}}] run function myo:storage/export_furniture
execute if entity @s[nbt={SelectedItem:{tag:{myo_import:1b}}}] run function myo:storage/import_furniture
execute if entity @s[nbt={SelectedItem:{tag:{myo_examples:1b}}}] run function myo:examples/open_examples_menu
execute if entity @s[nbt={SelectedItem:{tag:{myo_back_main:1b}}}] run function myo:menu/open_main
execute if entity @s[nbt={SelectedItem:{tag:{myo_create_list:1b}}}] run function myo:commands/newlist
execute if entity @s[nbt={SelectedItem:{tag:{myo_example_chair:1b}}}] run function myo:examples/create_chair
execute if entity @s[nbt={SelectedItem:{tag:{myo_example_table:1b}}}] run function myo:examples/create_table
execute if entity @s[nbt={SelectedItem:{tag:{myo_template_armchair:1b}}}] run function myo:examples/template_armchair
execute if entity @s[nbt={SelectedItem:{tag:{myo_template_sofa:1b}}}] run function myo:examples/template_sofa
execute if entity @s[nbt={SelectedItem:{tag:{myo_template_wardrobe:1b}}}] run function myo:examples/template_wardrobe
execute if entity @s[nbt={SelectedItem:{tag:{myo_guide:1b}}}] run function myo:examples/show_guide
