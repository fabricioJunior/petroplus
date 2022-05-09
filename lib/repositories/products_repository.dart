import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:petroplus/errors/excepions.dart';
import 'package:petroplus/models/products_model.dart';

import '../errors/http_client_error_handler.dart';

class ProductsRepository {
  final Dio _client;

  ProductsRepository(this._client);

  Future<ProductsModel> produtcs() async {
    try {
      Response response = await _client.get(
        'products',
      );
      return ProductsModel.fromJson(response.data);
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }
}
