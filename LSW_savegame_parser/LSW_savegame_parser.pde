 String file = "save#.bin";

void setup() {
  PrintWriter result = createWriter("differences.txt");
  result.println("ADDRESS    00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F   00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F");
  
  byte[] file1 = loadBytes(file.replace("#","3"));
  byte[] file2 = loadBytes(file.replace("#","4"));
  
  for (int i = 0; i < 2535; i++) {
    for (int j = 0; j < 16; j++) {  
      if (file1[i*16+j] != file2[i*16+j]) {
        String s1 = "";
        String s2 = "";
        for (int k = 0; k < 16; k++) {
          s1 += " " + hex(file1[i*16+k]);
          s2 += " " + hex(file2[i*16+k]);
        }
        result.println(hex(i*16) + "  " + s1 + "  " + s2);
        break;
      }
    }
  }
  result.flush();
  result.close();
  println("done!");
}
