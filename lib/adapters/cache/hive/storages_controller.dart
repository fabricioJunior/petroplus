Map<Type, int>? _storageTypes;

int typeId(Type type) {
  if (_storageTypes != null) {
    if (_storageTypes!.containsKey(type)) {
      return _storageTypes![type]!;
    } else
      throw NotRegisterTypeExcepetion(type);
  } else
    throw UninitializedStorageExcepetion();
}

Future<void> inicializarStorage(
  Map<Type, int> storageTypes,
) async {
  _verificarIndentificadores(storageTypes);
  _verificarTiposDuplicados(storageTypes);
  _storageTypes = storageTypes;
}

void _verificarIndentificadores(Map<Type, int> storageTypes) {
  var numeroDeIndentificadores = storageTypes.values.length;
  var numeroDeIndentificadoresDistintos = storageTypes.values.toSet().length;

  if (numeroDeIndentificadores != numeroDeIndentificadoresDistintos)
    AssertionError(
      '''Existem tipos com indentificadores iguais, verifique os Ids
            adicionados no mapeamento de entidades armazenaveis no cache''',
    );
}

void _verificarTiposDuplicados(Map<Type, int> storageTypes) {
  var numeroDeTipos = storageTypes.keys.length;
  var numeroDeTiposDistintos = storageTypes.keys.toSet().length;

  if (numeroDeTipos != numeroDeTiposDistintos)
    AssertionError(
      ''' Uma mesma etidade foi registrada mais uma vez,  verifique os tipos
            adicionados no mapeamento de entidades armazenaveis no cache''',
    );
}

bool isSubtype<S, T>() => <S>[] is List<T>;

class InvalidTypeExcepetion extends FormatException {
  InvalidTypeExcepetion(Type type)
      : super(
          '${type.toString()} não é uma entidade armazenavel',
        );
}

class NotRegisterTypeExcepetion extends FormatException {
  NotRegisterTypeExcepetion(Type type)
      : super(
          '${type.toString()} não está registrado como uma entidade armazenavel',
        );
}

class UninitializedStorageExcepetion extends FormatException {
  UninitializedStorageExcepetion()
      : super(
          '''O storage não foi inicializado, chame StorageController.inicializarStorage()
                                              antes de armazena ou ler qualquer informação ''',
        );
}
