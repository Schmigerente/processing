kill @e[type=item,nbt={Item:{tag:{sl.lock:1b}}}]
execute as @a at @s if entity @s[tag=sl.inv0] if entity @s[nbt=!{Inventory:[{Slot:0b}]}] run function schmig.slotlocker.main:slots/inv0_give
execute as @a at @s if entity @s[tag=sl.inv0] if entity @s[nbt=!{Inventory:[{Slot:0b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv0_replace
execute as @a at @s if entity @s[tag=sl.inv0] if entity @s[nbt=!{Inventory:[{Slot:0b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv0_give
execute as @a at @s if entity @s[tag=!sl.inv0] if entity @s[nbt={Inventory:[{Slot:0b,tag:{sl.lock:1b}}]}] run item replace entity @s container.0 with air
execute as @a at @s if entity @s[tag=sl.inv1] if entity @s[nbt=!{Inventory:[{Slot:1b}]}] run function schmig.slotlocker.main:slots/inv1_give
execute as @a at @s if entity @s[tag=sl.inv1] if entity @s[nbt=!{Inventory:[{Slot:1b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv1_replace
execute as @a at @s if entity @s[tag=sl.inv1] if entity @s[nbt=!{Inventory:[{Slot:1b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv1_give
execute as @a at @s if entity @s[tag=!sl.inv1] if entity @s[nbt={Inventory:[{Slot:1b,tag:{sl.lock:1b}}]}] run item replace entity @s container.1 with air
execute as @a at @s if entity @s[tag=sl.inv2] if entity @s[nbt=!{Inventory:[{Slot:2b}]}] run function schmig.slotlocker.main:slots/inv2_give
execute as @a at @s if entity @s[tag=sl.inv2] if entity @s[nbt=!{Inventory:[{Slot:2b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv2_replace
execute as @a at @s if entity @s[tag=sl.inv2] if entity @s[nbt=!{Inventory:[{Slot:2b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv2_give
execute as @a at @s if entity @s[tag=!sl.inv2] if entity @s[nbt={Inventory:[{Slot:2b,tag:{sl.lock:1b}}]}] run item replace entity @s container.2 with air
execute as @a at @s if entity @s[tag=sl.inv3] if entity @s[nbt=!{Inventory:[{Slot:3b}]}] run function schmig.slotlocker.main:slots/inv3_give
execute as @a at @s if entity @s[tag=sl.inv3] if entity @s[nbt=!{Inventory:[{Slot:3b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv3_replace
execute as @a at @s if entity @s[tag=sl.inv3] if entity @s[nbt=!{Inventory:[{Slot:3b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv3_give
execute as @a at @s if entity @s[tag=!sl.inv3] if entity @s[nbt={Inventory:[{Slot:3b,tag:{sl.lock:1b}}]}] run item replace entity @s container.3 with air
execute as @a at @s if entity @s[tag=sl.inv4] if entity @s[nbt=!{Inventory:[{Slot:4b}]}] run function schmig.slotlocker.main:slots/inv4_give
execute as @a at @s if entity @s[tag=sl.inv4] if entity @s[nbt=!{Inventory:[{Slot:4b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv4_replace
execute as @a at @s if entity @s[tag=sl.inv4] if entity @s[nbt=!{Inventory:[{Slot:4b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv4_give
execute as @a at @s if entity @s[tag=!sl.inv4] if entity @s[nbt={Inventory:[{Slot:4b,tag:{sl.lock:1b}}]}] run item replace entity @s container.4 with air
execute as @a at @s if entity @s[tag=sl.inv5] if entity @s[nbt=!{Inventory:[{Slot:5b}]}] run function schmig.slotlocker.main:slots/inv5_give
execute as @a at @s if entity @s[tag=sl.inv5] if entity @s[nbt=!{Inventory:[{Slot:5b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv5_replace
execute as @a at @s if entity @s[tag=sl.inv5] if entity @s[nbt=!{Inventory:[{Slot:5b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv5_give
execute as @a at @s if entity @s[tag=!sl.inv5] if entity @s[nbt={Inventory:[{Slot:5b,tag:{sl.lock:1b}}]}] run item replace entity @s container.5 with air
execute as @a at @s if entity @s[tag=sl.inv6] if entity @s[nbt=!{Inventory:[{Slot:6b}]}] run function schmig.slotlocker.main:slots/inv6_give
execute as @a at @s if entity @s[tag=sl.inv6] if entity @s[nbt=!{Inventory:[{Slot:6b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv6_replace
execute as @a at @s if entity @s[tag=sl.inv6] if entity @s[nbt=!{Inventory:[{Slot:6b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv6_give
execute as @a at @s if entity @s[tag=!sl.inv6] if entity @s[nbt={Inventory:[{Slot:6b,tag:{sl.lock:1b}}]}] run item replace entity @s container.6 with air
execute as @a at @s if entity @s[tag=sl.inv7] if entity @s[nbt=!{Inventory:[{Slot:7b}]}] run function schmig.slotlocker.main:slots/inv7_give
execute as @a at @s if entity @s[tag=sl.inv7] if entity @s[nbt=!{Inventory:[{Slot:7b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv7_replace
execute as @a at @s if entity @s[tag=sl.inv7] if entity @s[nbt=!{Inventory:[{Slot:7b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv7_give
execute as @a at @s if entity @s[tag=!sl.inv7] if entity @s[nbt={Inventory:[{Slot:7b,tag:{sl.lock:1b}}]}] run item replace entity @s container.7 with air
execute as @a at @s if entity @s[tag=sl.inv8] if entity @s[nbt=!{Inventory:[{Slot:8b}]}] run function schmig.slotlocker.main:slots/inv8_give
execute as @a at @s if entity @s[tag=sl.inv8] if entity @s[nbt=!{Inventory:[{Slot:8b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv8_replace
execute as @a at @s if entity @s[tag=sl.inv8] if entity @s[nbt=!{Inventory:[{Slot:8b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv8_give
execute as @a at @s if entity @s[tag=!sl.inv8] if entity @s[nbt={Inventory:[{Slot:8b,tag:{sl.lock:1b}}]}] run item replace entity @s container.8 with air
execute as @a at @s if entity @s[tag=sl.inv9] if entity @s[nbt=!{Inventory:[{Slot:9b}]}] run function schmig.slotlocker.main:slots/inv9_give
execute as @a at @s if entity @s[tag=sl.inv9] if entity @s[nbt=!{Inventory:[{Slot:9b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv9_replace
execute as @a at @s if entity @s[tag=sl.inv9] if entity @s[nbt=!{Inventory:[{Slot:9b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv9_give
execute as @a at @s if entity @s[tag=!sl.inv9] if entity @s[nbt={Inventory:[{Slot:9b,tag:{sl.lock:1b}}]}] run item replace entity @s container.9 with air
execute as @a at @s if entity @s[tag=sl.inv10] if entity @s[nbt=!{Inventory:[{Slot:10b}]}] run function schmig.slotlocker.main:slots/inv10_give
execute as @a at @s if entity @s[tag=sl.inv10] if entity @s[nbt=!{Inventory:[{Slot:10b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv10_replace
execute as @a at @s if entity @s[tag=sl.inv10] if entity @s[nbt=!{Inventory:[{Slot:10b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv10_give
execute as @a at @s if entity @s[tag=!sl.inv10] if entity @s[nbt={Inventory:[{Slot:10b,tag:{sl.lock:1b}}]}] run item replace entity @s container.10 with air
execute as @a at @s if entity @s[tag=sl.inv11] if entity @s[nbt=!{Inventory:[{Slot:11b}]}] run function schmig.slotlocker.main:slots/inv11_give
execute as @a at @s if entity @s[tag=sl.inv11] if entity @s[nbt=!{Inventory:[{Slot:11b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv11_replace
execute as @a at @s if entity @s[tag=sl.inv11] if entity @s[nbt=!{Inventory:[{Slot:11b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv11_give
execute as @a at @s if entity @s[tag=!sl.inv11] if entity @s[nbt={Inventory:[{Slot:11b,tag:{sl.lock:1b}}]}] run item replace entity @s container.11 with air
execute as @a at @s if entity @s[tag=sl.inv12] if entity @s[nbt=!{Inventory:[{Slot:12b}]}] run function schmig.slotlocker.main:slots/inv12_give
execute as @a at @s if entity @s[tag=sl.inv12] if entity @s[nbt=!{Inventory:[{Slot:12b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv12_replace
execute as @a at @s if entity @s[tag=sl.inv12] if entity @s[nbt=!{Inventory:[{Slot:12b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv12_give
execute as @a at @s if entity @s[tag=!sl.inv12] if entity @s[nbt={Inventory:[{Slot:12b,tag:{sl.lock:1b}}]}] run item replace entity @s container.12 with air
execute as @a at @s if entity @s[tag=sl.inv13] if entity @s[nbt=!{Inventory:[{Slot:13b}]}] run function schmig.slotlocker.main:slots/inv13_give
execute as @a at @s if entity @s[tag=sl.inv13] if entity @s[nbt=!{Inventory:[{Slot:13b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv13_replace
execute as @a at @s if entity @s[tag=sl.inv13] if entity @s[nbt=!{Inventory:[{Slot:13b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv13_give
execute as @a at @s if entity @s[tag=!sl.inv13] if entity @s[nbt={Inventory:[{Slot:13b,tag:{sl.lock:1b}}]}] run item replace entity @s container.13 with air
execute as @a at @s if entity @s[tag=sl.inv14] if entity @s[nbt=!{Inventory:[{Slot:14b}]}] run function schmig.slotlocker.main:slots/inv14_give
execute as @a at @s if entity @s[tag=sl.inv14] if entity @s[nbt=!{Inventory:[{Slot:14b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv14_replace
execute as @a at @s if entity @s[tag=sl.inv14] if entity @s[nbt=!{Inventory:[{Slot:14b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv14_give
execute as @a at @s if entity @s[tag=!sl.inv14] if entity @s[nbt={Inventory:[{Slot:14b,tag:{sl.lock:1b}}]}] run item replace entity @s container.14 with air
execute as @a at @s if entity @s[tag=sl.inv15] if entity @s[nbt=!{Inventory:[{Slot:15b}]}] run function schmig.slotlocker.main:slots/inv15_give
execute as @a at @s if entity @s[tag=sl.inv15] if entity @s[nbt=!{Inventory:[{Slot:15b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv15_replace
execute as @a at @s if entity @s[tag=sl.inv15] if entity @s[nbt=!{Inventory:[{Slot:15b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv15_give
execute as @a at @s if entity @s[tag=!sl.inv15] if entity @s[nbt={Inventory:[{Slot:15b,tag:{sl.lock:1b}}]}] run item replace entity @s container.15 with air
execute as @a at @s if entity @s[tag=sl.inv16] if entity @s[nbt=!{Inventory:[{Slot:16b}]}] run function schmig.slotlocker.main:slots/inv16_give
execute as @a at @s if entity @s[tag=sl.inv16] if entity @s[nbt=!{Inventory:[{Slot:16b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv16_replace
execute as @a at @s if entity @s[tag=sl.inv16] if entity @s[nbt=!{Inventory:[{Slot:16b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv16_give
execute as @a at @s if entity @s[tag=!sl.inv16] if entity @s[nbt={Inventory:[{Slot:16b,tag:{sl.lock:1b}}]}] run item replace entity @s container.16 with air
execute as @a at @s if entity @s[tag=sl.inv17] if entity @s[nbt=!{Inventory:[{Slot:17b}]}] run function schmig.slotlocker.main:slots/inv17_give
execute as @a at @s if entity @s[tag=sl.inv17] if entity @s[nbt=!{Inventory:[{Slot:17b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv17_replace
execute as @a at @s if entity @s[tag=sl.inv17] if entity @s[nbt=!{Inventory:[{Slot:17b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv17_give
execute as @a at @s if entity @s[tag=!sl.inv17] if entity @s[nbt={Inventory:[{Slot:17b,tag:{sl.lock:1b}}]}] run item replace entity @s container.17 with air
execute as @a at @s if entity @s[tag=sl.inv18] if entity @s[nbt=!{Inventory:[{Slot:18b}]}] run function schmig.slotlocker.main:slots/inv18_give
execute as @a at @s if entity @s[tag=sl.inv18] if entity @s[nbt=!{Inventory:[{Slot:18b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv18_replace
execute as @a at @s if entity @s[tag=sl.inv18] if entity @s[nbt=!{Inventory:[{Slot:18b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv18_give
execute as @a at @s if entity @s[tag=!sl.inv18] if entity @s[nbt={Inventory:[{Slot:18b,tag:{sl.lock:1b}}]}] run item replace entity @s container.18 with air
execute as @a at @s if entity @s[tag=sl.inv19] if entity @s[nbt=!{Inventory:[{Slot:19b}]}] run function schmig.slotlocker.main:slots/inv19_give
execute as @a at @s if entity @s[tag=sl.inv19] if entity @s[nbt=!{Inventory:[{Slot:19b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv19_replace
execute as @a at @s if entity @s[tag=sl.inv19] if entity @s[nbt=!{Inventory:[{Slot:19b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv19_give
execute as @a at @s if entity @s[tag=!sl.inv19] if entity @s[nbt={Inventory:[{Slot:19b,tag:{sl.lock:1b}}]}] run item replace entity @s container.19 with air
execute as @a at @s if entity @s[tag=sl.inv20] if entity @s[nbt=!{Inventory:[{Slot:20b}]}] run function schmig.slotlocker.main:slots/inv20_give
execute as @a at @s if entity @s[tag=sl.inv20] if entity @s[nbt=!{Inventory:[{Slot:20b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv20_replace
execute as @a at @s if entity @s[tag=sl.inv20] if entity @s[nbt=!{Inventory:[{Slot:20b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv20_give
execute as @a at @s if entity @s[tag=!sl.inv20] if entity @s[nbt={Inventory:[{Slot:20b,tag:{sl.lock:1b}}]}] run item replace entity @s container.20 with air
execute as @a at @s if entity @s[tag=sl.inv21] if entity @s[nbt=!{Inventory:[{Slot:21b}]}] run function schmig.slotlocker.main:slots/inv21_give
execute as @a at @s if entity @s[tag=sl.inv21] if entity @s[nbt=!{Inventory:[{Slot:21b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv21_replace
execute as @a at @s if entity @s[tag=sl.inv21] if entity @s[nbt=!{Inventory:[{Slot:21b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv21_give
execute as @a at @s if entity @s[tag=!sl.inv21] if entity @s[nbt={Inventory:[{Slot:21b,tag:{sl.lock:1b}}]}] run item replace entity @s container.21 with air
execute as @a at @s if entity @s[tag=sl.inv22] if entity @s[nbt=!{Inventory:[{Slot:22b}]}] run function schmig.slotlocker.main:slots/inv22_give
execute as @a at @s if entity @s[tag=sl.inv22] if entity @s[nbt=!{Inventory:[{Slot:22b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv22_replace
execute as @a at @s if entity @s[tag=sl.inv22] if entity @s[nbt=!{Inventory:[{Slot:22b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv22_give
execute as @a at @s if entity @s[tag=!sl.inv22] if entity @s[nbt={Inventory:[{Slot:22b,tag:{sl.lock:1b}}]}] run item replace entity @s container.22 with air
execute as @a at @s if entity @s[tag=sl.inv23] if entity @s[nbt=!{Inventory:[{Slot:23b}]}] run function schmig.slotlocker.main:slots/inv23_give
execute as @a at @s if entity @s[tag=sl.inv23] if entity @s[nbt=!{Inventory:[{Slot:23b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv23_replace
execute as @a at @s if entity @s[tag=sl.inv23] if entity @s[nbt=!{Inventory:[{Slot:23b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv23_give
execute as @a at @s if entity @s[tag=!sl.inv23] if entity @s[nbt={Inventory:[{Slot:23b,tag:{sl.lock:1b}}]}] run item replace entity @s container.23 with air
execute as @a at @s if entity @s[tag=sl.inv24] if entity @s[nbt=!{Inventory:[{Slot:24b}]}] run function schmig.slotlocker.main:slots/inv24_give
execute as @a at @s if entity @s[tag=sl.inv24] if entity @s[nbt=!{Inventory:[{Slot:24b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv24_replace
execute as @a at @s if entity @s[tag=sl.inv24] if entity @s[nbt=!{Inventory:[{Slot:24b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv24_give
execute as @a at @s if entity @s[tag=!sl.inv24] if entity @s[nbt={Inventory:[{Slot:24b,tag:{sl.lock:1b}}]}] run item replace entity @s container.24 with air
execute as @a at @s if entity @s[tag=sl.inv25] if entity @s[nbt=!{Inventory:[{Slot:25b}]}] run function schmig.slotlocker.main:slots/inv25_give
execute as @a at @s if entity @s[tag=sl.inv25] if entity @s[nbt=!{Inventory:[{Slot:25b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv25_replace
execute as @a at @s if entity @s[tag=sl.inv25] if entity @s[nbt=!{Inventory:[{Slot:25b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv25_give
execute as @a at @s if entity @s[tag=!sl.inv25] if entity @s[nbt={Inventory:[{Slot:25b,tag:{sl.lock:1b}}]}] run item replace entity @s container.25 with air
execute as @a at @s if entity @s[tag=sl.inv26] if entity @s[nbt=!{Inventory:[{Slot:26b}]}] run function schmig.slotlocker.main:slots/inv26_give
execute as @a at @s if entity @s[tag=sl.inv26] if entity @s[nbt=!{Inventory:[{Slot:26b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv26_replace
execute as @a at @s if entity @s[tag=sl.inv26] if entity @s[nbt=!{Inventory:[{Slot:26b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv26_give
execute as @a at @s if entity @s[tag=!sl.inv26] if entity @s[nbt={Inventory:[{Slot:26b,tag:{sl.lock:1b}}]}] run item replace entity @s container.26 with air
execute as @a at @s if entity @s[tag=sl.inv27] if entity @s[nbt=!{Inventory:[{Slot:27b}]}] run function schmig.slotlocker.main:slots/inv27_give
execute as @a at @s if entity @s[tag=sl.inv27] if entity @s[nbt=!{Inventory:[{Slot:27b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv27_replace
execute as @a at @s if entity @s[tag=sl.inv27] if entity @s[nbt=!{Inventory:[{Slot:27b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv27_give
execute as @a at @s if entity @s[tag=!sl.inv27] if entity @s[nbt={Inventory:[{Slot:27b,tag:{sl.lock:1b}}]}] run item replace entity @s container.27 with air
execute as @a at @s if entity @s[tag=sl.inv28] if entity @s[nbt=!{Inventory:[{Slot:28b}]}] run function schmig.slotlocker.main:slots/inv28_give
execute as @a at @s if entity @s[tag=sl.inv28] if entity @s[nbt=!{Inventory:[{Slot:28b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv28_replace
execute as @a at @s if entity @s[tag=sl.inv28] if entity @s[nbt=!{Inventory:[{Slot:28b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv28_give
execute as @a at @s if entity @s[tag=!sl.inv28] if entity @s[nbt={Inventory:[{Slot:28b,tag:{sl.lock:1b}}]}] run item replace entity @s container.28 with air
execute as @a at @s if entity @s[tag=sl.inv29] if entity @s[nbt=!{Inventory:[{Slot:29b}]}] run function schmig.slotlocker.main:slots/inv29_give
execute as @a at @s if entity @s[tag=sl.inv29] if entity @s[nbt=!{Inventory:[{Slot:29b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv29_replace
execute as @a at @s if entity @s[tag=sl.inv29] if entity @s[nbt=!{Inventory:[{Slot:29b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv29_give
execute as @a at @s if entity @s[tag=!sl.inv29] if entity @s[nbt={Inventory:[{Slot:29b,tag:{sl.lock:1b}}]}] run item replace entity @s container.29 with air
execute as @a at @s if entity @s[tag=sl.inv30] if entity @s[nbt=!{Inventory:[{Slot:30b}]}] run function schmig.slotlocker.main:slots/inv30_give
execute as @a at @s if entity @s[tag=sl.inv30] if entity @s[nbt=!{Inventory:[{Slot:30b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv30_replace
execute as @a at @s if entity @s[tag=sl.inv30] if entity @s[nbt=!{Inventory:[{Slot:30b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv30_give
execute as @a at @s if entity @s[tag=!sl.inv30] if entity @s[nbt={Inventory:[{Slot:30b,tag:{sl.lock:1b}}]}] run item replace entity @s container.30 with air
execute as @a at @s if entity @s[tag=sl.inv31] if entity @s[nbt=!{Inventory:[{Slot:31b}]}] run function schmig.slotlocker.main:slots/inv31_give
execute as @a at @s if entity @s[tag=sl.inv31] if entity @s[nbt=!{Inventory:[{Slot:31b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv31_replace
execute as @a at @s if entity @s[tag=sl.inv31] if entity @s[nbt=!{Inventory:[{Slot:31b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv31_give
execute as @a at @s if entity @s[tag=!sl.inv31] if entity @s[nbt={Inventory:[{Slot:31b,tag:{sl.lock:1b}}]}] run item replace entity @s container.31 with air
execute as @a at @s if entity @s[tag=sl.inv32] if entity @s[nbt=!{Inventory:[{Slot:32b}]}] run function schmig.slotlocker.main:slots/inv32_give
execute as @a at @s if entity @s[tag=sl.inv32] if entity @s[nbt=!{Inventory:[{Slot:32b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv32_replace
execute as @a at @s if entity @s[tag=sl.inv32] if entity @s[nbt=!{Inventory:[{Slot:32b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv32_give
execute as @a at @s if entity @s[tag=!sl.inv32] if entity @s[nbt={Inventory:[{Slot:32b,tag:{sl.lock:1b}}]}] run item replace entity @s container.32 with air
execute as @a at @s if entity @s[tag=sl.inv33] if entity @s[nbt=!{Inventory:[{Slot:33b}]}] run function schmig.slotlocker.main:slots/inv33_give
execute as @a at @s if entity @s[tag=sl.inv33] if entity @s[nbt=!{Inventory:[{Slot:33b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv33_replace
execute as @a at @s if entity @s[tag=sl.inv33] if entity @s[nbt=!{Inventory:[{Slot:33b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv33_give
execute as @a at @s if entity @s[tag=!sl.inv33] if entity @s[nbt={Inventory:[{Slot:33b,tag:{sl.lock:1b}}]}] run item replace entity @s container.33 with air
execute as @a at @s if entity @s[tag=sl.inv34] if entity @s[nbt=!{Inventory:[{Slot:34b}]}] run function schmig.slotlocker.main:slots/inv34_give
execute as @a at @s if entity @s[tag=sl.inv34] if entity @s[nbt=!{Inventory:[{Slot:34b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv34_replace
execute as @a at @s if entity @s[tag=sl.inv34] if entity @s[nbt=!{Inventory:[{Slot:34b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv34_give
execute as @a at @s if entity @s[tag=!sl.inv34] if entity @s[nbt={Inventory:[{Slot:34b,tag:{sl.lock:1b}}]}] run item replace entity @s container.34 with air
execute as @a at @s if entity @s[tag=sl.inv35] if entity @s[nbt=!{Inventory:[{Slot:35b}]}] run function schmig.slotlocker.main:slots/inv35_give
execute as @a at @s if entity @s[tag=sl.inv35] if entity @s[nbt=!{Inventory:[{Slot:35b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv35_replace
execute as @a at @s if entity @s[tag=sl.inv35] if entity @s[nbt=!{Inventory:[{Slot:35b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv35_give
execute as @a at @s if entity @s[tag=!sl.inv35] if entity @s[nbt={Inventory:[{Slot:35b,tag:{sl.lock:1b}}]}] run item replace entity @s container.35 with air
execute as @a at @s if entity @s[tag=sl.inv-106] if entity @s[nbt=!{Inventory:[{Slot:-106b}]}] run function schmig.slotlocker.main:slots/inv-106_give
execute as @a at @s if entity @s[tag=sl.inv-106] if entity @s[nbt=!{Inventory:[{Slot:-106b,tag:{sl.lock:1b}}]}] run function schmig.slotlocker.main:slots/inv-106_replace
execute as @a at @s if entity @s[tag=sl.inv-106] if entity @s[nbt=!{Inventory:[{Slot:-106b,tag:{sl.lock:1b},Count:1b}]}] run function schmig.slotlocker.main:slots/inv-106_give
execute as @a at @s if entity @s[tag=!sl.inv-106] if entity @s[nbt={Inventory:[{Slot:-106b,tag:{sl.lock:1b}}]}] run item replace entity @s weapon.offhand with air
