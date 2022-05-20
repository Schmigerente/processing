class ImageWrapper {
    
    private String imagePath;
    private PImage preview;
    
    public ImageWrapper(String path) {
        this.imagePath = path;
        this.preview = loadImage(path);
        scalePreview();
    }
    
    public PImage getImage() {
        return loadImage(imagePath);
    }
    
    public PImage getPreview() {
        return preview;
    }
    
    private void scalePreview() {
        preview.resize(100, (int)((100.0*preview.width)/preview.height));
    }
    
}

void loadFiles() {
    images = new LinkedList<ImageWrapper>();
    for (String name : files) {
        String fileWithPath = "files/" + name;
        println(fileWithPath);
        try {
        images.add(new ImageWrapper(fileWithPath));
        } catch (NullPointerException e) {
            e.printStackTrace();
            exit();
        }
    }
    println("files loaded successfully");
}
