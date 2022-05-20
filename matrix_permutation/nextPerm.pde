class Permutation {
  
  private int[] data;
  
  public Permutation (int[] data) {
    this.data = data;
  }
  
  public int[] next() {
    
    if (data.length <= 1) {
      return get();
    }
    
    int last = data.length - 2;
    
    while (last >= 0) {
            if (data[last] < (data[last + 1])) {
                break;
            }
            last--;
        }
  
        // If there is no increasing pair
        // there is no higher order permutation
        if (last < 0)
            return get();
  
        int nextGreater = data.length - 1;
  
        // Find the rightmost successor to the pivot
        for (int i = data.length - 1; i > last; i--) {
            if (data[i] > data[last]) {
                nextGreater = i;
                break;
            }
        }
  
        // Swap the successor and the pivot
        swap(data, nextGreater, last);
  
        // Reverse the suffix
       reverse(data, last + 1, data.length - 1);
    
    return get();
  }
  
  public int[] get() {
    return data;
  }
  
  /**
  *
  */
  private void reverse (int[] sub, int left, int right) {
    while(left < right) {
      swap (sub, left++, right--);
    }
  }
  
  private void swap (int[] sub, int i, int j) {
    int temp = sub[i];
    sub[i] = sub[j];
    sub[j] = temp;
  }
  
}
