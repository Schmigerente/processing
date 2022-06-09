import java.util.List;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;

public final String startDirectory = "D:\\";
Writer writer = new Writer();


void setup() {
  File f = new File(startDirectory);
  list(f, 0);
  writer.save("file system2");
}

void list(File dir, int depth) {
  File[] files = dir.listFiles();
  try {
  for (File f : files) {
    if (!f.canRead()) {
      continue;
    }
    
    
    String out = "";
    for (int i = 0; i < depth; i++) {
      out += "\t";
    }
    println(f.getName());
    out += f.getName();
    writer.writeLine(out);
    if (f.isDirectory()) {
      list(f, depth + 1);
    }
  }
  } catch (NullPointerException e) {
    e.printStackTrace();
  }
  exit();
}

class Writer {
  List<String> buffer;
  int linehead;
  
  public Writer() {
    buffer = new ArrayList<String>();
    linehead = 0;
    buffer.add("");
  }
  
  void write(String s) {
    write(linehead, s);
  }
  
  void write(int line, String s) {
    line = min(line, linehead);
    buffer.set(line, buffer.get(linehead) + s);
  }
  
  void writeLine(String s) {
    write(linehead, s);
    buffer.add("");
    linehead++;
  }
  
  void save(String name) {
    PrintWriter result = createWriter("data/" + name + ".txt");
    for (String s : buffer) {
      result.println(s);
    }
    result.flush();
    result.close();
  }
  
}
