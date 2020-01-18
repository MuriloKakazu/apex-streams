public class DynamicStreamAggregator {

    private DynamicStream stream;

    public DynamicStreamAggregator(DynamicStream stream) {
        this.stream = stream;
    }

    public Map<Id, List<Dynamic>> byIds(String field) {
        Map<Id, List<Dynamic>> grouped = new Map<Id, List<Dynamic>>();

		for (Dynamic dynamic : stream.collect().asList()) {
			Id key = (Id) dynamic.get(field);

			if (!grouped.containsKey(key)) {
				grouped.put(key, new List<Dynamic>());
			}

			grouped.get(key).add(dynamic);
		}

		return grouped;
    }

    public Map<String, List<Dynamic>> byStrings(String field) {
        Map<String, List<Dynamic>> grouped = new Map<String, List<Dynamic>>();

		for (Dynamic dynamic : stream.collect().asList()) {
			String key = (String) dynamic.get(field);

			if (!grouped.containsKey(key)) {
				grouped.put(key, new List<Dynamic>());
			}

			grouped.get(key).add(dynamic);
		}

		return grouped;
    }

    public Map<Boolean, List<Dynamic>> byBooleans(String field) {
        Map<Boolean, List<Dynamic>> grouped = new Map<Boolean, List<Dynamic>>();

		for (Dynamic dynamic : stream.collect().asList()) {
			Boolean key = (Boolean) dynamic.get(field);

			if (!grouped.containsKey(key)) {
				grouped.put(key, new List<Dynamic>());
			}

			grouped.get(key).add(dynamic);
		}

		return grouped;
    }

    public Map<Date, List<Dynamic>> byDates(String field) {
        Map<Date, List<Dynamic>> grouped = new Map<Date, List<Dynamic>>();

		for (Dynamic dynamic : stream.collect().asList()) {
			Date key = (Date) dynamic.get(field);

			if (!grouped.containsKey(key)) {
				grouped.put(key, new List<Dynamic>());
			}

			grouped.get(key).add(dynamic);
		}

		return grouped;
    }

    public Map<Time, List<Dynamic>> byTimes(String field) {
        Map<Time, List<Dynamic>> grouped = new Map<Time, List<Dynamic>>();

		for (Dynamic dynamic : stream.collect().asList()) {
			Time key = (Time) dynamic.get(field);

			if (!grouped.containsKey(key)) {
				grouped.put(key, new List<Dynamic>());
			}

			grouped.get(key).add(dynamic);
		}

		return grouped;
    }

    public Map<DateTime, List<Dynamic>> byDateTimes(String field) {
        Map<DateTime, List<Dynamic>> grouped = new Map<DateTime, List<Dynamic>>();

		for (Dynamic dynamic : stream.collect().asList()) {
			DateTime key = (DateTime) dynamic.get(field);

			if (!grouped.containsKey(key)) {
				grouped.put(key, new List<Dynamic>());
			}

			grouped.get(key).add(dynamic);
		}

		return grouped;
    }

    public Map<Decimal, List<Dynamic>> byDecimals(String field) {
        Map<Decimal, List<Dynamic>> grouped = new Map<Decimal, List<Dynamic>>();

		for (Dynamic dynamic : stream.collect().asList()) {
			Decimal key = (Decimal) dynamic.get(field);

			if (!grouped.containsKey(key)) {
				grouped.put(key, new List<Dynamic>());
			}

			grouped.get(key).add(dynamic);
		}

		return grouped;
    }

    public Map<Integer, List<Dynamic>> byIntegers(String field) {
        Map<Integer, List<Dynamic>> grouped = new Map<Integer, List<Dynamic>>();

		for (Dynamic dynamic : stream.collect().asList()) {
			Integer key = (Integer) dynamic.get(field);

			if (!grouped.containsKey(key)) {
				grouped.put(key, new List<Dynamic>());
			}

			grouped.get(key).add(dynamic);
		}

		return grouped;
    }
}
