#!/bin/bash

echo "🔧 Ультимативное исправление для Minecraft 1.21.5..."

# Исправляем все двойные кавычки на одинарные в текстовых компонентах
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/"text":/"text":/g' {} \;
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/"color":/"color":/g' {} \;
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/"bold":/"bold":/g' {} \;

# Заменяем JSON на SNBT в командах tellraw
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/{"text":/\{text:/g' {} \;
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/,"color":/,color:/g' {} \;
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/,"bold":/,bold:/g' {} \;
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/"}/'\''}/g' {} \;

# Исправляем кавычки в значениях
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i "s/text:\"\\([^\"]*\\)\"/text:'\\1'/g" {} \;
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i "s/color:\"\\([^\"]*\\)\"/color:'\\1'/g" {} \;
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i "s/value:\"\\([^\"]*\\)\"/value:'\\1'/g" {} \;
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i "s/contents:\"\\([^\"]*\\)\"/contents:'\\1'/g" {} \;

# Исправляем clickEvent и hoverEvent
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/"clickEvent":/click_event:/g' {} \;
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/"hoverEvent":/hover_event:/g' {} \;
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/"action":/action:/g' {} \;

echo "✅ Исправления применены!"

# Проверяем результат
echo "🔍 Проверка результата:"
echo "JSON команд осталось: $(grep -r '{"text"' MYO_Furniture_Creator/data/myo/functions/ | wc -l)"
echo "SNBT команд найдено: $(grep -r '{text:' MYO_Furniture_Creator/data/myo/functions/ | wc -l)"

echo "🎉 Готово!"