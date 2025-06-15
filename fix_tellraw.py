#!/usr/bin/env python3
import os
import re

def convert_tellraw_to_snbt(content):
    """Конвертирует команды tellraw из JSON в SNBT"""
    
    def replace_tellraw(match):
        target = match.group(1)
        json_part = match.group(2)
        
        # Заменяем JSON на SNBT
        snbt = json_part.replace('"', "'")
        snbt = snbt.replace("'clickEvent'", "click_event")
        snbt = snbt.replace("'hoverEvent'", "hover_event")
        
        return f"tellraw {target} {snbt}"
    
    # Паттерн для поиска команд tellraw
    pattern = r'tellraw (@\w+) (\[.*?\])'
    content = re.sub(pattern, replace_tellraw, content, flags=re.DOTALL)
    
    return content

def fix_nbt_selectors(content):
    """Исправляет старые NBT селекторы"""
    # Исправляем nbt={Item:{tag:{...}}}
    content = re.sub(r'nbt=\{Item:\{tag:\{([^}]+)\}\}\}', r'custom_data~{\1}', content)
    
    return content

def process_file(filepath):
    """Обрабатывает один файл"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        content = convert_tellraw_to_snbt(content)
        content = fix_nbt_selectors(content)
        
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
    
    print("🔧 Исправление команд tellraw и NBT селекторов...")
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