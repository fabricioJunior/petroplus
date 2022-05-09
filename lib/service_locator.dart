import 'package:get_it/get_it.dart';
import 'package:petroplus/pages/add_passenger/add_passenger_page.dart';

import 'adapters/cache/order_store.dart';
import 'adapters/clients/http_client.dart';
import 'blocs/add_passager_bloc/add_passager_bloc.dart';
import 'controllers/add_order_controller.dart';
import 'controllers/x_order/x_order_controler.dart';
import 'repositories/customers_repository.dart';
import 'repositories/login_repository.dart';
import 'repositories/order_repository.dart';

final locator = GetIt.instance;

Future<void> registerServices() async {
  final _client = client();
  locator.registerSingleton<OrderStore>(OrderStore());
  locator.registerSingleton<OrderRepository>(
      OrderRepository(_client, locator.get<OrderStore>()));
  locator.registerSingleton<CustomersRepository>(
    CustomersRepository(_client),
  );
  locator.registerSingleton<AddOrderController>(
      AddOrderController(locator.get<OrderRepository>()));
  locator.registerSingleton<XOrderController>(
      XOrderController(locator.get<OrderRepository>()));
  locator.registerSingleton<LoginRepository>(LoginRepository(_client));
  locator.registerSingleton<AddPassangerBloc>(AddPassangerBloc(
    locator.get<OrderRepository>(),
    locator.get<CustomersRepository>(),
  ));
}
