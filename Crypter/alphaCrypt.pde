public class AlphaCrypt extends Crypt {
  
  public AlphaCrypt() {}
  
  public String encode(String string) {
    String out = "";
    for (char c : string.toCharArray()) {
      out += convert((convert(c)+5)%alphabet.length());
    }
    return out;
  }
  
  public String decode(String string) {
    String out = "";
    for (char c : string.toCharArray()) {
      out += convert((convert(c)-5+alphabet.length())%alphabet.length());
    }
    return out;
  }
}
