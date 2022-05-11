import '../alerts/alerts.dart';
import '../errors/excepions.dart';
import '../models/product_media_model.dart';
import '../models/product_model.dart';
import '../repositories/product_repository.dart';

class ProductController {
  final ProductRepository _repository;

  ProductController(this._repository);

  Future<ProductModel?> getRecommendations() async {
    try {
      return await _repository.getRecommended();
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
    return null;
  }

  Future<ProductMediaModel?> getProductMedia(String id) async {
    try {
      return await _repository.getProductMedia(id);
    } on HttpClientException catch (e) {
      showAlert(e.message!, isError: true);
    } catch (e) {
      showAlert(e.toString(), isError: true);
    }
    return null;
  }
}