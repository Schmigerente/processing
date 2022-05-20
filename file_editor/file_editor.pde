import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Date;

List<File> workSet;

File directory = null;

void setup() {

    selectFolder("Select a file to process:", "fileSelected");

    
}

void fileSelected(File selection) {
    if (selection != null) {
        directory = selection;
    }
    exit();
}

void doIt() {
    workSet = new ArrayList<File>();

    File dir = directory;
    String name = "20c80";

    for (File f : dir.listFiles()) {
        String fn = filename(f, name, 0);
        String path = f.getParent() + File.separator + fn;
        int c = 0;
        path = path.toLowerCase();
        println(path);
        while (!f.renameTo(new File(path))) {
            fn = filename(f, name, ++c);
            path = f.getParent() + File.separator + fn;
        }
        println(fn);
    }
}

public String filename(File file, String data, int i) {
    String size = encodeFileSize(file, i);
    String date = encodeDate(file);
    return data + date + size + ".png";
}

public void addDirsToWorkset(File[] dirs, List<File> t) {
    for (File f : dirs) {
        t.add(f);
    }
}

class DirectoryFilter implements FileFilter {
    public boolean accept(File file) {
        return file.isDirectory();
    }
}

class ImageFilter implements FileFilter {
    public boolean accept(File file) {
        return file.getName().endsWith(".png") || file.getName().endsWith(".jpg") || file.getName().endsWith(".webh") ;
    }
}
