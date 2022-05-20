String formatize(long i, int l) {
    String r = "0000000000000000" + i;
    return r.substring(r.length() - l, r.length());
  }

  String toRomanNumber(int number) {
    return join(generateArray(number), "")
      .replace("IIIII", "V")
      .replace("IIII", "IV")
      .replace("VV", "X")
      .replace("VIV", "IX")
      .replace("XXXXX", "L")
      .replace("XXXX", "XL")
      .replace("LL", "C")
      .replace("LXL", "XC")
      .replace("CCCCC", "D")
      .replace("CCCC", "CD")
      .replace("DD", "M")
      .replace("DCD", "CM");
  }

private String[] generateArray(int number) {
  String[] stringArray = new String[number];
  for (int i = 0; i < stringArray.length; i++) {
    stringArray[i] = "I";
  }
  return stringArray;
}

String encodeDate(File file) {
  Date date = new Date(file.lastModified());
  return encodeDate(date.getYear(), date.getMonth(), date.getDay(), date.getHours(), date.getMinutes());
}

int[] decodeDate(String hex) {
  int value = unhex(hex);
  return new int[] {(value >> 20) & 4095, (value >> 16) & 15, (value >> 11) & 31, (value >> 6) & 31, (value) & 63};
}

String encodeDate(int year, int month, int day, int hour, int minute) {
  int value = ((year%4096) << 20) | (month << 16) | ( day << 11 ) | ( hour << 6 ) | minute;
  return hex(value);
}

public String encodeFileSize(File file) {
  return encodeFileSize(file, 0);
}

public String encodeFileSize(File file, int i) {
  Path p = Paths.get(file.getPath());
  long size = i;
  try {
    size += Files.size(p);
  } catch (IOException e) {
    e.printStackTrace();
    size = 0;
  }
  return hex((int)(size%(16*16*16)), 3);
}
