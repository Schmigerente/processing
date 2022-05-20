String command = "execute if entity @p[nbt={Inventory:[{Slot: -106b, id: \"%s\", Count: 1b}]}] at @e[type=endermite,limit=1] run summon minecraft:falling_block ~0.0001 ~0.0001 ~0.0001 {Time:-1000000,NoGravity:1,BlockState:{Name:\"%s\"}}";
String[] blocks = {"minecraft:stone","minecraft:granite","minecraft:polished_granite","minecraft:diorite","minecraft:polished_diorite","minecraft:andesite","minecraft:polished_andesite","minecraft:deepslate","minecraft:cobbled_deepslate","minecraft:polished_deepslate","minecraft:calcite","minecraft:tuff","minecraft:dripstone_block","minecraft:grass_block","minecraft:dirt","minecraft:coarse_dirt","minecraft:podzol","minecraft:rooted_dirt"};

void setup() {
    String[] commands = new String[blocks.length];
    for (int i = 0; i < blocks.length; i++) {
        commands[i] = String.format(command, blocks[i], blocks[i]);
    }
    saveStrings("summon.mcfunction", commands);
    exit();
}
