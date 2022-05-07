import 'package:hive/hive.dart';

import 'hive_boxes.dart';

void registerHiveAdapter<T>(TypeAdapter<T> adapter) {
  if (!Hive.isAdapterRegistered(adapter.typeId)) {
    Hive.registerAdapter<T>(adapter);
  }
}

Future<Box<T>> openHiveBox<T>(String name) async {
  return await Hive.openBox<T>(
    name,
    compactionStrategy: (_, deletedEntries) {
      return deletedEntries > 50;
    },
  );
}

Future<void> wipeUserData() async {
  for (final String box in userDataBoxes) {
    await Hive.deleteBoxFromDisk(box);
  }
}
