#> mpweapons.ench:_/util/get_weapon.1

item replace entity @s container.0 from entity @n[tag=_mpweapons.ench-enchanted] weapon.mainhand
data modify storage mpweapons.ench:var get_weapon.result set from entity @s item
kill @s