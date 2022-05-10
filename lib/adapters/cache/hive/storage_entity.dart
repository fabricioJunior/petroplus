abstract class StorageEntity {
  Map<String, dynamic> get storageProperties;
}

extension Util on Map<dynamic, dynamic> {
  bool isNotNull(dynamic key) {
    return this[key] != null;
  }
}
