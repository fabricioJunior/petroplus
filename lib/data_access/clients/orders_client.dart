import 'package:dio/dio.dart';
import 'package:petroplus/models/orders_list.dart';
import 'package:petroplus/models/vehicle_model.dart';

class OrdersClient {
  final Dio client;

  OrdersClient(this.client);

  Future<OrdersList> getAll() async {
    Response response = await client.get(
      'orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT',
    );
    handleError(response);
    return _montarObjeto(response.data);
  }

  Future<VehicleModel> getVehicleByLicensePlate(String licensePlate) async {
    Response response = await client.get(
      'customer_licenses/byLicensePlate/$licensePlate',
    );
    handleError(response);
    return _montarVehicle(response.data);
  }

  Future<bool> post(Map<String, dynamic> data) async {
    try {
      Response response = await client.post(
        'orders',
        data: data,
      );
      handleError(response);
      return true;
    } catch (e) {
      return false;
    }
  }

  void handleError(Response response) {
    if (response.statusCode != 200) {
      throw Exception('Erro na requisição ${response.realUri}');
    }
  }

  OrdersList _montarObjeto(Map<String, dynamic> json) {
    return OrdersList.fromJson(json);
  }

  VehicleModel _montarVehicle(Map<String, dynamic> json) {
    return VehicleModel.fromJson(json);
  }
}
