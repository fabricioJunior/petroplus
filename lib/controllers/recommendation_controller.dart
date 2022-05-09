import 'package:petroplus/models/products_model.dart';
import 'package:petroplus/repositories/recommendation_repostitory.dart';

import '../alerts/alerts.dart';
import '../errors/excepions.dart';

class RecommendationController {
  final RecommendationRepository _repository;

  RecommendationController(this._repository);

  Future<ProductsModel> getRecommendations() async {
    try {
      return await _repository.getRecommendations();
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
    return ProductsModel();
  }
}