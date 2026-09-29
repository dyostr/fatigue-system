# if sprinting and lacks the tag, increment the timer
execute as @a \
        unless entity @s[tag=sprint_disabled] \
        if predicate dyostr:sprinting \
        run scoreboard players add @s sprint_timer 1


# if not sprinting, decrement the timer
execute as @a \
        unless entity @s[tag=sprint_disabled] \
        unless predicate dyostr:sprinting \
        if score @s sprint_timer matches 1.. \
        run scoreboard players remove @s sprint_timer 1


# if sprint_timer > MAX_TIMER, give the 'sprint_disabled' tag to player
execute as @a \
        if score @s sprint_timer > MAX_TIMER CONST_VALUES \
        run tag @s add sprint_disabled


# if a player has 'sprint_disabled' tag, disable sprint
execute as @a[tag=sprint_disabled] \
        if entity @s \
        run function dyostr:disable_sprint


# if a player has 'sprint_disabled' tag, decrement the timer
execute as @a \
        if entity @s[tag=sprint_disabled] \
        if score @s sprint_timer matches 1.. \
        run scoreboard players remove @s sprint_timer 1


# if the timer equals zero, enable sprint
execute as @a[tag=sprint_disabled] \
        unless score @s sprint_timer matches 1.. \
        run function dyostr:enable_sprint


# === actionbar ===
execute as @a unless entity @s[tag=sprint_disabled] run function dyostr:actionbar
execute as @a if entity @s[tag=sprint_disabled] run function dyostr:actionbar_sprint_disabled


# === debug ===
execute store result score movement_speed debug_info \
        run attribute @a[limit=1] movement_speed get 10000000000
execute store result score air_drag_modifier debug_info \
        run attribute @a[limit=1] air_drag_modifier get
execute store result score sprint_timer debug_info \
        run scoreboard players get @a[limit=1] sprint_timer