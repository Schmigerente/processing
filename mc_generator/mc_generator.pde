import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;

String name_space = "weapon_parts";

String func = "give @s clock{display:{Name:'{\"text\":\"%s\"}'},CustomModelData:%d,type:\"%s\"} 1";
String revoke = "advancement revoke @s only %s:%s";
String recipe = "recipe take @s %s:%s";
String clear = "clear @s minecraft:knowledge_book 1";
String advancement = "{\r\n\t\"criteria\": {\r\n\t\t\"_\": {\r\n\t\t\t\"trigger\": \"minecraft:recipe_unlocked\",\r\n\t\t\t\"conditions\": {\r\n\t\t\t\t\"recipe\": \"%s:%s\"\r\n\t\t\t}\r\n\t\t}\r\n\t},\r\n\t\"rewards\": {\r\n\t\t\"function\": \"%s:give/%s\"\r\n\t}\r\n}";
String dirS = "D:/Server/mapmaking -@stable/world/datapacks/weapon_parts.zip/data/weapon_parts/recipes";

int i = 66000;

void setup() {
  File dir = new File(dirS);
  for (File f : dir.listFiles()) {
    String name = f.getName().replace(".json","");
    String s = String.format(advancement, name_space,name,name_space,name);
    saveStrings("advancements/" + name + ".json", s.split("\r\n"));
    saveStrings("functions/give/" + name + ".mcfunction", new String[] {String.format(func, "XXX" + name + "XXX", i, name), String.format(revoke, name_space, name), String.format(recipe, name_space, name), clear});
    i++;
  }
  exit();
}
