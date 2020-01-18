public class DynamicStreamCollector {

    private DynamicStream stream;

    public DynamicStreamCollector(DynamicStream stream) {
        this.stream = stream;
    }

    public List<Dynamic> asList() {
        return new List<Dynamic>(stream.getElements());
    }

    public Set<Dynamic> asSet() {
        return new Set<Dynamic>(stream.getElements());
    } 

    public List<Object> asListOf(Type elementType) {
        return DynamicCollectionMarshaller.marshalToList(asList(), elementType);
    }
}
