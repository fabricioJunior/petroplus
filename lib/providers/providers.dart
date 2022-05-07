import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petroplus/autenticacao/http_interceptos.dart';
import 'package:petroplus/data_access/cache/orders_store.dart';
import 'package:petroplus/data_access/clients/orders_client.dart';
import 'package:petroplus/repositories/orders_repository.dart';

class PetroPlusProviders extends StatelessWidget {
  final Widget child;

  const PetroPlusProviders(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // _orderRepositoryProvider(),
      ],
      child: child,
    );
  }
}
