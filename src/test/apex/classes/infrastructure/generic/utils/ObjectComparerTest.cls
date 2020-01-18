@isTest
private class ObjectComparerTest {

	@IsTest 
    static void shouldCompareBooleans() {
		System.assertEquals(Comparison.EQUALS, ObjectComparer.compare(true, true));
		System.assertEquals(Comparison.EQUALS, ObjectComparer.compare(false, false));
		System.assertEquals(Comparison.NOT_EQUALS, ObjectComparer.compare(false, true));
		System.assertEquals(Comparison.NOT_EQUALS, ObjectComparer.compare(true, false));
	}
	
	@IsTest
    static void shouldCompareDates() {
		System.assertEquals(Comparison.LESS_THAN, ObjectComparer.compare(Date.newInstance(2013,5,1), Date.newInstance(2013,6,1)));
		System.assertEquals(Comparison.EQUALS, ObjectComparer.compare(Date.newInstance(2013,4,1), Date.newInstance(2013,4,1)));
		System.assertEquals(Comparison.GREATER_THAN, ObjectComparer.compare(Date.newInstance(2013,8,1), Date.newInstance(2013,7,1)));
	}
	
	@IsTest
    static void shouldCompareDateTimes() {
		System.assertEquals(Comparison.LESS_THAN, ObjectComparer.compare(Datetime.newInstance(2013,5,1), Datetime.newInstance(2013,6,1)));
		System.assertEquals(Comparison.EQUALS, ObjectComparer.compare(Datetime.newInstance(2013,4,1), Datetime.newInstance(2013,4,1)));
		System.assertEquals(Comparison.GREATER_THAN, ObjectComparer.compare(Datetime.newInstance(2013,8,1), Datetime.newInstance(2013,7,1)));
	}
	
	@IsTest
    static void shouldCompareTimes() {
		System.assertEquals(Comparison.LESS_THAN, ObjectComparer.compare(Time.newInstance(1,0,0,0), Time.newInstance(2,0,0,0)));
		System.assertEquals(Comparison.EQUALS, ObjectComparer.compare(Time.newInstance(3,0,0,0), Time.newInstance(3,0,0,0)));
		System.assertEquals(Comparison.GREATER_THAN, ObjectComparer.compare(Time.newInstance(5,0,0,0), Time.newInstance(4,0,0,0)));
	}

	@IsTest
    static void shouldCompareDecimals() {
		System.assertEquals(Comparison.LESS_THAN, ObjectComparer.compare(Decimal.valueOf(1), Decimal.valueOf(3)));
		System.assertEquals(Comparison.GREATER_THAN, ObjectComparer.compare(Decimal.valueOf(3), Decimal.valueOf(1)));
		System.assertEquals(Comparison.EQUALS, ObjectComparer.compare(Decimal.valueOf(1), Decimal.valueOf(1)));
	}

	@IsTest
    static void shouldCompareDoubles() {
		System.assertEquals(Comparison.LESS_THAN, ObjectComparer.compare(Double.valueOf(1), Double.valueOf(3)));
		System.assertEquals(Comparison.GREATER_THAN, ObjectComparer.compare(Double.valueOf(3), Double.valueOf(1)));
		System.assertEquals(Comparison.EQUALS, ObjectComparer.compare(Double.valueOf(1), Double.valueOf(1)));
	}
	
	@IsTest
    static void shouldCompareIntegers() {
		System.assertEquals(Comparison.LESS_THAN, ObjectComparer.compare(1, 3));
		System.assertEquals(Comparison.GREATER_THAN, ObjectComparer.compare(3, 1));
		System.assertEquals(Comparison.EQUALS, ObjectComparer.compare(1, 1));
	}
	
	@IsTest
    static void shouldCompareIds() {
		Id a = '000000000000001', b = '000000000000001', c = '000000000000002';
		System.assertEquals(Comparison.EQUALS, ObjectComparer.compare(a, b));
		System.assertEquals(Comparison.NOT_EQUALS, ObjectComparer.compare(a, c));
	}

	@IsTest
    static void shouldCompareLongs() {
		System.assertEquals(Comparison.LESS_THAN, ObjectComparer.compare(1L, 3L));
		System.assertEquals(Comparison.GREATER_THAN, ObjectComparer.compare(3L, 1L));
		System.assertEquals(Comparison.EQUALS, ObjectComparer.compare(1L, 1L));
	}
	
	@IsTest
    static void shouldCompareStrings() {
		System.assertEquals(Comparison.LESS_THAN, ObjectComparer.compare('abc', 'bbc'));
		System.assertEquals(Comparison.GREATER_THAN, ObjectComparer.compare('cdc', 'bbc'));
		System.assertEquals(Comparison.EQUALS, ObjectComparer.compare('efg', 'efg'));
	}

    @IsTest
    static void shouldCompareObjects() {
        Account a = new Account(), b = new Account();
        System.assertEquals(Comparison.EQUALS, ObjectComparer.compare(a, a));
		System.assertEquals(Comparison.NOT_EQUALS, ObjectComparer.compare(a, b));
    }
}