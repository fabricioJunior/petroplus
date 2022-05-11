import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import '../errors/excepions.dart';

import '../consts/apis.dart';
import '../errors/http_client_error_handler.dart';
import '../models/order_model.dart';

class OrderRepository {
  final Dio _client;

  OrderRepository(this._client);

  Future<List<OrderModel>> get() async {
    try {
      final response = await _client.get(APIS.urlGetOrders);
      return List.from(response.data['items']).map((e) => OrderModel.fromJson(e)).toList();
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }

  Future<OrderModel?> getByLicensePlate(String licensePlate) async {
    try {
      return OrderModel.getByLicensePlate(await get(), licensePlate);
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
        'orders/?status=AWAT&page=1&limit=10',
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