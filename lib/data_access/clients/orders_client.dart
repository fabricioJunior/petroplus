import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:petroplus/models/orders_list.dart';

class OrdersClient {
  final Dio client;

  OrdersClient(this.client);

  Future<OrdersList> getAll() async {
    Response response = await client.get(
      'orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT',
    );
    handleError(response);
    return _montarObjeto(jsonDecode(response.data));
  }

  void handleError(Response response) {
    if (response.statusCode != 200) {
      throw Exception('Erro na requisição ${response.realUri}');
    }
  }

  OrdersList _montarObjeto(Map<String, dynamic> json) {
    return OrdersList.fromJson(json);
  }
}
