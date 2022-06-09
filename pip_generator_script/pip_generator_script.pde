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
