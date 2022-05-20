import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;

void setup() {size(400,400); frameRate(10);}
void draw() {
  background(255);
  //textMode(CENTER);
  text("Press \"Right\" to compile, \"Left\" to decompile!", 10, 10);
}

void mousePressed() {
  if(mouseButton == RIGHT) {
    toClipboard(compile(fromClipboard()));
    background(0,255,0);
    println("compiled");
  }
  if(mouseButton == LEFT) {
    toClipboard(decompile(fromClipboard()));
    background(255,255,0);
    println("decompiled");
  }
}

String decompile(String input) {
  int depth = 0;
  String output = "";
  String[] splitInput = input.split("(?<=\\)(?!\\,))|(?<=\\()|(?=\\))|(?<=\\,)|(?<=\\)\\,)");
  for(String line : splitInput) {
    if(line.contains(")")) {
      depth--;
    }
    for(int i = 0; i < depth; i++) {
      line = "\t" + line;
    }
    if(line.contains("(")) {
      depth++;
    }
    output += line + "\n";
  }
  return output;
}

String compile(String input) {
  return input.replace("\n","").replace("\r\n","").replace("\t","").replace(" ","");
}

void toClipboard(String c) {
  StringSelection selection = new StringSelection(c);
  Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
  clipboard.setContents(selection, selection);
}

String fromClipboard() {
  return (String) getFromClipboard(DataFlavor.stringFlavor);
}

Object getFromClipboard (DataFlavor flavor) {
  Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard(); 
  Transferable contents = clipboard.getContents(null);
  Object object = null;
  if (contents != null && contents.isDataFlavorSupported(flavor))
  {
    try
    {
      object = contents.getTransferData(flavor);
    }
    catch (UnsupportedFlavorException e1) {}
    catch (java.io.IOException e2) {}
  }
  return object;
} 
