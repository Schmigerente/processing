long[] keys = {2,3,5,7,11,13,17,19,23,29,31,37,43,47,53};

void setup() {
    PrimeQueue q = new PrimeQueue();
    for (int i = 0; i < 10; i++) {
        println(q.popFront());
    }
}

long[] decode (long l) {
    long[] ret = new long[keys.length];
    
    
    
    
    return ret;
}

long encode (long[] a) {
    long ret = 0;
    
    
    return ret;
}

class PrimeQueue {   
    long last = -1;
    
    private long findNext(long l) {
        
        if (l == -1)
            return 2;
        
        long it = 2;
        l++;
        while (it*it <= l) {
            if (l%it == 0) {
                l++;
                it = 2;
            } else {
                it++;
            }
        }
        return l;
    }
    
    
    long popFront() {
        last = findNext(last);
        return last;
    }
}
