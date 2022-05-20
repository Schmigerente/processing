//public final String[] formatStrings = {"thermalfoundation:armor:plate_%s", "thermalfoundation:armor:helmet_%s", "thermalfoundation:armor:legs_%s", "thermalfoundation:armor:boots_%s", "thermalfoundation:armor:sword_%s", "thermalfoundation:armor:shovel_%s", "thermalfoundation:armor:pickaxe_%s", "thermalfoundation:armor:axe_%s", "thermalfoundation:armor:hoe_%s", "thermalfoundation:armor:bow_%s", "thermalfoundation:armor:ishing_rod_%s", "thermalfoundation:armor:shears%s", "thermalfoundation:armor:sickle_%s", "thermalfoundation:armor:hammer_%s", "thermalfoundation:armor:excavator_%s", "thermalfoundation:armor:shield_%s", };
//public final String[] materialList = {"tin", "copper", "silver", "lead", "nickel", "aluminum", "platinum", "steel", "electrum", "invar", "bronze", "constantan"};

public final String string = "{\"tool\":{\"item\":\"%s\"},\"material\":{\"%s\":\"%s\"}},";

public final String[] materialStrings = {"meteor"};
public final String[] itemStrings = {"nyx:%s_chest", "nyx:%s_helm", "nyx:%s_boots", "nyx:%s_pants", "nyx:%s_bow", "nyx:%s_hoe", "nyx:%s_hammer", "nyx:%s_sword", "nyx:%s_axe", "nyx:%s_pickaxe", "nyx:%s_shovel", };
public final String materialString = "nyx:%s_ingot";
    
public boolean oreDict = false;


void setup() {
    for (String s : materialStrings) {
        
        String mat = String.format(materialString, s);
        for (String t : itemStrings) {
            String item = String.format(t, s);
            println(String.format(string, item, oreDict ? "oreDict" : "item", mat));
        }
    }
    exit();
}

public String capitalize (String s) {
    return s.substring(0,1).toUpperCase() +  s.substring(1, s.length());
}
