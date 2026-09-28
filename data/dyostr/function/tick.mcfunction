# store hunger level
execute as @a \
        store result score @s hunger_level \
        run data get entity @s foodLevel


# give hunger effect if hunger level between 9 and 20
effect give @a[scores={hunger_level=9..20}] minecraft:hunger infinite 255 true


# clear hunger effect if hunger level under 9
effect clear @a[scores={hunger_level=0..8}] minecraft:hunger


# if hunger level <= 6 and haven't sprint_disabled tag, give 2 hunger level
execute as @a[scores={hunger_level=0..6}, tag=!sprint_disabled] \
        if entity @s \
        run effect give @s saturation 1 1 true


# if sprinting, start timer
execute as @a[predicate=dyostr:sprinting] \
        if entity @s[tag=!sprint_disabled] \
        run scoreboard players add @s sprinting_time 1
# else, decrement timer
execute as @a[predicate=!dyostr:sprinting] \
        if entity @s \
        if score @s sprinting_time matches 1.. \
        run scoreboard players remove @s sprinting_time 1


# if timer > 60, give 'sprint_disabled' tag
execute as @a[scores={sprinting_time=60..}] \
        if entity @s[tag=!sprint_disabled] \
        run tag @s add sprint_disabled


# remove 'sprint_disabled' tag from player
execute as @a[tag=sprint_disabled, scores={sprinting_time=..0, hunger_level=0..6}] \
        if entity @s \
        run tag @s remove sprint_disabled


# if player has 'sprint_disabled' tag, give hunger effect
execute as @a[tag=sprint_disabled] \
        if entity @s \
        run effect give @s hunger infinite 255 true


# if player has 'sprint_disabled' tag and hunger level <= 6, clear hunger effect
execute as @a[tag=sprint_disabled, scores={hunger_level=0..6}] \
        if entity @s \
        run effect clear @s minecraft:hunger

# sprinting_time scoreboard sets to 60
execute as @a[tag=sprint_disabled, scores={hunger_level=0..6, sprinting_time=60..}] \
        if entity @s \
        run scoreboard players set @s sprinting_time 60

