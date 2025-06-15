#!/bin/bash

echo "🔧 Быстрое исправление синтаксиса для Minecraft 1.21.5..."

# Исправляем основные проблемы в файлах
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/CustomModelData:/custom_model_data=/g' {} \;
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/Lore:/lore=/g' {} \;

# Исправляем проблемы с закрывающими скобками в командах give
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/\]\]'"'"'/]/g' {} \;
find MYO_Furniture_Creator -name "*.mcfunction" -type f -exec sed -i 's/}},/},/g' {} \;

echo "✅ Основные исправления применены!"
echo "🔍 Проверяем файлы с ошибками..."

# Проверяем файлы на наличие синтаксических ошибок
grep -r "]]'" MYO_Furniture_Creator/data/myo/functions/ || echo "✅ Нет ошибок с ]]'"
grep -r "}}" MYO_Furniture_Creator/data/myo/functions/ | grep -v "custom_data" || echo "✅ Нет лишних }}"

echo "🎉 Исправления завершены!"