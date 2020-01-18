public class ObjectComparer {

	private static Comparison compareBooleans(Boolean a, Boolean b) {
		if (a == b) {
			return Comparison.EQUALS;
		} else {
			return Comparison.NOT_EQUALS;
		}
	}

	private static Comparison compareDates(Date a, Date b) {
		if (a < b) {
			return Comparison.LESS_THAN;
		} else if (a == b) {
			return Comparison.EQUALS;
		} else {
			return Comparison.GREATER_THAN;
		}
	}

	private static Comparison compareTimes(Time a, Time b) {
		if (a < b) {
			return Comparison.LESS_THAN;
		} else if (a == b) {
			return Comparison.EQUALS;
		} else {
			return Comparison.GREATER_THAN;
		}
	}

	private static Comparison compareDatetimes(Datetime a, Datetime b) {
		if (a < b) {
			return Comparison.LESS_THAN;
		} else if (a == b) {
			return Comparison.EQUALS;
		} else {
			return Comparison.GREATER_THAN;
		}
	}

	private static Comparison compareDecimals(Decimal a, Decimal b) {
		if (a < b) {
			return Comparison.LESS_THAN;
		} else if (a == b) {
			return Comparison.EQUALS;
		} else {
			return Comparison.GREATER_THAN;
		}
	}

	private static Comparison compareDoubles(Double a, Double b) {
		if (a < b) {
			return Comparison.LESS_THAN;
		} else if (a == b) {
			return Comparison.EQUALS;
		} else {
			return Comparison.GREATER_THAN;
		}
	}	

	private static Comparison compareIds(Id a, Id b) {
		if (a == b) {
			return Comparison.EQUALS;
		} else {
			return Comparison.NOT_EQUALS;
		}
	}

	private static Comparison compareIntegers(Integer a, Integer b) {
		if (a < b) {
			return Comparison.LESS_THAN;
		} else if (a == b) {
			return Comparison.EQUALS;
		} else {
			return Comparison.GREATER_THAN;
		}
	}

	private static Comparison compareLongs(Long a, Long b) {
		if (a < b) {
			return Comparison.LESS_THAN;
		} else if (a == b) {
			return Comparison.EQUALS;
		} else {
			return Comparison.GREATER_THAN;
		}
	}

	private static Comparison compareStrings(String a, String b) {
		if (a < b) {
			return Comparison.LESS_THAN;
		} else if (a == b) {
			return Comparison.EQUALS;
		} else {
			return Comparison.GREATER_THAN;
		}
	}

    private static Comparison compareObjects(Object a, Object b) {
        if (a == b) {
			return Comparison.EQUALS;
		} else {
			return Comparison.NOT_EQUALS;
		}
    }

	public static Comparison compare(Object first, Object second) {
		if (first instanceof Boolean && second instanceof Boolean) {
			return compareBooleans((Boolean)first, (Boolean)second);
		}
		else if (first instanceof Date && second instanceof Date) {
			return compareDates((Date)first, (Date)second);
		}
		else if (first instanceof Datetime && second instanceof Datetime) {
			return compareDatetimes((Datetime)first, (Datetime)second);
		}
		else if (first instanceof Decimal && second instanceof Decimal) {
			return compareDecimals((Decimal)first, (Decimal)second);
		}
		else if (first instanceof Double && second instanceof Double) {
			return compareDoubles((Double)first, (Double)second);
		}
		else if (first instanceof Id && second instanceof Id) {
			return compareIds((Id)first, (Id)second);
		}
		else if (first instanceof Integer && second instanceof Integer) {
			return compareIntegers((Integer)first, (Integer)second);
		}
		else if (first instanceof Long && second instanceof Long) {
			return compareLongs((Long)first, (Long)second);
		}
		else if (first instanceof String && second instanceof String) {
			return compareStrings((String)first, (String)second);
		}
		else if (first instanceof Time && second instanceof Time) {
			return compareTimes((Time)first, (Time)second);
		} else {
            return compareObjects(first, second);
        }
	}
}