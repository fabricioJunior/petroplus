import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/order_repository.dart';
import '../../service_locator.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../blocs/add_passager_bloc/add_passager_bloc.dart';
import '../drawer_menu.dart/navigation_drawer_menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../vehicle_data_pages/vehicle_data_false/vehicle_data_false.dart';
import '../vehicle_data_pages/vehicle_data_true/vehicle_data_true.dart';

class AnaliseVeiculoRota {
  Future<dynamic> loadProducts() async {
    // final TextEditingController analiseVeiculoRota = TextEditingController();
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");
    String placaMocado = "HAS5555";
    // String placaMocado = _analisePlacaInterno.text.toString();
    // print("No loand produtos $placaMocado");
    String localizaoDoCliente;

    final response = await http.get(
        Uri.parse(
          "https://petroplus-api-dev.herokuapp.com/v1/orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT",
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    Map<String, dynamic> data = jsonDecode(response.body);
    int controleLoop = data["meta"]["totalItems"];

    for (var o = 0; o <= controleLoop; o++) {
      String? licenseplate = data["items"][o]["license_plate"];
      if (licenseplate == placaMocado) {
        localizaoDoCliente = o.toString();
        // print(localizaoDoCliente);
        return localizaoDoCliente;
      }
      if (o == (controleLoop - 1)) {
        localizaoDoCliente = "NãoTemPlacaRegistrada";
        // print(localizaoDoCliente);
        return localizaoDoCliente;
      }
    }
  }
}

class AddPassenger extends StatelessWidget {
  AddPassenger({Key? key}) : super(key: key);

  final AnaliseVeiculoRota analiseVeiculoRota = AnaliseVeiculoRota();

  final TextEditingController analisePlacaInterno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPassagerBloc, AddPassagerState>(
      bloc: locator.get<AddPassagerBloc>(),
      listenWhen: (previous, current) =>
          current is AddPassagerCheckOrderByLicensePlateSucess,
      listener: (context, state) {
        var _state = state as AddPassagerCheckOrderByLicensePlateSucess;
        if (_state.containsOrder) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VehicleData()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VehicleDataFalse(licensePlate: analisePlacaInterno.text)),
          );
        }
      },
      child: Scaffold(
        drawer: const NavigationDrawerPagina(),
        // ------------------------------------------------Logo
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/fundo1.png'),
              fit: BoxFit.cover,
            ),
          ),
          // Fundo Branco
          child: Center(
            child: Container(
              width: 400,
              height: 400,
              color: const Color.fromARGB(255, 252, 252, 252),
              // Conteudo
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Logo

                  // ------------------------------------------------Entrar
                  Container(
                    width: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Adicionar Passante',
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ------------------------------------------------Espaço
                  Container(
                    height: 10,
                  ),
                  // ------------------------------------------------Input
                  Container(
                    width: 280,
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/img/placaMaior.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: TextFormField(
                                onChanged: (value) {
                                  print(value);
                                },
                                controller: analisePlacaInterno,
                                // controller: analiseVeiculoRota.analisePlacaInterno,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 35,
                                    color: Color.fromARGB(255, 33, 32, 34)),
                                decoration: InputDecoration(
                                  labelText: 'DIGITE A PLACA',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(0, 255, 81, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            height: 20,
                          ),

                          // ------------------------------------------------Forgot/Sing
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 255, 81, 0),
                              ),
                              onPressed: () async {
                                var order = await locator.get<OrderRepository>().getOrderByLicensePlate(analisePlacaInterno.text);

                                if (order != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => VehicleData()),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VehicleDataFalse(licensePlate: analisePlacaInterno.text),
                                    ),
                                  );
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(24, 11, 24, 11),
                                child: Text(
                                  'Iniciar Recepção',
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 255, 255, 255),
                              ),
                              onPressed: () async {
                                var order = await locator.get<OrderRepository>().getOrderByLicensePlate(
                                  analisePlacaInterno.text,
                                );
                                if (order != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VehicleData()),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VehicleDataFalse(licensePlate: analisePlacaInterno.text),
                                    ),
                                  );
                                }
                                // addPassagerBloc.add(
                                //   AddPassagerCheckedOrderByLicensePlate(
                                //     analisePlacaInterno.text,
                                //   ),
                                // );
                              },
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(24, 11, 24, 11),
                                child: Text(
                                  'Visualizar Cardápio',
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    color: Color.fromARGB(255, 255, 81, 0),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
