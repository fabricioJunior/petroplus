import 'package:petroplus/errors/excepions.dart';
import '../alerts/alerts.dart';
import '../models/maker_model.dart';
import '../models/vmodel_model.dart';
import '../repositories/vehicle_repository.dart';

class VehicleController {
  
  final VehicleRepository _repository;

  VehicleController(this._repository);
  
  Future<MakerModel?> getMaker(num id) async {
    try {
      return await _repository.getMaker(id);
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
    return null;
  }

  Future<VModelModel?> getModel(num id) async {
    try {
      return await _repository.getModel(id);
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
    return null;
  }

}
