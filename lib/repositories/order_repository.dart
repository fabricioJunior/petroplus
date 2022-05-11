import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import '../errors/excepions.dart';
import '../models/orders_list_model.dart';

import '../consts/apis.dart';
import '../errors/http_client_error_handler.dart';
import '../models/order_model.dart';
import '../storage/order_store.dart';

class OrderRepository {
  final Dio _client;
  final OrderStore _orderStore;

  OrderRepository(this._client, this._orderStore);

  Future<OrdersListModel> getAll() async {
    try {
      Response response = await _client.get(APIS.urlGetVehicles);
      return OrdersListModel.fromJson(response.data);
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
      List<OrderModel> orders = await _orderStore.fetchAll();
      OrderModel? result = OrdersListModel(orders).getByLiscencePlate(licensePlate);

      if (result != null) {
        return result;
      }

      var ordersList = await getAll();
      return ordersList.getByLiscencePlate(licensePlate);
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