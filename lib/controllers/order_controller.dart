import 'package:petroplus/models/order_model.dart';

import '../alerts/alerts.dart';
import '../errors/excepions.dart';

import '../repositories/order_repository.dart';

class OrderController {
  final OrderRepository _repository;

  OrderController(this._repository);

  Future<OrderModel?> getByLicensePlate(String licensePlate) async {
    try {
      return await _repository.getByLicensePlate(licensePlate);
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
    return null;
  }

  Future<bool> post(
    String nome,
    String cpf,
    String telefone,
    String email,
    String anoVeiculo,
    String cor,
    String placa,
    String quilometragem,
    int combustivel,
  ) async {
    try {
      OrderModel? newOrder = OrderModel(
        customerName: nome,
        customerDocument: cpf,
        phoneNumber: telefone,
        email: email,
        vehicleYear: '$anoVeiculo-$combustivel',
        vehicleColor: cor,
        licensePlate: placa,
        mileage: quilometragem,
      );
      return await _repository.post(newOrder.toJson());
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
    return false;
  }
}
