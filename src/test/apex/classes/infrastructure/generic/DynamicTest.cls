@IsTest
public class DynamicTest {

    private class Person {
        public String name;
        public Integer age;
    }

    @IsTest 
    static void shouldContainField() {
        Dynamic dynamic = new Dynamic();
        dynamic.put('name', 'Miller');
        System.assert(dynamic.contains('name'));
    }

    @IsTest
    static void shouldContainField_IfExplicitlySetToNull() {
        Dynamic dynamic = new Dynamic();
        dynamic.put('name', null);
        System.assert(dynamic.contains('name'));
    }

    @IsTest 
    static void shouldNotContainField_IfNotSet() {
        Dynamic dynamic = new Dynamic();
        System.assert(!dynamic.contains('name'));
    }

    @IsTest 
    static void shouldReturnNull_WhenGettingUnsetField() {
        Dynamic dynamic = new Dynamic();
        System.assertEquals(null, dynamic.get('name'));
    }

    @IsTest 
    static void fieldsShouldBeCaseSensitive() {
        Dynamic dynamic = new Dynamic();
        dynamic.put('name', 'Miller');

        System.assert(dynamic.contains('name'));
        System.assert(!dynamic.contains('Name'));

        System.assertEquals('Miller', dynamic.get('name'));
        System.assertEquals(null, dynamic.get('Name'));
    } 

    @IsTest
    static void shoudPutNewField() {
        Dynamic dynamic = new Dynamic();
        dynamic.put('name', 'Miller');
        System.assertEquals('Miller', dynamic.get('name'));
    }

    @IsTest
    static void shouldOverwriteValue_WhenPuttingSameField() {
        Dynamic dynamic = new Dynamic();
        dynamic.put('name', 'Miller');
        dynamic.put('name', 'Rodriguez');
        System.assertEquals('Rodriguez', dynamic.get('name'));
    }

    @IsTest
    static void shouldRemoveField() {
        Dynamic dynamic = new Dynamic();
        dynamic.put('name', 'Miller');
        dynamic.remove('name');
        System.assert(!dynamic.contains('name'));
    }

    @IsTest 
    static void shouldClearFields() {
        Dynamic dynamic = new Dynamic();
        dynamic.put('name', 'Miller');
        dynamic.put('age', 20);
        dynamic.clear();

        System.assert(!dynamic.contains('name'));
        System.assert(!dynamic.contains('age'));
    }

    @IsTest
    static void shouldSerializeAsUnprettyJson() {
        Dynamic dynamic = new Dynamic();
        dynamic.put('name', 'Miller');
        dynamic.put('age', 20);

        System.assertEquals('{"age":20,"name":"Miller"}', dynamic.serialize());
    }

    @IsTest
    static void shouldMarshalToAnotherType() {
        Dynamic dynamic = new Dynamic();
        dynamic.put('name', 'Miller');
        dynamic.put('age', 20);

        Person person = (Person) dynamic.marshal(Person.class);
        System.assertEquals('Miller', person.name);
        System.assertEquals(20, person.age);
    }

    @IsTest 
    static void shouldCreateShallowClone() {
        Account account = new Account();
        Dynamic dynamic = new Dynamic();
        dynamic.put('account', account);
        
        Dynamic shallowClone = dynamic.shallowClone();
        System.assertNotEquals(dynamic, shallowClone);
        System.assertEquals(account, shallowClone.get('account'));
    }

    @IsTest
    static void shouldPutSObject_WithOriginalFieldNameCasing() {
        Account account = new Account(name = 'Miller', billingStreet = '5th St.');
        Dynamic dynamic = new Dynamic();
        dynamic.put(account);

        // even though Apex is case insensitive (thus we can set these fields as above)
        // our dynamic object is case sensitive, and we retain the original casing of the
        // "Name" and "BillingStreet" fields as they are defined in the object's metadata.
        System.assert(!dynamic.contains('name'));
        System.assert(!dynamic.contains('billingStreet'));

        System.assertEquals('Miller', dynamic.get('Name'));
        System.assertEquals('5th St.', dynamic.get('BillingStreet'));
    }

    @IsTest
    static void shouldPutMap() {
        Map<String, Object> fieldMap = new Map<String, Object> {
            'name' => 'Miller',
            'age' => 20
        };

        Dynamic dynamic = new Dynamic();
        dynamic.put(fieldMap);

        System.assertEquals('Miller', dynamic.get('name'));
        System.assertEquals(20, dynamic.get('age'));
    }

    @IsTest
    static void shouldPutJsonString() {
        Dynamic dynamic = new Dynamic();
        dynamic.put('{"age":20,"name":"Miller"}');
        
        System.assertEquals('Miller', dynamic.get('name'));
        System.assertEquals(20, dynamic.get('age'));
    }

    @IsTest
    static void shouldThrowException_WhenPuttingNonJsonString() {
        try {
            Dynamic dynamic = new Dynamic();
            dynamic.put('gibberish');
            System.assert(false, 'It should not be possible to put non-json string');
        } catch (Exception e) { }
    }

    @IsTest
    static void shouldPutObject() {
        Person person = new Person();
        person.name = 'Miller';
        person.age = 20;

        Dynamic dynamic = new Dynamic();
        dynamic.put(person);

        System.assertEquals('Miller', dynamic.get('name'));
        System.assertEquals(20, dynamic.get('age'));
    }

    @IsTest
    static void shouldPutDynamic() {
        Dynamic first = new Dynamic();
        first.put('name', 'Miller');

        Dynamic second = new Dynamic();
        second.put('age', 20);

        first.put(second);

        System.assertEquals('Miller', first.get('name'));
        System.assertEquals(20, first.get('age'));
    }
    
}
