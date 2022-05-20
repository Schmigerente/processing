String path;

//0-58

String[] slot_table;
String[] name_table;
String[] inv_table;

String slot = "execute as @a at @s if entity @s[tag=sl.%2$s] if entity @s[nbt={%3$s:[{Slot:%1$s}]}] if entity @s[nbt=!{%3$s:[{Slot:%1$s,tag:{sl.lock:1b}}]}] run summon item ~ ~ ~ {Age:0,PickupDelay:20,Item:{id:\"minecraft:bedrock\",Count:1b,tag:{sl.replace:1b,sl.slot:%1$s}}}§cexecute as @a at @s if entity @s[tag=sl.%2$s] if entity @s[nbt={%3$s:[{Slot:%1$s}]}] if entity @s[nbt=!{%3$s:[{Slot:%1$s,tag:{sl.lock:1b}}]}] run data modify entity @e[type=minecraft:item,limit=1,sort=nearest,nbt={Item:{tag:{sl.replace:1b}}}] Item set from entity @s %3$s[{Slot:%1$s}]§cexecute as @a at @s if entity @s[tag=sl.%2$s] if entity @s[nbt=!{%3$s:[{Slot:%1$s,tag:{sl.lock:1b},Count:1b}]}] run item replace entity @s %2$s with minecraft:red_stained_glass_pane{display:{Name:'{\"text\":\"locked\",\"color\":\"red\"}'},HideFlags:127,CustomModelData:99999,sl.lock:1b}§cexecute as @a at @s if entity @s[tag=!sl.%2$s] if entity @s[nbt={%3$s:[{Slot:%1$s,tag:{sl.lock:1b}}]}] run item replace entity @s %2$s with air§c§n";
String slot_armor = "execute as @a at @s if entity @s[tag=sl.%2$s] if entity @s[nbt={%3$s:[{Slot:%1$s}]}] run summon item ~ ~ ~ {Age:0,PickupDelay:20,Item:{id:\"minecraft:bedrock\",Count:1b,tag:{sl.replace:1b,sl.slot:%1$s}}}§cexecute as @a at @s if entity @s[tag=sl.%2$s] if entity @s[nbt={%3$s:[{Slot:%1$s}]}] run data modify entity @e[type=minecraft:item,limit=1,sort=nearest,nbt={Item:{tag:{sl.replace:1b}}}] Item set from entity @s %3$s[{Slot:%1$s}]§cexecute as @a at @s if entity @s[tag=sl.%2$s] if entity @s[nbt={%3$s:[{Slot:%1$s}]}] run item replace entity @s %2$s with minecraft:air§c§n";
String kill = "kill @e[type=item,nbt={Item:{tag:{sl.lock:1b}}}]§c§n";

String replaceFilename = "inv%s_replace.mcfunction";
String giveFilename = "inv%s_give.mcfunction";

void setup() { 
    path = loadStrings("config.txt")[0] + "\\";
    name_table = loadStrings("config.txt")[1].split("§c");
    slot_table = loadStrings("config.txt")[2].split("§c");
    inv_table = inv_table();
    
    gen_remove();
    gen_main();    
    gen_update();
    exit();
}

void gen_main() {
    String s = "";
    for (int i = 0; i < 59; i++) {
        s += String.format("tag @a[tag=!sl.%2$s] add sl.%2$s§c", slot_table[i], name_table[i], inv_table[i]);
        
    }
    String[] arr = s.replace("§n", " §c").split("§c");
    saveStrings(path + "main.mcfunction", arr);
}

void gen_remove() {
    String s = "";
    for (int i = 0; i < 59; i++) {
        s += String.format("tag @a[tag=sl.%2$s] remove sl.%2$s§c", slot_table[i], name_table[i], inv_table[i]);
    }
    String[] arr = s.replace("§n", " §c").split("§c");
    saveStrings(path + "remove.mcfunction", arr);
}

void gen_update () {
    String s = kill;
    for (int i = 0; i < 59; i++) {
        if (i > 36 && i < 41) {
            s += String.format(slot_armor, slot_table[i], name_table[i], inv_table[i]);
        } else {
            s += String.format(slot, slot_table[i], name_table[i], inv_table[i]);
        }
    }
    String[] arr = s.replace("§n", " §c").split("§c");
    saveStrings(path + "update.mcfunction", arr);
}

String[] inv_table() {
    String[] arr = new String[slot_table.length];
    for (int i = 0; i < slot_table.length; i++) {
        arr[i] = name_table[i].contains("ender") ? "EnderItems" : "Inventory";
    }
    
    return arr;
}
