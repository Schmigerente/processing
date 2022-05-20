float[] values = new float[1024]; 
sortType sorter = new bubble();

void setup() {
  size(1024, 512);
  values = shuffle(values);
}

void draw() {
  background(0);
  stroke(255);
  for(int i = 0; i < 1024; i++) {
    line(i,height-values[i]/2,i,height);
  }
}

float[] shuffle(float[] f) {
  for(int i = 0; i < 1024; i++) {
    values[i] = -1;
  }
  for(int i = 0; i < 1024; i++) {
    int j = (int)random(0, 1023);
    while(f[j] >= 0) {
      j=(j+1)%1024;
    }
    println("found free spot " + j + " for value " + i);
    f[j] = i;
  }
  return f;
}

abstract class sortType {}
