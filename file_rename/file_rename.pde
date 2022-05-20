import java.io.*;
import java.nio.file.*;
import java.util.List;

Boolean renameSwitch = false;
Boolean segmentSwitch = true;
int segmentSize = 4;

List<File> dirs;
File directory;
String directoryPath = "D:/Pictures/rename";

void setup() {
  
  dirs = new ArrayList<File>();
  
  try {
    directory = new File(directoryPath);
  } 
  catch (Exception e) {
    e.printStackTrace();
    println("failed to load directory/images");
    return;
  }
  
  //splitFolder(directory, 100);
  
  execute(directory);


  exit();
  println("finished");
}

void execute(File parent) {
  dirs.add(parent);
  while(!dirs.isEmpty()) {
    rename(dirs.get(0));
    dirs.remove(0);
  }
}

void rename(File directory) {
  File[] images = directory.listFiles();
  for (File f : images) {
    if (f.isDirectory()) {
      dirs.add(f);
      continue;
    }
    String hashedName = f.lastModified() + formatize(f.length(), 11) + ".png";
    File newName = new File(directory.getPath() + File.separator + hashedName);
    f.renameTo(newName);
    println(hashedName);
  }
}

void splitFolder(File directory, int folderSize) {
  splitFolder(directory, directory.getName(), folderSize);
}

void splitFolder(File directory, String name, int folderSize) {
  File[] images = directory.listFiles();
  int i = 1;
  int folderCount = 1;

  for (File f : images) {
    File newDirectory = new File(directoryPath + File.separator + name + " " + toRomanNumber(folderCount));
    if (!newDirectory.exists()) {
      newDirectory.mkdirs();
    }

    Path target = Paths.get(newDirectory+File.separator+f.getName());
    Path source = Paths.get(directory+File.separator+f.getName());
    try {
      Files.copy(source, target);
      f.delete();
    } 
    catch (Exception e) {
    }
    println((i + 1 + folderCount*folderSize) + " | " + images.length + " - " + f.getName() + " >> " + newDirectory.getName());
    i = (i >= folderSize ? 1 : i + 1);
    folderCount += (i == 1 ? 1 : 0);
  }
  directory.delete();
}

void mergeFolder(File[] directories, String name) {
  File newDirectory = new File(directoryPath + File.separator + name);
  if (!newDirectory.exists()) {
    newDirectory.mkdirs();
  }
  for (File directory : directories) {
    File[] images = directory.listFiles();
    for (File image : images) {
      println(image.getName());
      Path source = Paths.get(directoryPath+File.separator+directory.getName()+File.separator+image.getName());
      Path target = Paths.get(directoryPath+File.separator+name+File.separator+image.getName());
      try {
        Files.copy(source, target);
        image.delete();
      } catch (Exception e) {}
    }
  }
}


class DirectoryFilter implements FileFilter {
  public boolean accept(File file) {
    return file.isDirectory();
  }
}

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
