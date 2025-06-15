#!/usr/bin/env python3
import os
import re

def convert_json_to_snbt(json_str):
    """Конвертирует JSON текстовые компоненты в SNBT для Minecraft 1.21.5"""
    # Заменяем кавычки на одинарные для ключей и значений
    snbt = json_str.replace('"', "'")
    
    # Исправляем специальные поля
    snbt = snbt.replace("'clickEvent'", "click_event")
    snbt = snbt.replace("'hoverEvent'", "hover_event")
    
    return snbt

def fix_text_components(content):
    """Исправляет текстовые компоненты для Minecraft 1.21.5"""
    
    # Исправляем tellraw команды
    def fix_tellraw(match):
        target = match.group(1)
        json_component = match.group(2)
        snbt_component = convert_json_to_snbt(json_component)
        return f"tellraw {target} {snbt_component}"
    
    content = re.sub(r'tellraw (@\w+) (\[.*?\])', fix_tellraw, content, flags=re.DOTALL)
    
    # Исправляем title команды
    def fix_title(match):
        target = match.group(1)
        title_type = match.group(2)
        json_component = match.group(3)
        snbt_component = convert_json_to_snbt(json_component)
        return f"title {target} {title_type} {snbt_component}"
    
    content = re.sub(r'title (@\w+) (title|subtitle) (\[.*?\])', fix_title, content, flags=re.DOTALL)
    
    return content

def fix_item_components(content):
    """Исправляет компоненты предметов для Minecraft 1.21.5"""
    
    # Исправляем custom_name в командах give и item replace
    def fix_custom_name(match):
        prefix = match.group(1)
        json_name = match.group(2)
        suffix = match.group(3)
        
        # Убираем внешние кавычки и скобки, конвертируем в SNBT
        json_name = json_name.strip("'[]")
        snbt_name = convert_json_to_snbt(json_name)
        
        return f"{prefix}custom_name={snbt_name}{suffix}"
    
    content = re.sub(r"(.*?)custom_name='(\[.*?\])'(.*?)", fix_custom_name, content, flags=re.DOTALL)
    
    # Исправляем lore
    def fix_lore(match):
        prefix = match.group(1)
        json_lore = match.group(2)
        suffix = match.group(3)
        
        # Убираем внешние скобки и конвертируем каждый элемент
        json_lore = json_lore.strip("[]")
        lore_items = re.findall(r"'(\[.*?\])'", json_lore)
        
        snbt_lore_items = []
        for item in lore_items:
            item_clean = item.strip("[]")
            snbt_item = convert_json_to_snbt(item_clean)
            snbt_lore_items.append(snbt_item)
        
        snbt_lore = "[" + ",".join(snbt_lore_items) + "]"
        
        return f"{prefix}lore={snbt_lore}{suffix}"
    
    content = re.sub(r"(.*?)lore=(\[.*?\])(.*?)", fix_lore, content, flags=re.DOTALL)
    
    return content

def process_file(filepath):
    """Обрабатывает один файл"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        
        # Применяем исправления
        content = fix_text_components(content)
        content = fix_item_components(content)
        
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
    
    print("🔧 Исправление синтаксиса для Minecraft 1.21.5...")
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