public class DynamicStreamFieldFilter {

    private String field;
    private DynamicStream stream;

    public DynamicStreamFieldFilter(DynamicStream stream, String field) {
        this.stream = stream;
        this.field = field;
    }

    public DynamicStream equals(Object value) {
        return stream.filter().keeping(new DynamicFieldPredicates.Equals(field, value));
    }

    public DynamicStream notEquals(Object value) {
        return stream.filter().removing(new DynamicFieldPredicates.Equals(field, value));
    }

    public DynamicStream greaterThan(Object value) {
        return stream.filter().keeping(new DynamicFieldPredicates.GreaterThan(field, value));
    }

    public DynamicStream lessThan(Object value) {
        return stream.filter().keeping(new DynamicFieldPredicates.LessThan(field, value));
    }

    public DynamicStream greaterThanOrEquals(Object value) {
        return greaterThan(value).join(equals(value));
    }

    public DynamicStream lessThanOrEquals(Object value) {
        return lessThan(value).join(equals(value));
    }

    public DynamicStream isIn(Set<Object> collection) {
        return stream.filter().keeping(new DynamicFieldPredicates.IsIn(field, collection));
    }

    public DynamicStream isNotIn(Set<Object> collection) {
        return stream.filter().removing(new DynamicFieldPredicates.IsIn(field, collection));
    }

    public DynamicStream isNull() {
        return equals(null);
    }

    public DynamicStream hasValue() {
        return notEquals(null);
    }
}
