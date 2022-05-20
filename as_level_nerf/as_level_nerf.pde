import java.util.HashMap;
import java.util.Map;

private static int LEVEL_CAP = 100;
private Map<Integer, Long> totalExpLevelRequired = new HashMap<>();
int c = 100;

void setup() {
    ensureLevels();
    //newCurve();
    exit();
}

void newCurve() {
    long sum = 0;
    for (long i = 1; i <= LEVEL_CAP; i++) {
        //double exp = (c/pow(x,-0.2))*log(x*x*x*x);
        long prev = totalExpLevelRequired.getOrDefault(i - 1, 0L);
        long exp = 200*((i*i-i)/2);
        sum += exp;
        println(sum+exp);
    }
}

private void ensureLevels() {
    if (totalExpLevelRequired.isEmpty()) {
        for (int i = 1; i <= LEVEL_CAP; i++) {
            long prev = totalExpLevelRequired.getOrDefault(i - 1, 0L);
            long exp = prev + 150L + (Math.round(Math.pow(i + 1, 2)));
            println(i + " | " + (exp));
            totalExpLevelRequired.put(i, exp);
        }
    }
}
