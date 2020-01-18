public class DynamicCollectionMarshaller {

    public static List<Object> marshalToList(List<Dynamic> dynamicObjs, Type elementType) {
        Type listType = TypeUtil.getListTypeOf(elementType);
        List<Object> marshalled = (List<Object>) listType.newInstance();

        for (Dynamic dynamic : dynamicObjs) {
            marshalled.add(dynamic.marshal(elementType));
        }
        
        return marshalled;
    }

}
