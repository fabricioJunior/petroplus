import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:petroplus/errors/excepions.dart';
import 'package:petroplus/errors/http_client_error_handler.dart';
import 'package:petroplus/models/services.dart';

class ServicesRepository {
  final Dio _client;

  ServicesRepository(this._client);

  Future<Services> services() async {
    try {
      Response response = await _client.get(
        'services',
      );
      return Services.fromJson(response.data);
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }

  Future<bool> post(Map<String, dynamic> data) async {
    try {
      await _client.post(
        'services',
        data: data,
      );
      return true;
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }
}
