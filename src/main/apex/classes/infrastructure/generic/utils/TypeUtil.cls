public class TypeUtil {
    public static Type getListTypeOf(Type elementType) {
        System.debug(elementType.getName());
        System.debug(String.format('List<{0}>', new List<Object> { elementType.getName() }));
        System.debug(Type.forName(String.format('List<{0}>', new List<Object> { elementType.getName() })));
        return Type.forName(String.format('List<{0}>', new List<Object> { elementType.getName() }));
    }
}
