import 'package:petroplus/errors/excepions.dart';
import '../alerts/alerts.dart';
import '../models/vehicle_model.dart';
import '../repositories/order_repository.dart';

class VehicleController {
  
  final OrderRepository orderRepository;

  VehicleController(this.orderRepository);
  
  Future<List<VehicleModel>> getVehicles() async {
    try {
      return await orderRepository.getVehicles();
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
    return [];
  }
}
