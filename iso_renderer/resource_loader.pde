class ResourceLoader {
    
    //Defines the texture size to be used by the rendering and chunk baking
    public static final int TEXTURE_SIZE = 32;

    //defines the local directory path were block textures are stored
    private final String BLOCK_DIRECTORY = "data/blocks/";
    //defines the path of a default texture;
    //TODO replace path with generated image to replace file depencency
    private final String DEFAULT_TEXTURE =  BLOCK_DIRECTORY + "missing_t.png";

    private Map<String, PImage> images;
    //private MapyString, Soundfile> audio;

    /** creates a new Instance of ResourceLoader
    */
    public ResourceLoader() {
        images = new HashMap<String, PImage>();
        PImage missingT = loadImage(DEFAULT_TEXTURE);
        images.put("missing_t", missingT);
    }

    /** Returns the texture to a given key
    *   @return texture as PImage
    */  
    public PImage getImage(String key) {
        if (images.get(key) == null)
            importImage(key);
        return images.get(key);
    }

    //tries to load a block texture with the given key and stores it in the images map
    //if no texture was found, stores the default texture with the given key instead
    private void importImage(String key) {
        PImage loaded = loadImage(BLOCK_DIRECTORY + key + ".png");
        images.put(key, loaded == null ? images.get("missing_t") : loaded);
    }
}
