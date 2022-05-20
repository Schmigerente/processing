import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;

String dirPath = "D:/Pictures/combine";

File directory;
File config;
File[] files;
JSONObject dataFile;

void setup() {
  size(100, 100);
  background(0); 
  directory = new File(dirPath);
  files = directory.listFiles(new DirectoryFilter());

  File[] images;
  for (File f : files) {
    images = f.listFiles();
    for (File i : images) {
      println(f.getName() + " | " + i.getName());
      Path source = Paths.get(dirPath+File.separator+f.getName()+File.separator+i.getName());
      Path target = Paths.get(dirPath+File.separator+i.getName());
      try {
        Files.copy(source, target);
        i.delete();
      } 
      catch (Exception e) {
      }
    }
    f.delete();
  }


  println("done loading");
  exit();
}

class DirectoryFilter implements FileFilter {
  public boolean accept(File file) {
     return file.isDirectory();
  }
}
