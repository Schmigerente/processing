int max = 100;
int cap = (int)sqrt(max)+1;
int[] ints;
int index = 2;
int value = 4;
int perCol = 20;

void setup() {
  frameRate(10);
  if (max >= 10000) {
    max = 9999;
  }
  ints = new int[max];
  for (int i = 0; i < max; i++) {
    ints[i] = i+1;
  }
  emptyPrint();
  printList();
  ints[0] = -1;
}

void draw() {
  if ((index*index) < max) {
    if (value <= max) {
      ints[value-1] = -1;
      value += index;
    } else {
      index++;
      value = 2*index;
    }
    emptyPrint();
    printList();
  } else
    noLoop();
}

void emptyPrint() {
  for (int i = 0; i < 20; i++) {
    println("");
  }
}

void printList() {
  for (int i = 0; i < max; i++) {
    if (ints[i] < 1) {
      print("    ");
    } else {

      if (ints[i] < 10) {
        print(" ");
      }
      if (ints[i] < 100) {
        print(" ");
      }
      print(" " + (ints[i]));
    }
    if (i%perCol == perCol-1) {
      println("");
    }
  }
}
