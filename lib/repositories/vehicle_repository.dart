import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:petroplus/consts/apis.dart';
import 'package:petroplus/models/vmodel_model.dart';
import '../errors/excepions.dart';

import '../errors/http_client_error_handler.dart';
import '../models/maker_model.dart';

class VehicleRepository {
  final Dio _client;

  VehicleRepository(this._client);

  Future<VModelModel?> getModel(num id) async {
    try {
      final response = await _client.get(APIS.urlGetModels + id.toString());

      if (response.data != null) {
        return VModelModel.fromJson(response.data);
      } 
      else {
        return null;
      }
      
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }

  Future<MakerModel?> getMaker(num id) async {
    try {
      final response = await _client.get(APIS.urlGetMakers + id.toString());

      if (response.data != null) {
        return MakerModel.fromJson(response.data);
      } 
      else {
        return null;
      }

    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }
}
