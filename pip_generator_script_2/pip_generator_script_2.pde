import java.util.*;

void setup() {
    int i = 0;
    String[] s = new String[61];
    for (int a = 0; a < 9; a++) {
        for (int b = 0; b < 9; b++) {
            for (int c = 0; c < 9; c++) {
                if (a + b + c ==12) {
                    String t = a + "" + b + "" + c;
                    s[i++] = t;
                }
            }
        }
    }
    saveStrings("out.txt", s);
    exit();
}

class Config {
    
    public final String path;
    
    private String ident;
    private int[] config;
       
    private Config(int[] c, Map<String, Config> map) {
        this(c, map, "", 0);
    }
    
    private Config(int[] c, Map<String, Config> map, String p, int m) {
        this.ident = c[0] + "" + c[1] + "" + c[2];
        this.path = p + pathAppend(m);
        this.config = getConfig(c, m);
        map.put(ident, this);
    }
    
    private int[] getConfig(int[] base, int mod) {
        return base;
    }
    
    private String pathAppend(int mod) {
        if (mod == 1)
            return "L";
        if (mod == 2)
            return "U";
        if (mod == 3)
            return "R";
        return "";
    }
    
    public void generateChilds() {
        
    }
    
    public Config getDefault(Map<String, Config> map) {
        return new Config(new int[] {4, 4, 4}, map);
    }
    
}
