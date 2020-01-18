public class CollectionUtil {

    public static List<Object> join(List<Object> leftList, List<Object> rightList) {
        List<Object> joinedList = new List<Object>();
        joinedList.addAll(leftList);
        joinedList.addAll(rightList);
        return joinedList;
    }
    
}
