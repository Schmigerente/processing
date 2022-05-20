import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;

String output = "";
long sum = 0;
int max_level = 200;

void setup() {
  size(1000, 500);
  for (int i = 0; i <= max_level; i++) {
    sum += min(i,100)*10;
    output += i + ";" + sum + ";0\n";
  }
  pasteToCLipboard(output);
  exit();
}

void pasteToCLipboard(String s) {
  StringSelection selection = new StringSelection(s);
  Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
  clipboard.setContents(selection, selection);
}
