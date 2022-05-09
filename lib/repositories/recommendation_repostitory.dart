import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:petroplus/errors/excepions.dart';
import 'package:petroplus/models/products_model.dart';

import '../errors/http_client_error_handler.dart';

class RecommendationRepository {
  final Dio _client;

  RecommendationRepository(this._client);

  Future<ProductsModel> getRecommendations() async {
    try {
      Response response = await _client.get(
        'products?recommendations=true',
      );
      final result = ProductsModel.fromJson(response.data);
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
