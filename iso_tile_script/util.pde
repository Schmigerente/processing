import java.io.*;
import java.nio.*;
import java.util.*;


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
