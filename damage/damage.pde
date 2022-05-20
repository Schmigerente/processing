
void setup() {
  

  float damage = 100;
  float dealingBias = 10;
  float receicingBias = 5;
  for (int darkness = 1; darkness <= 10; darkness++) {
    PrintWriter result = createWriter("results_" + darkness + ".txt");
    for (int light = 1; light <= 10; light++) {
      result.print("light: " + light);
      result.print(" | Damage (dealing)  : ");
      result.println(floor(max(min(pow(light/darkness, dealingBias), 1), 0)*damage)*0.01);

      result.print("light: " + light);
      result.print(" | Damage (receiving): ");
      result.println(floor(max(min(pow(darkness/light, receicingBias), 25), 0.75)*damage)*0.01);

      result.println();
    }
    result.flush();
    result.close();
  }
  exit();
}
