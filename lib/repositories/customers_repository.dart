import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:petroplus/errors/excepions.dart';
import 'package:petroplus/errors/http_client_error_handler.dart';
import 'package:petroplus/models/customers.dart';

class CustomersRepository {
  final Dio _client;

  CustomersRepository(this._client);

  Future<Customers> customers() async {
    try {
      Response response = await _client.get('customers');
      return Customers.fromJson(response.data);
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }
}
