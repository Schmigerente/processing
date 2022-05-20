
void setup() {
  PrintWriter result = createWriter("results.txt");
  for(int i = 2; i <= 100; i++) {
    println("Base: " + i);
    result.println("Base: " + i);
    for (int j = 1; j <= i*i*10; j++) {
      number n = new number(j, i);
      number c = n.crossTotal();
      if(n.equals(c)) {
        result.println("DEZ: " + n.getLong() + " Base" + n.base + ": " + n.toString() + " Cross-Sum: " + c.toString());
      }
      println("DEZ: " + n.getLong() + " Base" + n.base + ": " + n.toString() + " Cross-Sum: " + c.toString());
    }
  }
  result.flush();
  result.close();
}

class number {
  public int base;
  private ArrayList<Integer> digits = new ArrayList<Integer>();
  public int length;
  
  number(long dezValue, int base) {
    this.base = base;
    nextDigit(dezValue);
    this.length = digits.size();
  }
  
  private void nextDigit(long dezValue) {
    digits.add((int)dezValue%base);
    if(dezValue >= base) {
      nextDigit(dezValue/base);
    }
  }
  
  public long getLong() {
    long out = 0;
    for (int i = 0; i < digits.size(); i++) {
      out += (pow(base, i))*digits.get(i);
    }
    return out;
  }
  
  public int getDigit(int i) {
    return digits.get(i);
  }
  
  public number crossTotal() {
    long out = 0;
    for(int i : digits) {
      out += i;
    }
    return new number(out, base);
  }
  
  public String toString() {
    String out = "";
    for (int i = this.length-1; i >= 0; i--) {
      out += digits.get(i) + (i > 0 ? " " : "" );
    }
    return out;
  }
  
  public boolean equals(number n) {
    for (int i = 0; i < min(n.length, this.length); i++) {
      if(n.length != this.length || n.getDigit(i) != this.getDigit(i)) {
        return false;
      }
    }
    return true;
  }
}
