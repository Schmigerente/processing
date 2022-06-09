int MAX = 6000;

void setup() {

    String[] strings = new String[MAX];
    for (int i = 0; i < strings.length; i++) {
        println(i / (MAX/100) + "%");
        for (int j = (int)random(MAX); j >= 0; j--) {
            strings[i] += randString(12) + ";";
        }
    }
    saveStrings("table.csv", strings);
    exit();
}

String randString(int length) {
    String s = "";
    for (int i = 0; i < length; i++) {
        s += (char)(random(26)+97);
    }
    
    return s;
}
