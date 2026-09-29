# if sprinting, increment the timer
execute as @a \
        if predicate dyostr:sprinting \
        run scoreboard players add @s sprint_time 1


# if not sprinting, decrement the timer
execute as @a \
        unless predicate dyostr:sprinting \
        if score @s sprint_time matches 1.. \
        run scoreboard players remove @s sprint_time 1


# if sprint_time > VALUE, disable sprint
execute as @a \
        if score @s sprint_time > VALUE sprint_time \
        run tag @s add sprint_disabled


# speed down
execute as @a \
        if entity @s[tag=sprint_disabled] \
        run attribute @s movement_speed base set 0.08


# reset speed
execute as @a \
        if entity @s[tag=sprint_disabled] \
        if score @s sprint_time matches ..0 \
        run attribute @s movement_speed base reset


# 