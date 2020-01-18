public class DynamicStreamFilter {
    
    private DynamicStream stream;
    
    public DynamicStreamFilter(DynamicStream stream) {
        this.stream = stream;
    }

    public DynamicStream keeping(DynamicPredicate predicate) {
        List<Dynamic> filtered = new List<Dynamic>();

        for (Dynamic dynamic : stream.collect().asList()) {
            if (predicate.apply(dynamic)) {
                filtered.add(dynamic);
            }
        }

        return DynamicStream.of(filtered);
    }

    public DynamicStream removing(DynamicPredicate predicate) {
        List<Dynamic> filtered = new List<Dynamic>();

        for (Dynamic dynamic : stream.collect().asList()) {
            if (!predicate.apply(dynamic)) {
                filtered.add(dynamic);
            }
        }

        return DynamicStream.of(filtered);
    }

    public DynamicStreamFieldFilter field(String fieldName) {
        return new DynamicStreamFieldFilter(stream, fieldName);
    }
}
