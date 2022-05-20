int[] matrix = {1, 2, 3, 4, 5, 6, 7, 8, 9};
int count = 0;
int total = 0;

void setup() {
  Permutation perm = new Permutation (matrix);
  for (int i = 0; i < fac(matrix.length); i++) {
    total++;
    if (check1(matrix)) {
      count++;
      printMatrix(matrix);
    }
    perm.next();
  }
  println(count + " of " + total);
  exit();
}

void printMatrix(int[] m) {
  for (int i = 0; i<m.length; i++) {
    print(m[i] + (i%3==2?"\n":" "));
  }
  println();
}

void printArray(int[] m) {
  for (int i = 0; i<m.length; i++) {
    print(m[i] + (i<m.length-1?",":""));
  }
  println();
}

int fac(int n) {
  return n * (n > 1 ? fac (n-1) : 1);
}

boolean check1(int[] m) {
  for (int i = 0; i < m.length; i++) {
    if (i <= 2 || i%3==0) {
      continue;
    }
    if (m[i] > m[i-1]) {
      continue;
    }
    if (m[i] > m[i-3]) {
      continue;
    }

    return false;
  }
  return true;
}

boolean check2(int[] m) {
  for (int i = 0; i < m.length; i++) {

    if (((i <= 2) || (m[i] > m[i-3])) &&
      ((i%3 == 0) || (m[i] > m[i-1]))) {
      continue;
    }
    return false;
  }
  return true;
}
