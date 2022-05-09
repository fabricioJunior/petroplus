import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:petroplus/errors/http_client_error_handler.dart';

import '../errors/excepions.dart';
import '../models/service_model.dart';

class ServiceRepository {
    final Dio _client;

  ServiceRepository(this._client);

  Future<ServiceModel> getServices() async {
    try {
      Response response = await _client.get(
        'products?recommendations=true',
      );
      final result = ServiceModel.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }
}
