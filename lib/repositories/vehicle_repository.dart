import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import '../errors/excepions.dart';
import '../models/vehicle_model.dart';

import '../consts/apis.dart';
import '../errors/http_client_error_handler.dart';

class VehicleRepository {
  final Dio _client;

  VehicleRepository(this._client);

  Future<VehicleModel> getByLicensePlate(String licensePlate) async {
    try {
      Response response = await _client.get('customer_licenses/byLicensePlate/$licensePlate');
      return VehicleModel.fromJson(response.data);
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }

  Future<List<VehicleModel>> get() async {
    try {
      final response = await _client.get(APIS.urlGetVehicles);
      return List.from(response.data['items']).map((e) => VehicleModel.fromJson(e)).toList();
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }
}