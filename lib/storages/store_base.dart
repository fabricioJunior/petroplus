import 'package:hive/hive.dart';
import 'package:petroplus/storages/storage_entity.dart';
import 'package:petroplus/storages/store_adapter.dart';
import 'package:petroplus/storages/utils.dart';

abstract class StoreBase<E extends StorageEntity> {
  Future<void> save(List<E> objetos) async {
    var box = await openBox();
    await box.clear();
    Map<dynamic, E> entries = {for (var v in objetos) key(v): v};
    await box.putAll(entries);
  }

  Future<void> add(List<E> objetos) async {
    var box = await openBox();
    Map<dynamic, E> entries = {for (var v in objetos) key(v): v};
    box.putAll(entries);
  }

  Future<void> put(E objeto, {dynamic myKey}) async {
    var box = await openBox();

    if (key(objeto) == null) {
      await box.add(objeto);
    } else {
      await box.put(myKey ?? key(objeto), objeto);
    }
  }

  Future<List<E>> fetchAll() async {
    Box<E> box = await openBox();
    return box.values.toList();
  }

  Future<E?> fetch(dynamic key) async {
    Box<E> box = await openBox();
    return box.get(key);
  }

  Future<E?> fetchUnique() async {
    Box<E> box = await openBox();
    return box.get(0);
  }

  Future<void> clear() async {
    Box<E> box = await openBox();
    await box.clear();
  }

  Future<Box<E>> openBox() async {
    return _openBox();
  }

  Future<Box<E>> _openBox() async {
    List<StoreAdapter> _adapters = adapters;
    for (final StoreAdapter adapter in _adapters) {
      adapter.registerHiveAdapterWithType();
    }
    return await openHiveBox<E>(hiveBoxName);
  }

  Future<bool> contains(E objeto) async {
    var box = await openBox();
    return box.containsKey(key(objeto));
  }

  Future<void> delete(E objeto) async => await deleteByKey(key(objeto));

  Future<void> deleteByKey(dynamic key) async {
    var box = await openBox();
    box.delete(key);
  }

  dynamic key(E object);

  String get hiveBoxName;

  bool get isCriticalInformation;

  List<StoreAdapter> get adapters;
}
