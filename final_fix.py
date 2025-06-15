#!/usr/bin/env python3
import os
import re

def fix_mixed_quotes(content):
    """Исправляет смешанные кавычки в командах"""
    
    # Исправляем команды tellraw с неправильными кавычками
    def fix_tellraw_quotes(match):
        full_match = match.group(0)
        # Заменяем все двойные кавычки на одинарные
        fixed = full_match.replace('"', "'")
        return fixed
    
    # Находим и исправляем команды tellraw
    content = re.sub(r"tellraw @\w+ \[.*?\]", fix_tellraw_quotes, content, flags=re.DOTALL)
    
    # Исправляем команды give с неправильными кавычками
    def fix_give_quotes(match):
        full_match = match.group(0)
        # Заменяем все двойные кавычки на одинарные
        fixed = full_match.replace('"', "'")
        return fixed
    
    content = re.sub(r"give @\w+ \w+\[.*?\]", fix_give_quotes, content, flags=re.DOTALL)
    
    return content

def fix_item_syntax(content):
    """Исправляет синтаксис предметов"""
    
    # Исправляем custom_name с неправильными скобками
    def fix_custom_name(match):
        inner = match.group(1).strip('[]').replace('"', "'")
        return f"custom_name={{{inner}}}"
    
    content = re.sub(r"custom_name='(\[.*?\])'", fix_custom_name, content)
    
    # Исправляем lore с неправильными скобками  
    def fix_lore(match):
        inner = match.group(1).replace('"', "'")
        return f"lore={inner}"
    
    content = re.sub(r"lore=(\[.*?\])", fix_lore, content)
    
    return content

def process_file(filepath):
    """Обрабатывает один файл"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        content = fix_mixed_quotes(content)
        content = fix_item_syntax(content)
        
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
    
    print("🔧 Финальное исправление синтаксиса...")
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