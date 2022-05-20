







class Set {

    public Set exclude(Set s) {
        return s;
    }

    public Set cut(Set s) {
        return s;
    }

    public Set unite(Set s) {
        return s;
    }
    
    public Set copy() {
        return this;
    }
}

class SetElement<T> {

    private final String identifier;
    private T element;

    public SetElement(String identifier, T element) {
        this.identifier = identifier;
        this.element = element;
    }

    public String getIdentifier() {
        return identifier;
    }

    public T getElement() {
        return element;
    }
}
