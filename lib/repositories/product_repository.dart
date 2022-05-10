import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:petroplus/errors/excepions.dart';
import 'package:petroplus/models/product_media_model.dart';
import 'package:petroplus/models/product_model.dart';

import '../errors/http_client_error_handler.dart';
import '../models/product_model.dart';

class ProductRepository {
  final Dio _client;

  ProductRepository(this._client);

  Future<ProductModel> get() async {
    try {
      Response response = await _client.get('products');
      return ProductModel.fromJson(response.data);
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }

  Future<ProductModel> getByID(String id) async {
    try {
      Response response = await _client.get('products/$id');
      return ProductModel.fromJson(response.data);
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }

  Future<ProductModel> getRecommended() async {
    try {
      Response response = await _client.get('products?recommendations=true');
      final result = ProductModel.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      throw getHttpClientException(e);
    } on PlatformException {
      throw GenericException(plataformException);
    } catch (e) {
      throw GenericException(e.toString());
    }
  }

  Future<ProductMediaModel> getProductMedia(String id) async {
    try {
      Response response = await _client.get('products/$id');
      final result = ProductMediaModel.fromJson(response.data);
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
