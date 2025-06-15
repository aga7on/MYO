# MYO Furniture Creator - Техническая Документация

## 🔧 Архитектура системы

### Основные компоненты

#### 1. Система скорбордов
```mcfunction
scoreboard objectives add myo_data dummy      # Основные данные
scoreboard objectives add myo_menu dummy      # Состояние меню
scoreboard objectives add myo_editor dummy    # Состояние редактора
scoreboard objectives add myo_temp dummy      # Временные данные
scoreboard objectives add myo_page dummy      # Текущая страница
scoreboard objectives add myo_pos_x dummy     # X координата курсора
scoreboard objectives add myo_pos_y dummy     # Y координата курсора
scoreboard objectives add myo_pos_z dummy     # Z координата курсора
```

#### 2. Система тегов
- `myo_base` - Основа для редактирования мебели
- `myo_cursor` - Курсор позиции в редакторе
- `myo_placed` - Размещенные блоки мебели
- `chair_seat`, `chair_leg`, `chair_back` - Компоненты стула
- `table_top`, `table_leg` - Компоненты стола

#### 3. Хранилище данных
```mcfunction
# Основное хранилище списков
data modify storage myo:lists lists set value []

# Настройки системы
data modify storage myo:settings version set value "1.0.0"
data modify storage myo:settings max_blocks set value 4096
data modify storage myo:settings grid_size set value 16
```

## 📁 Структура файлов

```
MYO_Furniture_Creator/
├── pack.mcmeta
└── data/
    ├── minecraft/
    │   └── tags/
    │       └── functions/
    │           ├── load.json
    │           └── tick.json
    └── myo/
        ├── functions/
        │   ├── load.mcfunction
        │   ├── tick.mcfunction
        │   ├── give_creator.mcfunction
        │   ├── help.mcfunction
        │   ├── core/
        │   │   └── check_use.mcfunction
        │   ├── menu/
        │   │   ├── open_main.mcfunction
        │   │   ├── handle.mcfunction
        │   │   ├── open_list.mcfunction
        │   │   └── open_advanced_list.mcfunction
        │   ├── editor/
        │   │   ├── start_creation.mcfunction
        │   │   ├── handle.mcfunction
        │   │   ├── setup_hotbar_1.mcfunction
        │   │   ├── setup_hotbar_2.mcfunction
        │   │   ├── move_*.mcfunction
        │   │   ├── update_cursor.mcfunction
        │   │   ├── place_block.mcfunction
        │   │   ├── undo_action.mcfunction
        │   │   ├── save_furniture.mcfunction
        │   │   ├── open_texture_menu.mcfunction
        │   │   ├── open_properties_menu.mcfunction
        │   │   └── back_to_editor.mcfunction
        │   ├── storage/
        │   │   ├── new_list.mcfunction
        │   │   ├── add_to_list.mcfunction
        │   │   ├── export_furniture.mcfunction
        │   │   └── import_furniture.mcfunction
        │   ├── commands/
        │   │   ├── newlist.mcfunction
        │   │   ├── addlist.mcfunction
        │   │   └── renamelist.mcfunction
        │   ├── examples/
        │   │   ├── create_chair.mcfunction
        │   │   ├── create_table.mcfunction
        │   │   ├── template_*.mcfunction
        │   │   ├── open_examples_menu.mcfunction
        │   │   └── show_guide.mcfunction
        │   └── utils/
        │       └── cleanup.mcfunction
        ├── advancements/
        ├── recipes/
        └── loot_tables/
```

## 🎮 API для разработчиков

### Создание собственных шаблонов

#### Базовый шаблон функции
```mcfunction
# Шаблон создания мебели
# data/myo/functions/examples/template_custom.mcfunction

tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Создание пользовательского шаблона...","color":"green"}]

# Создание основы
summon armor_stand ~ ~ ~ {Tags:["myo_base"],Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'[{"text":"Пользовательская Мебель","color":"gold"}]'}

# Добавление блоков (координаты в пикселях 0-15)
execute at @e[tag=myo_base,limit=1] run summon armor_stand ~0.5 ~0.5 ~0.5 {Tags:["myo_placed","custom_part"],Invisible:1b,NoGravity:1b,Marker:1b}

tellraw @s [{"text":"[MYO] ","color":"gold"},{"text":"Шаблон создан!","color":"green"}]
```

#### Система координат
- Координаты в пикселях: 0-15 (16x16x16 сетка)
- Преобразование в блочные координаты: `pixel / 16`
- Центр блока: 8,8,8 в пиксельных координатах

### Добавление новых текстур

#### Регистрация текстуры
```mcfunction
# В функции open_texture_menu.mcfunction добавить:
give @s custom_block{display:{Name:'[{"text":"Пользовательская Текстура","color":"custom"}]'},CustomModelData:1,myo_tex_custom:1b}
```

#### Обработка выбора текстуры
```mcfunction
# В функции editor/handle.mcfunction добавить:
execute if entity @s[nbt={SelectedItem:{tag:{myo_tex_custom:1b}}}] run function myo:editor/apply_custom_texture
```

### Система событий

