scoreboard objectives remove debug_info
scoreboard objectives add debug_info dummy "Debug Info"
scoreboard objectives setdisplay sidebar debug_info


# === debug ===
execute store result score movement_speed debug_info \
        run attribute @a[limit=1] movement_speed get 10000000000
execute store result score air_drag_modifier debug_info \
        run attribute @a[limit=1] air_drag_modifier get
execute store result score sprint_timer debug_info \
        run scoreboard players get @a[limit=1] sprint_timer