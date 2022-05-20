import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;

List<File> workSet;
String dir_name = "C:\\Users\\Nils Matt\\Desktop\\minecraft\\recipes";

String[] empty = {};

void setup() {
    create();
    exit();
}

void create() {
    File dir = new File(dir_name);
    for (File f : dir.listFiles()) {
        saveStrings("recipes/" + f.getName(), empty);
    }
}

class DirectoryFilter implements FileFilter {
  public boolean accept(File file) {
     return file.isDirectory();
  }
}
