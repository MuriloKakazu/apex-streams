@IsTest
public class TypeUtilTest {
    
    private class Person { }

    @IsTest
    static void shouldGetListType() {
        System.assertEquals(List<Account>.class, TypeUtil.getListTypeOf(Account.class));
    }

    @IsTest
    static void shouldGetListType_WhenSubclassElementType() {
        System.assertEquals(List<Person>.class, TypeUtil.getListTypeOf(Person.class));
    }

}
