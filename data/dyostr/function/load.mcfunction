# reset
scoreboard objectives remove sprint_timer

# load
scoreboard objectives add sprint_timer dummy
scoreboard objectives add CONST_VALUES dummy

# === const values ===
# MAX_TIMER - timer limit
scoreboard players set MAX_TIMER CONST_VALUES 60

scoreboard players set 5 CONST_VALUES 5

scoreboard players operation STEP_TIMER CONST_VALUES = MAX_TIMER CONST_VALUES
scoreboard players operation STEP_TIMER CONST_VALUES /= 5 CONST_VALUES

scoreboard players operation ONE CONST_VALUES = STEP_TIMER CONST_VALUES

scoreboard players operation TWO CONST_VALUES = STEP_TIMER CONST_VALUES
scoreboard players operation TWO CONST_VALUES += STEP_TIMER CONST_VALUES

scoreboard players operation THREE CONST_VALUES = TWO CONST_VALUES
scoreboard players operation THREE CONST_VALUES += STEP_TIMER CONST_VALUES

scoreboard players operation FOUR CONST_VALUES = THREE CONST_VALUES
scoreboard players operation FOUR CONST_VALUES += STEP_TIMER CONST_VALUES
# ====================