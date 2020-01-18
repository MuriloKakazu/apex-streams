public class DynamicStreamPlucker {

    private DynamicStream stream;

    public DynamicStreamPlucker(DynamicStream stream) {
        this.stream = stream;
    }

    public Set<Id> ids(String field) {
        Set<Id> plucked = new Set<Id>();

        for (Dynamic dynamic : stream.collect().asList()) {
            plucked.add((Id) dynamic.get(field));
        }

        return plucked;
    }

    public Set<String> strings(String field) {
        Set<String> plucked = new Set<String>();

        for (Dynamic dynamic : stream.collect().asList()) {
            plucked.add((String) dynamic.get(field));
        }

        return plucked;
    }

    public Set<Boolean> booleans(String field) {
        Set<Boolean> plucked = new Set<Boolean>();

        for (Dynamic dynamic : stream.collect().asList()) {
            plucked.add((Boolean) dynamic.get(field));
        }

        return plucked;
    }

    public Set<Date> dates(String field) {
        Set<Date> plucked = new Set<Date>();

        for (Dynamic dynamic : stream.collect().asList()) {
            plucked.add((Date) dynamic.get(field));
        }

        return plucked;
    }

    public Set<Time> times(String field) {
        Set<Time> plucked = new Set<Time>();

        for (Dynamic dynamic : stream.collect().asList()) {
            plucked.add((Time) dynamic.get(field));
        }

        return plucked;
    }

    public Set<DateTime> dateTimes(String field) {
        Set<DateTime> plucked = new Set<DateTime>();

        for (Dynamic dynamic : stream.collect().asList()) {
            plucked.add((DateTime) dynamic.get(field));
        }

        return plucked;
    }

    public Set<Decimal> decimals(String field) {
        Set<Decimal> plucked = new Set<Decimal>();

        for (Dynamic dynamic : stream.collect().asList()) {
            plucked.add((Decimal) dynamic.get(field));
        }

        return plucked;
    }

    public Set<Integer> integers(String field) {
        Set<Integer> plucked = new Set<Integer>();

        for (Dynamic dynamic : stream.collect().asList()) {
            plucked.add((Integer) dynamic.get(field));
        }

        return plucked;
    }
}
