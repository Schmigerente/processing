class Tuple<T> {
  
  public final T x1;
  public final T x2;
  
  public Tuple(T x1, T x2) {
    this.x1 = x1;
    this.x2 = x2;
  }
  
  public T first() {
   return x1; 
  }
  
   public T second() {
   return x2; 
  }
}

public Tuple<Integer> translateToIndex(int x, int y, int count, int size, int xOffset, int yOffset) {
  return new Tuple((x-xOffset)*count/size, (y-yOffset)*count/size);
}

public boolean inRange(int x, int a, int b) {
  return x >= a && x <= b;
}

public int indexOf(Field element, List<Field> list) {
  for (int i = 0; i < list.size(); i++) {
    if (list.get(i) == element) {
      return i;
    }
  }
  return -1;
}
