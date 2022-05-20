import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;

int nodeCount = 20;
int weight = 40;

String[] nodes = new String[nodeCount];

void setup() {
  int edgeCount = 0;
  String result = "";
  for (int i = 0; i < nodes.length; i++) {
    nodes[i] = toAlphabeticRadix(i);
  }
  for (int i = 0; i < nodes.length -1; i++) {
    for (int j = i+1; j < nodes.length; j++) {
      if(random(100) < weight) {
        edgeCount++;
        if (!result.equals("")) {
          result += ";";
        }
        if (i == 0 || i == nodes.length -1 || j < nodes.length || random(2) < 1 ) {
          result += (nodes[i] + (200+(int)random(200)) + nodes[j]);
        } else {
          result += (nodes[j] + (200+(int)random(200)) + nodes[i]);
        }
      }
    }
  }
  result = "add X " + result + "\nflow X a " + toAlphabeticRadix(nodeCount-1) + "\n\nNodes: " + (nodeCount-1) + "\nEdges: " + edgeCount;
  toClipboard(result);
  exit();
}

public static String toAlphabeticRadix(int num) {
    char[] str = Integer.toString(num, 26).toCharArray();
    for (int i = 0; i < str.length; i++) {
        str[i] += str[i] > '9' ? 10 : 49;
    }
    return new String(str);
}

void toClipboard(String c) {
  StringSelection selection = new StringSelection(c);
  Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
  clipboard.setContents(selection, selection);
}
