public class DynamicFieldPredicates {

    private abstract class SimpleComparison implements DynamicPredicate {

        protected String field { get; private set; }
        protected Object comparingValue { get; private set; }

        public SimpleComparison(String field, Object comparingValue) {
            this.field = field;
            this.comparingValue = comparingValue;
        }

        public abstract Boolean apply(Dynamic dynamic);
    }

    public class IsIn implements DynamicPredicate {

        protected String field { get; private set; }
        protected Set<Object> comparingSet { get; private set; }

        public IsIn(String field, Set<Object> comparingSet) {
            this.field = field;
            this.comparingSet = comparingSet;
        }

        public Boolean apply(Dynamic dynamic) {
            Object value = dynamic.get(field);
            return comparingSet.contains(value);
        }

    }

    public class Equals extends SimpleComparison {

        public Equals(String field, Object comparingValue) {
            super(field, comparingValue);
        }

        public override Boolean apply(Dynamic dynamic) {
            return ObjectComparer.compare(dynamic.get(field), comparingValue) 
                == Comparison.EQUALS;
        }

    }

    public class GreaterThan extends SimpleComparison {

        public GreaterThan(String field, Object comparingValue) {
            super(field, comparingValue);
        }

        public override Boolean apply(Dynamic dynamic) {
            return ObjectComparer.compare(dynamic.get(field), comparingValue)
                == Comparison.GREATER_THAN;
        }

    }

    public class LessThan extends SimpleComparison {

        public LessThan(String field, Object comparingValue) {
            super(field, comparingValue);
        }

        public override Boolean apply(Dynamic dynamic) {
            return ObjectComparer.compare(dynamic.get(field), comparingValue)
                == Comparison.LESS_THAN;
        }

    }

}
