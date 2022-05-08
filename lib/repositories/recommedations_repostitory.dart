import 'package:dio/dio.dart';
import 'package:petroplus/models/produtc.dart';

class RecommedationsRepository {
  final Dio _client;

  RecommedationsRepository(this._client);

  // Future<List<Produtc>> recommendations() async {
  //    try {
  //     Response response = await _client.get(
  //       'customer_licenses/byLicensePlate/$licensePlate',
  //     );
  //     return VehicleModel.fromJson(response.data);
  //   } on DioError catch (e) {
  //     throw getHttpClientException(e);
  //   } on PlatformException {
  //     throw GenericException(plataformException);
  //   } catch (e) {
  //     throw GenericException(e.toString());
  //   }

  // }
}
