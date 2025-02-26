class SessionStorage {

  final Map<String, dynamic> _storage = {};

  void setData(String key, dynamic value) {
    _storage[key] = value;
  }

  dynamic getData(String key) {
    return _storage[key];
  }

  void removeData(String key) {
    _storage.remove(key);
  }

  void clear() {
    _storage.clear();
  }
}
