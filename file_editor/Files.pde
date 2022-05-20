public void copyFiles(File[] files, File targetDir) {
  for (File f : files) {
    Path source = Paths.get(f.getAbsolutePath());
    Path target = Paths.get(targetDir.getAbsolutePath() + File.separator + f.getName());
    try {
      Files.copy(source, target);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}

void rename(File directory) {
    File[] images = directory.listFiles();
    for (File f : images) {
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
  String directoryPath = directory.getAbsolutePath();
  File[] content = directory.listFiles();
  int i = 1;
  int folderCount = 1;

  for (File f : content) {
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
    i = (i >= folderSize ? 1 : i + 1);
    folderCount += (i == 1 ? 1 : 0);
  }
  directory.delete();
}

public void mergeDirectories(File[] dirs, File dir) {
  for (File d : dirs) {
    moveFiles(d.listFiles(), dir);
    d.delete();
  }
}

public void deleteFiles(File[] files) {
  for (File f : files) {
     f.delete();
  }
}

public void moveFiles(File[] files, File targetDir) {
  copyFiles(files, targetDir);
  deleteFiles(files);
}
