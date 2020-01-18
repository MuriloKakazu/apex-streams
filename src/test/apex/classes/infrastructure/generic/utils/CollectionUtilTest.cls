@IsTest
public class CollectionUtilTest {
    
    @IsTest
    static void shouldJoinLists() {
        List<String> fruits = new List<String> { 'apple', 'peach' };
        List<String> vegetables = new List<String> { 'carrot', 'cucumber' };

        List<Object> edibles = CollectionUtil.join(fruits, vegetables);

        System.assertEquals(4, edibles.size());
        System.assert(edibles.contains('apple'));
        System.assert(edibles.contains('peach'));
        System.assert(edibles.contains('carrot'));
        System.assert(edibles.contains('cucumber'));
    }

}
