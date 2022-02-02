typedef _LazyCallback<T> = T Function();

class Get {
  Get._();
  static Get i = Get._();

  Map<String, dynamic> _data = {};
  Map<String, _LazyCallback> _lazyData = {};

  String _getKey(Type t, String? tag) {
    if (tag != null) {
      return "${t.toString()}$tag";
    }
    return t.toString();
  }

  void put<T>(T dependency, {String? tag}) {
    final String key = _getKey(T, tag);
    _data[key] = dependency;
  }

  void lazyPut<T>(_LazyCallback<T> dependency, {String? tag}) {
    final String key = _getKey(T, tag);
    _lazyData[key] = dependency;
  }

  T? find<T>({String? tag, bool lazy = false}) {
    final String key = _getKey(T, tag);
    final bool insideData = _data.containsKey(key);
    final bool insideLazyData = _lazyData.containsKey(key);

    if (insideData) {
      return _data[key];
    }

    if (lazy) {
      if (!insideLazyData) {
        throw AssertionError("$key not found!");
      }

      final dependency = _lazyData[key]!();
      this.put<T>(dependency, tag: tag);
      return dependency;
    }

    throw AssertionError("$key not found!");
  }

  bool remove<T>({String? tag}) {
    final String key = _getKey(T, tag);
    if (_data.containsKey(key)) {
      _data.remove(key);
      return true;
    }
    return false;
  }
}