#### События редактора
- `myo:editor/on_block_place` - При размещении блока
- `myo:editor/on_block_remove` - При удалении блока
- `myo:editor/on_cursor_move` - При движении курсора
- `myo:editor/on_save` - При сохранении мебели

#### Пример обработчика события
```mcfunction
# data/myo/functions/events/on_block_place.mcfunction
execute as @a[scores={myo_editor=1..}] at @s run function myo:editor/update_preview
```

## 🔍 Отладка и диагностика

### Команды отладки
```mcfunction
# Показать все активные сущности MYO
/execute as @e[tag=myo_base] run say Основа найдена
/execute as @e[tag=myo_cursor] run say Курсор найден
/execute as @e[tag=myo_placed] run say Блок найден

# Проверить скорборды игрока
/scoreboard players list @s

# Очистить все данные MYO
/function myo:utils/cleanup
```

### Система логирования
```mcfunction
# Включение отладочных сообщений
scoreboard players set #debug myo_data 1

# В функциях добавлять:
execute if score #debug myo_data matches 1 run tellraw @a [{"text":"[DEBUG] ","color":"red"},{"text":"Функция выполнена","color":"white"}]
```

## ⚡ Оптимизация производительности

### Рекомендации
1. **Ограничение количества блоков**: Максимум 4096 блоков на мебель
2. **Очистка неиспользуемых сущностей**: Автоматическая очистка каждые 5 минут
3. **Оптимизация частиц**: Показ только ближайшим игрокам
4. **Кэширование данных**: Использование storage для часто используемых данных

### Настройки производительности
```mcfunction
# В load.mcfunction
gamerule maxCommandChainLength 1000000
gamerule maxEntityCramming 0

# Настройки частиц
scoreboard objectives add myo_particle_distance dummy
scoreboard players set #max_distance myo_particle_distance 10
```

## 🔒 Безопасность

### Проверки прав доступа
```mcfunction
# Проверка прав на использование
execute unless entity @s[tag=myo_allowed] unless entity @s[tag=admin] run return fail

# Ограничение количества одновременных редакторов
execute if score #active_editors myo_data matches 5.. run return fail
```

### Валидация данных
```mcfunction
# Проверка корректности координат
execute unless score @s myo_pos_x matches 0..15 run scoreboard players set @s myo_pos_x 8
execute unless score @s myo_pos_y matches 0..15 run scoreboard players set @s myo_pos_y 8
execute unless score @s myo_pos_z matches 0..15 run scoreboard players set @s myo_pos_z 8
```

## 🔄 Система обновлений

### Миграция данных
```mcfunction
# data/myo/functions/migrate/v1_0_to_v1_1.mcfunction
execute unless data storage myo:settings version run data modify storage myo:settings version set value "1.0.0"

execute if data storage myo:settings{version:"1.0.0"} run function myo:migrate/update_to_v1_1
```

### Проверка совместимости
```mcfunction
# В load.mcfunction
execute store result score #pack_format myo_data run data get pack.pack_format
execute unless score #pack_format myo_data matches 15.. run tellraw @a [{"text":"[MYO] Внимание: Устаревший формат датапака!","color":"red"}]
```

## 📊 Метрики и аналитика

### Сбор статистики
```mcfunction
# Подсчет созданной мебели
scoreboard objectives add myo_furniture_created dummy
execute as @a[scores={myo_editor=1..}] run scoreboard players add @s myo_furniture_created 1

# Время в редакторе
scoreboard objectives add myo_editor_time dummy
execute as @a[scores={myo_editor=1..}] run scoreboard players add @s myo_editor_time 1
```

### Экспорт статистики
```mcfunction
# data/myo/functions/stats/export.mcfunction
tellraw @s [{"text":"=== СТАТИСТИКА MYO ===","color":"gold"}]
tellraw @s [{"text":"Создано мебели: ","color":"yellow"},{"score":{"name":"@s","objective":"myo_furniture_created"},"color":"green"}]
tellraw @s [{"text":"Время в редакторе: ","color":"yellow"},{"score":{"name":"@s","objective":"myo_editor_time"},"color":"green"},{"text":" тиков","color":"gray"}]
```

## 🛠️ Расширения и модификации

### Создание дополнений
1. Создайте новый namespace: `data/myo_addon/`
2. Используйте теги функций для интеграции
3. Следуйте соглашениям именования MYO

### Пример дополнения
```mcfunction
# data/myo_addon/functions/load.mcfunction
tellraw @a [{"text":"[MYO Addon] ","color":"blue"},{"text":"Дополнение загружено!","color":"green"}]

# Добавление в тег загрузки
# data/minecraft/tags/functions/load.json
{
  "values": [
    "myo:load",
    "myo_addon:load"
  ]
}
```

## 📞 Поддержка и сообщество

### Отчеты об ошибках
При обнаружении ошибок включите в отчет:
- Версию Minecraft
- Версию датапака
- Шаги для воспроизведения
- Скриншоты/видео
- Логи команд

### Вклад в развитие
1. Fork репозитория
2. Создайте feature branch
3. Внесите изменения
4. Создайте Pull Request
5. Дождитесь ревью

---

*Эта документация обновляется с каждой версией датапака. Последнее обновление: v1.0.0*