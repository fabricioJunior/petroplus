import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import '../adapters/cache/order_store.dart';
import '../errors/excepions.dart';
import '../models/orders_list_model.dart';
import '../models/vehicle_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../consts/apis.dart';
import '../errors/http_client_error_handler.dart';
import '../models/order_model.dart';
import '../models/x_order_model.dart';

class OrderRepository {
  final Dio _client;
  final OrderStore _orderStore;

  OrderRepository(this._client, this._orderStore);

  Future<OrdersListModel> getAll() async {
    try {
      Response response = await _client.get(
        'orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT',
      );
      return OrdersListModel.fromJson(response.data);
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }

  // Future<void> newVehicle(String marca, String modelo, String combustivel,
  //     String ano, String cor, String kilometragem,) async {
  //   try {
  //     var newVehicle = VehicleModel(vehicleMakerId: 0, vehicleColor: cor, mileage: kilometragem,);
  //     Response response = await _client.post('customer_vehicles', data: );

  //   } catch (e) {}
  // }

  // Future<bool> newClient(String nomeCompleto, String cpf, String celular, String email,) async {
  //      var newUser = User(name: nomeCompleto,id: cpf,email: email,);
  // }

  Future<VehicleModel> getVehicleByLicensePlate(String licensePlate) async {
    try {
      Response response = await _client.get(
        'customer_licenses/byLicensePlate/$licensePlate',
      );
      return VehicleModel.fromJson(response.data);
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }

  Future<OrderModel?> getOrderByLicensePlate(String licensePlate) async {
    try {
      List<OrderModel> orders = await _orderStore.fetchAll();
      OrderModel? result =
          OrdersListModel(orders).getByLiscencePlate(licensePlate);

      if (result != null) {
        return result;
      }

      final data = await getAll();
      return data.getByLiscencePlate(licensePlate);
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }

  Future<bool> saveOrder(Map<String, dynamic> data) async {
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

  Future<List<XOrderModel>> getXOrders() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.getString("token");

      final response = await _client.get(APIS.urlOrder,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      final data = response.data['items'] as List;
      final todos = data.map((map) => XOrderModel.fromMap(map)).toList();
      return todos;
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }
}