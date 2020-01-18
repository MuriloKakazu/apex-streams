public virtual class Dynamic {
    private Map<String, Object> content = new Map<String, Object>();

    public Dynamic() { }

    public Dynamic(Object obj) {
        put(obj);
    }

    public Set<String> getFields() {
        return content.keySet();
    }

    public virtual Dynamic put(String field, Object value) {
        content.put(field, value);
        return this;
    }

    public Dynamic put(Object obj) {
        if (obj instanceof Dynamic) return put((Dynamic) obj);
        if (obj instanceof SObject) return put((SObject) obj);
        if (obj instanceof String) return put((String) obj);
        if (obj instanceof Map<String, Object>) return put((Map<String, Object>) obj);

        return put(JSON.serialize(obj));
    }

    public Dynamic put(Dynamic obj) {
        return put(obj.content);
    }

    public Dynamic put(SObject record) {
        return put(record.getPopulatedFieldsAsMap());
    }

    public Dynamic put(String jsonString) {
        return put((Map<String, Object>) JSON.deserializeUntyped(jsonString));
    }

    public Dynamic put(Map<String, Object> untypedObj) {
        for (String field : untypedObj.keySet()) {
            Object value = untypedObj.get(field);
            put(field, value);
        }
        return this;
    }

    public virtual Boolean contains(String field) {
        return content.containsKey(field);
    }

    public virtual Object get(String field) {
        return content.get(field);
    }

    public virtual Dynamic remove(String field) {
        content.remove(field);
        return this;
    }

    public Dynamic clear() {
        content.clear();
        return this;
    }

    public String serialize() {
        return JSON.serialize(content);
    }

    public virtual Object marshal(Type type) {
        String jsonString = serialize();
        return JSON.deserialize(jsonString, type);
    }

    public Dynamic shallowClone() {
        return new Dynamic(content.clone());
    }
}