import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<Map<dynamic, dynamic>> loadProducts() async {
  try {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");
    final response = await http.get(
        Uri.parse(
          "https://petroplus-api-dev.herokuapp.com/v1/orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT",
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    Map data = jsonDecode(response.body);
    Map quantClients = data["Items"];
    return quantClients;
  } catch (e) {
    rethrow;
  }
}

  
//  Future<void> loadProducts() async {
//     final preferences = await SharedPreferences.getInstance();
//     final token = preferences.getString("token");

//     final response = await http.get(
//         Uri.parse(
//           "https://petroplus-api-dev.herokuapp.com/v1/orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT",
//         ),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         });

//     Map<String, dynamic> data = jsonDecode(response.body);
//     Map quantClients = data["Items"];
    
//     // List<dynamic> quantClients = data["items"][0]["mileage"];

//     // print("Temos $quantClients Clientes");
//     // data.forEach((key, value) {});
//     // print(jsonDecode(response.body));
//     // print(response.toString());
//     // for (var i = 0; i <= quantClients; i++) {
//     //   //quantidadeClients
//     //   String nomeClients = data["items"][i]["mileage"];

//     //   //  print("");
//     //   print("O veiculo ${i} tem ${nomeClients} de kilometragem");
//     //   //  print("O nome dele é $nomeClients");
//     //   // print("O numero do RG dele é $documentClients");
//     //   //  print("O status do cliente é $statusClients");
//     //   // print("__________________________________");
//     // }
//   }