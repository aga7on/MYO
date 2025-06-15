# Отмена последнего действия
execute at @e[tag=myo_base,limit=1,sort=nearest] run kill @e[tag=myo_placed,limit=1,sort=furthest,distance=..2]
tellraw @s [{'text':'[MYO] ",color:'gold'},{text:'Последнее действие отменено!',color:'yellow'}]
