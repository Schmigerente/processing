import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Clipboard;

int max_level = 200;
int[] xp = new int[max_level-1];

String out = "";
final String sep = ";";
final String endl = "\n";

void setup() {
  xp[0] = 10;
  xp[1] = 20;
  for (int i = 2; i < max_level - 1; i++) {
    xp[i] = 2*xp[i-1] - xp[i-2] + 10*(1+i/10);
  }
  for (int i = 0; i < max_level - 1; i++) {
    out += i + sep + xp[i] + sep + "0" + endl;
  }
  toClipboard(out);
  println("done");
  exit();
}

void toClipboard(String c) {
  StringSelection selection = new StringSelection(c);
  Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
  clipboard.setContents(selection, selection);
}
