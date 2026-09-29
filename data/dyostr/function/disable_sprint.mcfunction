# if a player is sprinting, slow him down
execute if predicate dyostr:sprinting \
        run attribute @s movement_speed modifier add sprint_disabled -0.024 add_value
execute if predicate dyostr:sprinting \
        run attribute @s minecraft:air_drag_modifier modifier add sprint_disabled 1 add_value

# else, clear slowness
execute unless predicate dyostr:sprinting \
        run attribute @s movement_speed modifier remove minecraft:sprint_disabled
execute unless predicate dyostr:sprinting \
        run attribute @s minecraft:air_drag_modifier modifier remove minecraft:sprint_disabled