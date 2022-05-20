void setup() {
  BArray arr = new BArray(10);
  arr.add(0);
  arr.add(1);
  arr.add(3);
  arr.add(3);
  arr.add(4);
  arr.add(5);
  arr.add(3);
  arr.add(6);
  arr.add(3);
  arr.add(8);
  printArray(arr);
  removeValue(arr, 3);
  println("-----------------------------");
  printArray(arr);
  println("-----------------------------");
  arr = new BArray(10);
  arr.add(0);
  arr.add(1);
  arr.add(2);
  arr.add(3);
  arr.add(4);
  arr.add(5);
  arr.add(6);
  arr.add(7);
  arr.add(8);
  arr.add(9);
  int[] indices = {2, 4, 5, 8};
  printArray(arr);
  removeIndices(arr, indices);
  println("-----------------------------");
  printArray(arr);
  
}

void removeIndices(BArray array, int[] indices) {
  int offset = 0;
  int index = 0;
  for (int i = 0; i < array.length; i++) {
    if (index < indices.length && i == indices[index]) {
      offset++;
      index++;   
    } else {
       array.data[i - offset] = array.data[i]; 
    }
    if (i >= array.length - indices.length) {
      array.data[i] = 0;
    }
  }
  array.length -= offset;
}

void removeValue(BArray array, int value) {
  int offset = 0;
  for (int i = 0; i < array.length; i++) {
    if (array.data[i] == value) {
      offset++;
    } else {
       array.data[i - offset] = array.data[i]; 
    }
    if (i >= array.length - offset - 1) {
      array.data[i] = 0;
    }
  }
  array.length -= offset;
}

void printArray(BArray array) {
  for (int i = 0; i < array.length; i++) {
    print(array.data[i] + " ");
  }
  println();
}


class BArray {
  int length;
  int data[];
  BArray (int capacity) {
    data = new int[capacity];
  }
  
  void add(int i) {
    data[length++] = i;
  }
}
