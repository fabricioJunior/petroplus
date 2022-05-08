import 'package:dio/dio.dart';
import '../../consts/apis.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio? dio;

Dio client() {
  dio ??= Dio(
    BaseOptions(
      baseUrl: APIS.urlBase,
    ),
  );
  return dio!..interceptors.add(interceptors());
}

InterceptorsWrapper interceptors() =>
  InterceptorsWrapper(onRequest: (options, handler) async {
    final preferences = await SharedPreferences.getInstance();
    var token = preferences.get('token').toString();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    options.headers.addAll(headers);

    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioError e, handler) {
    return handler.next(e); //continue
  });
