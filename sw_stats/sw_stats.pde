int grade;
int hp;
int atk;
int def;
int spd;

int[] values = {1482, 1647, 1812, 1977, 2142};
int[] values2 = {1482,1646,1647,1811,1812,1975,1976,1977,2140,2141,2142};

void setup() {
 for (int i = 0; i < values.length - 1; i++) {
   println(values[i+1]-values[i]);
 }
 exit(); 
}

int random(int lower, int upper) {
  return lower + (int)(Math.random()*(upper - lower + 1));
}
