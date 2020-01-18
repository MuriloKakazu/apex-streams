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

    public List<Object> asList(Type listType, Type elementType) {
        return (List<Object>) DynamicCollectionMarshaller.marshalToList(asList(), listType, elementType);
    }

    public Set<Object> asSet(Type setType, Type elementType) {
        return (Set<Object>) DynamicCollectionMarshaller.marshalToSet(asSet(), setType, elementType);
    }
}
