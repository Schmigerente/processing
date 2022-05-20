//soll 5500 - 5600

int attack_damage = 2893;
int[] attack_damage_boost_percent = {100 , 5, 3};
int crit_damage = 180;
int skillup_percent = 30;
int[] crit_damage_boost_percent = {100, 5};
int multiplier_percent = 68;
int hit_multiplier;
double defense = 800;
Boolean defense_break = false;
Boolean ignore_defense = true;

void setup() {


  int dmg = raw_damage(attack_damage, crit_damage, 0);
  for (int i : range(dmg)) {

  }
  exit();
}

void draw() {
  
}

int[] range(int dmg) {
  int[] r = {(int)(dmg*0.98), (int)(dmg*1.02)};
  return 
}

double defense (int def, boolean ign_def, boolean def_brk) {
  return 1000.0/(1140.0 + 3.5*(def_brk ? 0.3 : 1)*(ign_def ? 0 : def));
}

double raw_damage(int atd, int cd, int mul_p, int skl_p, boolean crit) {
  return crit ? atd * (mul_p * (100 + cd + skl_p))/10000.0 : atd * (mul_p * (100 + skl_p))/10000.0;
}

double sum_percent(int[] arr) {
  int sum = 0;
  for (int i : arr) {
    sum += i;
  }
  return sum/100.0;
}
