E[] exp = new E[10000];

void setup() {
    int c = 0;

    for (int i = 0; i < exp.length; i++) {
        E e = new E(23);
        if (e.run().getResult()) {
            c++;
        }
        
    }
    println((1.0*c)/exp.length);
    exit();
}

class E {

    B[] arr;
    private boolean hasRun = false;
    private boolean result;
    private boolean hasResult = false;
    private int s;

    public E (int s) {
        this.s = s;
        arr = new B[s];
    }

    public E run() {
        if (!hasRun) {
            for (int i = 0; i < s; i++) {
                arr[i] = new B();
            }
        }
        return this;
    }

    public boolean getResult() {
        if (hasResult) {
            return result;
        }
        for (int i = 0; i < s-1; i++) {
            for (int j = i+1; j < s; j++) {
                if (arr[i].b == arr[j].b) {
                    result = hasResult = true;
                    return result;
                }
            }
        }

        result = false;
        hasResult = true;
        return false;
    }
}

class B {
    public final int b;

    public B() {
        this.b = 1+(int)random(365);
    }
}
