


void setup() {
    run();
    exit();
}

void run() {
    println(countPartitions(9,5));
}

int countPartitions(int n, int m) {
    if (n == 0) {
        return 1;
    } else if (m == 0 || n < 0) {
        return 0;
    } else {
        return countPartitions(n-m,m) + countPartitions(n,m-1);
    }
}
