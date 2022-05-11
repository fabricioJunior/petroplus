import 'package:petroplus/errors/excepions.dart';
import '../alerts/alerts.dart';
import '../models/vehicle_model.dart';
import '../repositories/vehicle_repository.dart';

class VehicleController {
  
  final VehicleRepository _repository;

  VehicleController(this._repository);
  
  Future<List<VehicleModel>> get() async {
    try {
      return await _repository.get();
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
    return [];
  }

  Future<VehicleModel?> getByLicensePlate(String licensePlate) async {
    try {
      return await _repository.getByLicensePlate(licensePlate);
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
    return null;
  }
}
