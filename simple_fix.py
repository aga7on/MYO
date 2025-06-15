#!/usr/bin/env python3
import os
import re

def fix_commands(content):
    """Простое исправление команд для Minecraft 1.21.5"""
    
    # Исправляем основные проблемы в командах give
    content = re.sub(r'custom_name=\'(\[.*?\])\'', lambda m: f'custom_name={convert_to_snbt(m.group(1))}', content)
    content = re.sub(r'lore=(\[.*?\])', lambda m: f'lore={convert_lore_to_snbt(m.group(1))}', content)
    content = re.sub(r'CustomModelData:(\d+)', r'custom_model_data=\1', content)
    content = re.sub(r'Lore:(\[.*?\])', lambda m: f'lore={convert_lore_to_snbt(m.group(1))}', content)
    
    return content

def convert_to_snbt(json_str):
    """Конвертирует JSON в SNBT"""
    # Убираем внешние скобки
    json_str = json_str.strip('[]')
    # Заменяем двойные кавычки на одинарные
    snbt = json_str.replace('"', "'")
    # Убираем лишние кавычки вокруг объекта
    snbt = snbt.strip("'")
    return '{' + snbt + '}'

def convert_lore_to_snbt(lore_str):
    """Конвертирует lore в SNBT"""
    # Находим все элементы lore
    items = re.findall(r"'(\[.*?\])'", lore_str)
    snbt_items = []
    for item in items:
        item_clean = item.strip('[]')
        item_snbt = item_clean.replace('"', "'")
        snbt_items.append('{' + item_snbt + '}')
    
    return '[' + ','.join(snbt_items) + ']'

def process_file(filepath):
    """Обрабатывает один файл"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        content = fix_commands(content)
        
        if content != original_content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"✅ Исправлен: {filepath}")
            return True
    except Exception as e:
        print(f"❌ Ошибка в {filepath}: {e}")
    
    return False

def main():
    """Основная функция"""
    datapack_path = "MYO_Furniture_Creator/data/myo/functions"
    fixed_count = 0
    
    print("🔧 Простое исправление команд...")
    print()
    
    for root, dirs, files in os.walk(datapack_path):
        for file in files:
            if file.endswith('.mcfunction'):
                filepath = os.path.join(root, file)
                if process_file(filepath):
                    fixed_count += 1
    
    print()
    print(f"🎉 Исправлено файлов: {fixed_count}")

if __name__ == "__main__":
    main()