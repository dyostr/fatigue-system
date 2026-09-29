execute if score @s sprint_timer matches ..0 \
        run title @s actionbar [{"text":"□□□□□","color":"green"}]
execute if score @s sprint_timer >= ONE CONST_VALUES \
        run title @s actionbar [{"text":"■□□□□","color":"green"}]
execute if score @s sprint_timer >= TWO CONST_VALUES \
        run title @s actionbar [{"text":"■■□□□","color":"green"}]
execute if score @s sprint_timer >= THREE CONST_VALUES \
        run title @s actionbar [{"text":"■■■□□","color":"yellow"}]
execute if score @s sprint_timer >= FOUR CONST_VALUES \
        run title @s actionbar [{"text":"■■■■□","color":"yellow"}]
execute if score @s sprint_timer >= MAX_TIMER CONST_VALUES \
        run title @s actionbar [{"text":"■■■■■","color":"red"}]