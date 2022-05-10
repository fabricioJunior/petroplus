import 'package:get_it/get_it.dart';
import 'package:petroplus/repositories/service_repository.dart';

import 'adapters/cache/order_store.dart';
import 'adapters/clients/http_client.dart';
import 'blocs/add_passager_bloc/add_passager_bloc.dart';
import 'controllers/add_order_controller.dart';
import 'controllers/product_controller.dart';
import 'controllers/service_controller.dart';
import 'controllers/vehicle_controler.dart';
import 'repositories/login_repository.dart';
import 'repositories/order_repository.dart';
import 'repositories/product_repository.dart';

final locator = GetIt.instance;

Future<void> registerServices() async {
  final _client = client();
  locator.registerSingleton<OrderStore>(OrderStore());
  locator.registerSingleton<OrderRepository>(
    OrderRepository(_client, locator.get<OrderStore>())
  );
  locator.registerSingleton<AddOrderController>(
    AddOrderController(locator.get<OrderRepository>())
  );
  
  locator.registerSingleton<LoginRepository>(LoginRepository(_client));
  locator.registerSingleton<AddPassangerBloc>(AddPassangerBloc(locator.get<OrderRepository>()));
  
  locator.registerSingleton<ProductRepository>(ProductRepository(_client));
  locator.registerSingleton<ProductController>(ProductController(locator.get<ProductRepository>()));
  
  locator.registerSingleton<ServiceRepository>(ServiceRepository(_client));
  locator.registerSingleton<ServiceController>(ServiceController(locator.get<ServiceRepository>()));
  
  locator.registerSingleton<VehicleController>(VehicleController(locator.get<OrderRepository>()));
}