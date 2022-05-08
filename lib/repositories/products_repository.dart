import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:petroplus/errors/excepions.dart';
import 'package:petroplus/models/produtcs.dart';

import '../errors/http_client_error_handler.dart';

class ProductsRepository {
  final Dio _client;

  ProductsRepository(this._client);

  Future<Produtcs> produtcs() async {
    try {
      Response response = await _client.get(
        'products',
      );
      return Produtcs.fromJson(response.data);
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }
}
