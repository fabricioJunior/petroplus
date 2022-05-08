import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:petroplus/errors/http_client_error_handler.dart';
import 'package:petroplus/models/produtcs.dart';

import '../errors/excepions.dart';

class RecommedationsRepository {
  final Dio _client;

  RecommedationsRepository(this._client);

  Future<Produtcs> recommendations() async {
    try {
      Response response = await _client.get(
        'products?recommendations=true',
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
