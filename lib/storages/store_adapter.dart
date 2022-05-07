import 'package:hive/hive.dart' as hive;
import 'package:petroplus/storages/storage_entity.dart';
import 'storages_controller.dart' as s;
import 'utils.dart';

class StoreAdapter<E extends StorageEntity> extends hive.TypeAdapter<E> {
  StoreAdapter(this.buildEntity);

  final E Function(Map<String, dynamic> props) buildEntity;

  void registerHiveAdapterWithType() {
    registerHiveAdapter<E>(this);
  }

  @override
  void write(hive.BinaryWriter writer, E obj) {
    var props = obj.storageProperties;

    writer.writeInt(props.length);

    for (final String prop in props.keys) {
      writer
        ..writeString(prop)
        ..write(props[prop]);
    }
  }

  @override
  E read(hive.BinaryReader reader) {
    final numOfProperties = reader.readInt();
    final props = <String, dynamic>{
      for (int i = 0; i < numOfProperties; i++)
        reader.readString(): reader.read(),
    };
    return buildEntity.call(props);
  }

  @override
  int get typeId => s.typeId(E);

  Type get type => E;
}
