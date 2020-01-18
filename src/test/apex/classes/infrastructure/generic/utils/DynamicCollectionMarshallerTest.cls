@IsTest
public class DynamicCollectionMarshallerTest {
    private class Person {
        public String name; 
        public Integer age;

        public Person(String name, Integer age) {
            this.name = name;
            this.age = age;
        }
    }

    @IsTest
    static void shouldMarshalToTypedList() {
        List<Dynamic> dynamicList = new List<Dynamic> {
            new Dynamic(new Person('Garcia', 34)),
            new Dynamic(new Person('Gonzales', 41))
        };

        List<Person> people = (List<Person>) DynamicCollectionMarshaller.marshalToList(dynamicList, List<Person>.class, Person.class);
        System.assertEquals(2, people.size());

        Person firstPerson = people.get(0);
        System.assertEquals('Garcia', firstPerson.name);
        System.assertEquals(34, firstPerson.age);

        Person secondPerson = people.get(1);
        System.assertEquals('Gonzales', secondPerson.name);
        System.assertEquals(41, secondPerson.age);
    }
}
