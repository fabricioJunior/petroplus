import '../alerts/alerts.dart';
import '../errors/excepions.dart';

import '../models/vehicle_model.dart';
import '../repositories/order_repository.dart';

class AddOrderController  {
  final OrderRepository _orderRepository;

  AddOrderController(this._orderRepository);

  Future<void> onGetVehicleByLicensePlate(String licensePlate) async {
    try {
      VehicleModel? model = await _orderRepository.getVehicleByLicensePlate(licensePlate);
      await _orderRepository.saveOrder(model.toJsonPost());
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
  }
}
