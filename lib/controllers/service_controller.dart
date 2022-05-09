import 'package:petroplus/models/service_model.dart';
import 'package:petroplus/repositories/service_repository.dart';

import '../alerts/alerts.dart';
import '../errors/excepions.dart';

class ServiceController {
  final ServiceRepository _repository;

  ServiceController(this._repository);

  Future<ServiceModel> getServices() async {
    try {
      return await _repository.getServices();
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
    return ServiceModel();
  }
}