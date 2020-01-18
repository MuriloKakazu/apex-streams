public class TypeUtil {
    public static Type getListTypeOf(Type elementType) {
        return Type.forName(String.format('List<{0}>', new List<Object> { elementType.getName() }));
    }
}
