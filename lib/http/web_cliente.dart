
// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:petroplus/pages/dashboard_page/widgets/dashboard_responsive_widgets.dart';
// import 'package:petroplus/pages/dashboard_page/widgets/visao_geral_esta_semana_widgets.dart';
// import 'package:petroplus/pages/dashboard_page/widgets/widgets_analysis_all_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../widgets/appbar_uni_widget.dart';
// import '../../widgets/vehicle_history_table_widget.dart';
// import '../appbar_message_alert_page/navigation_drawer_menu.dart';
// import '../delivery_audit/delivery_audit_page.dart';
// import '../drawer_menu.dart/navigation_drawer_menu.dart';
// import '../index.dart';
// import 'package:http/http.dart' as http;

// class ApenastesteRetorno {
//   // String? hallan;

//   Future<String> loadProducts() async {
//     final preferences = await SharedPreferences.getInstance();
//     final token = preferences.getString("token");

//     final String loop;

//     final response = await http.get(
//         Uri.parse(
//           "https://petroplus-api-dev.herokuapp.com/v1/orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT",
//         ),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         });

//     Map<dynamic, dynamic> data = jsonDecode(response.body);
//     int controleLoop = data["meta"]["totalItems"];
//     int number = data["items"][0]["number"];
//     String mileage = data["items"][0]["mileage"];
//     int vehicle_maker_id = data["items"][0]["vehicle_maker_id"];
//     int vehicle_model_id = data["items"][0]["vehicle_model_id"];
//     String vehicle_year = data["items"][0]["vehicle_year"];
//     String vehicle_color = data["items"][0]["vehicle_color"];
//     // String license_plate = data["items"][0]["license_plate"]; Está null
//     String customer_name = data["items"][0]["customer_name"];
//     String customer_document = data["items"][0]["customer_document"];
//     String phone_number = data["items"][0]["phone_number"];
//     String email = data["items"][0]["email"];
//     // int number = data["items"][0]["number"];
//     // int number = data["items"][0]["number"];
//     // int number = data["items"][0]["number"];
//     // int number = data["items"][0]["number"];
//     // int number = data["items"][0]["number"];
//     // int number = data["items"][0]["number"];
//     // int number = data["items"][0]["number"];
//     // int number = data["items"][0]["number"];
//     // int number = data["items"][0]["number"];
//     // int number = data["items"][0]["number"];

//     // for (var i = 0; i <= controleLoop; i++) {
//     //   //quantidadeClients

//     //   //  print("");
//     //   print("O veiculo ${i} tem ${number} de kilometragem");
//     //   //  print("O nome dele é $nomeClients");
//     //   // print("O numero do RG dele é $documentClients");
//     //   //  print("O status do cliente é $statusClients");
//     //   // print("__________________________________");

//     //    int test = controleLoop;

//     //   }

//     loop = controleLoop.toString();
//     return loop;
//   }
// }

// class DashboardPage extends StatefulWidget {
//   const DashboardPage({Key? key}) : super(key: key);

//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   String xxx = "";

//   final ApenastesteRetorno apenastesteRetorno = ApenastesteRetorno();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const NavigationDrawerPagina(),

// // ------------------------------------------------Corpo
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // ----------------------AppBar
//             AppBarUniv(),
//             // ----------------------
//             Center(
//               child: Container(
//                 width: MediaQuery.of(context).size.width * .9,
//                 child: LayoutBuilder(
//                   builder: (context, constraints) {
//                     var isMobile = constraints.minWidth < 500;
//                     var isTablet = constraints.minWidth > 500 &&
//                         constraints.minWidth < 900;
//                     var isComput = constraints.minWidth > 900;
//                     return Column(
//                       children: [
//                         Text("$xxx"),
//                         ElevatedButton(
//                           onPressed: () async {
//                             var resposta =
//                                 await apenastesteRetorno.loadProducts();
//                             setState(() {
//                               xxx = resposta;
//                             });
//                             print(resposta);
//                           },
//                           child: Container(
//                             height: 600,
//                             // child: controleLoop(
//                             //         itemCount: seila(teste),
//                             //         itemBuilder: (context, indice) {
//                             //           return Column(
//                             //             children: [
//                             //               Text(quantClients[indice]todo),
//                             //             ],
//                             //           );
//                             //         },
//                             //   ),
//                           ),
//                         ),
// // ------------------------------------------------Body/Mobile
//                         if (isMobile) ...[
//                           // ------------------------------------------------VisãoGeral/EstaSemana
//                           OverviewThisWeekMobile(),
//                           // -----------------------------------------Row Overal Time Used / 36h
//                           OveralTimeUsedMobile(),
//                           // ------------------------------------------------Sistema Analise
//                           WidgetsAnalysisAllMobile(),
//                           // ------------------------------------------------Agendamentos de Entrada
//                           IncomingAppointmentsMobile(),
//                         ],
// // ------------------------------------------------Body/Tablet
//                         if (isTablet) ...[
//                           // ------------------------------------------------VisãoGeral/EstaSemana
//                           OverviewThisWeekTablet(),
//                           // -----------------------------------------Row Overal Time Used / 36h
//                           OveralTimeUsedTablet(),
//                           // ------------------------------------------------Sistema Analise
//                           WidgetsAnalysisAllTablet(),
//                           // ------------------------------------------------Agendamentos de Entrada
//                           IncomingAppointmentsTablet(),
//                         ],
// // ------------------------------------------------Body/Computadores
//                         if (isComput) ...[
//                           // ------------------------------------------------VisãoGeral/EstaSemana
//                           OverviewThisWeekTablet(),
//                           // -----------------------------------------Row Overal Time Used / 36h
//                           OveralTimeUsedPc(),
//                           // ------------------------------------------------Sistema Analise
//                           WidgetsAnalysisAllPc(),
//                           // ------------------------------------------------Agendamentos de Entrada
//                           IncomingAppointmentsTablet(),
//                         ],

// // ------------------------------------------------
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
// // ------------------------------------------------
//       ),
//     );
//   }
// }
