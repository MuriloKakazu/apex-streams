public class DynamicCollectionMarshaller {

    public static List<Object> marshalToList(List<Dynamic> dynamicObjs, Type resultingListType, Type listElementType) {
        List<Object> marshalled = (List<Object>) resultingListType.newInstance();

        for (Dynamic dynamic : dynamicObjs) {
            marshalled.add(dynamic.marshal(listElementType));
        }
        
        return marshalled;
    }

    public static Set<Object> marshalToSet(Set<Dynamic> dynamicObjs, Type resultingSetType, Type setElementType) {
        Set<Object> marshalled = (Set<Object>) resultingSetType.newInstance();

        for (Dynamic dynamic : dynamicObjs) {
            marshalled.add(dynamic.marshal(setElementType));
        }
        
        return marshalled;
    }

}
