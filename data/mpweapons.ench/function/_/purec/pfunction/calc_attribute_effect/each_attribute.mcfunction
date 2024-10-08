#> mpweapons.ench:_/purec/pfunction/calc_attribute_effect/each_attribute
#--------------------
# ./run
#--------------------

data modify storage mpweapons.ench:var calc.this_attribute set from storage mpweapons.ench:var calc.input.attributes[-1]

execute store result score *calc.base -mpweapons.ench run data get storage mpweapons.ench:var calc.this_attribute.amount.base 10000
execute store result score *calc.per -mpweapons.ench run data get storage mpweapons.ench:var calc.this_attribute.amount.per_additional_level 10000
scoreboard players operation *calc.per -mpweapons.ench *= *calc.level_add -mpweapons.ench
scoreboard players operation *calc.base -mpweapons.ench += *calc.per -mpweapons.ench

data remove storage mpweapons.ench:var calc.this_attribute.amount
execute store result storage mpweapons.ench:var calc.this_attribute.amount float 0.0001 run scoreboard players get *calc.base -mpweapons.ench

data modify storage mpweapons.ench:var calc.result.attributes append from storage mpweapons.ench:var calc.this_attribute

data remove storage mpweapons.ench:var calc.input.attributes[-1]
execute if data storage mpweapons.ench:var calc.input.attributes[0] run function mpweapons.ench:_/purec/pfunction/calc_attribute_effect/each_attribute
