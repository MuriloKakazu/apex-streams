public virtual class DynamicStream {

    public static DynamicStream of(List<Object> collection) {
        return new DynamicStream(collection);
    }

    public static DynamicStream of(Set<Object> collection) {
        return DynamicStream.of(new List<Object>(collection));
    }

    private List<Dynamic> elements = new List<Dynamic>();

    private DynamicStream() { }

    private DynamicStream(List<Object> collection) {
        for (Object element : collection) {
            add(element);
        }
    }

    public List<Dynamic> getElements() {
        return new List<Dynamic>(elements);
    }

    public DynamicStream add(Object obj) {
        elements.add(new Dynamic(obj));
        return this;
    }

    public DynamicStream join(DynamicStream anotherStream) {
        return DynamicStream.of(CollectionUtil.join(this.getElements(), anotherStream.getElements()));
    }

    public DynamicStreamCollector collect() {
        return new DynamicStreamCollector(this);
    }
    
    public DynamicStreamFilter filter() {
        return new DynamicStreamFilter(this);
    }

    public DynamicStreamPlucker pluck() {
        return new DynamicStreamPlucker(this);
    }

    public DynamicStreamAggregator group() {
        return new DynamicStreamAggregator(this);
    }

}
