import 'package:petroplus/models/order_model.dart';

import '../alerts/alerts.dart';
import '../errors/excepions.dart';

import '../models/vehicle_model.dart';
import '../repositories/order_repository.dart';

class AddOrderController {
  final OrderRepository _orderRepository;

  AddOrderController(this._orderRepository);

  // Future<void> onGetVehicleByLicensePlate(String licensePlate) async {
  //   try {
  //     VehicleModel? model =
  //         await _orderRepository.getVehicleByLicensePlate(licensePlate);
  //     await _orderRepository.saveOrder(model.toJsonPost());
  //   } on HttpClientException catch (e) {
  //     showAlert(e.message!, isError: true);
  //   } catch (e) {
  //     showAlert(e.toString(), isError: true);
  //   }
  // }

  Future<bool> onCreateNewOrder(
    String nome,
    String cpf,
    String telefone,
    String email,
    String anoVeiculo,
    String cor,
    String placa,
    String quilometragem,
  ) async {
    try {
      OrderModel? newOrder = OrderModel(
        customerName: nome,
        customerDocument: cpf,
        phoneNumber: telefone,
        email: email,
        vehicleYear: anoVeiculo,
        vehicleColor: cor,
        licensePlate: placa,
        mileage: quilometragem,
      );
      await _orderRepository.saveOrder(newOrder.toJson());
      return true;
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
    return false;
  }
}
