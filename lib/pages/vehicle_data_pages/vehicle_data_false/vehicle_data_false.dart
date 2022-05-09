import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../controllers/add_order_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../vehicle_data_true/vehicle_data_true.dart';

import '../../../service_locator.dart';
import '../../../widgets/appbar_uni_widget.dart';
import '../../add_passenger/add_passenger_page.dart';
import '../../drawer_menu.dart/navigation_drawer_menu.dart';

// class AnaliseVeiculoRotaMap {}

late String _licensePlate;

class VehicleDataFalse extends StatefulWidget {
  final String licensePlate;

  VehicleDataFalse({
    Key? key,
    required this.licensePlate,
  }) : super(key: key) {
    _licensePlate = licensePlate;
  }

  @override
  State<VehicleDataFalse> createState() => _VehicleDataFalseState();
}

class _VehicleDataFalseState extends State<VehicleDataFalse> {
  final AnaliseVeiculoRota analiseVeiculoRota = AnaliseVeiculoRota();

  String _teste = "";

  @override
  void initState() {
    super.initState();
    pegarTeste();
    AnaliseVeiculoRotaMap();
  }

  Future<void> pegarTeste() async {
    _teste = await analiseVeiculoRota.loadProducts();
    await loadProducts();
    setState(() {});
  }

  String _placaVehicleDataTrue = "Placa";
  String? _contatoVehicleDataTrue = "Contato";
  String? _emailVehicleDataTrue = "Email";
  String? _modeloVehicleDataTrue = "Modelo";
  String? _nomeVehicleDataTrue = "Nome";
  String? _statusVehicleDataTrue = "Status";

  Future<dynamic> loadProducts() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");
    int mapitemRetorno = int.parse(_teste);

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
    Map controleLoop = data["items"][mapitemRetorno];

    if (controleLoop["address_number"] == null) {
      _contatoVehicleDataTrue = controleLoop["address_number"];
    } else {
      _contatoVehicleDataTrue = controleLoop["address_number"].toString();
    }

    if (controleLoop["email"] == null) {
      _emailVehicleDataTrue = controleLoop["email"];
    } else {
      _emailVehicleDataTrue = controleLoop["email"].toString();
    }

    if (controleLoop["vehicle_model_id"] == null) {
      _modeloVehicleDataTrue = controleLoop["vehicle_model_id"];
    } else {
      _modeloVehicleDataTrue = controleLoop["vehicle_model_id"].toString();
    }

    if (controleLoop["customer_name"] == null) {
      _nomeVehicleDataTrue = controleLoop["customer_name"];
    } else {
      _nomeVehicleDataTrue = controleLoop["customer_name"].toString();
    }

    if (controleLoop["status"] == null) {
      _statusVehicleDataTrue = controleLoop["status"];
    } else if (controleLoop["status"] == "AWAT") {
      _statusVehicleDataTrue = "Esperando";
    }

    if (controleLoop["license_plate"] == null) {
      _placaVehicleDataTrue = controleLoop["license_plate"];
    } else {
      _placaVehicleDataTrue = controleLoop["license_plate"].toString();
    }

    print("$controleLoop");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerPagina(),
// ------------------------------------------------Corpo
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ----------------------AppBar
            AppBarUniv(),
            // ----------------------

            Center(
              child: Container(
                // width: MediaQuery.of(context).size.width * .9,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    var isTablet = constraints.maxWidth > 500;
                    return Column(
                      children: [
// ------------------------------------------------Body/Tablet
                        if (isTablet) ...[
                          // ------------------------------------------------Checklists de Recepção

                          BarraHistoricoVeiculo(
                            contatoClienteTrue: _contatoVehicleDataTrue,
                            emailClienteTrue: _emailVehicleDataTrue,
                            modeloClienteTrue: _modeloVehicleDataTrue,
                            nomeClienteTrue: _nomeVehicleDataTrue,
                            placaClienteTrue: widget.licensePlate,
                            statusClienteTrue: _statusVehicleDataTrue,
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Color.fromARGB(34, 107, 107, 107),
                          ),
                          FormularioDeEntradaPostVeiculo(),
                        ],
// ------------------------------------------------Body/Mobile
                        if (!isTablet) ...[
                          // ------------------------------------------------Checklists de Recepção
                          // BarraHistoricoVeiculo(),
                        ],
// ------------------------------------------------
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
// ------------------------------------------------
      ),
    );
  }
}

class BarraHistoricoVeiculo extends StatelessWidget {
  BarraHistoricoVeiculo(
      {Key? key,
      this.contatoClienteTrue,
      this.emailClienteTrue,
      this.modeloClienteTrue,
      this.nomeClienteTrue,
      this.placaClienteTrue,
      this.statusClienteTrue})
      : super(key: key);

  String? placaClienteTrue;
  String? nomeClienteTrue;
  String? modeloClienteTrue;
  String? emailClienteTrue;
  String? contatoClienteTrue;
  String? statusClienteTrue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    // width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/placaTrue.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Center(
                      child: placaClienteTrue == null
                          ? CircularProgressIndicator()
                          : Text(
                              "$placaClienteTrue",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                    ),
                  ),
                  Container(
                    height: 15,
                  ),
                  Text(
                    "$statusClienteTrue",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w800,
                      color: Color(0xffFFA043),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$nomeClienteTrue",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    "$modeloClienteTrue",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "eMail:",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        width: 3,
                      ),
                      Text(
                        "$emailClienteTrue",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "Celular:",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        width: 3,
                      ),
                      Text(
                        "$contatoClienteTrue",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    // width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/Model3.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Container(),
                  ),
                  Container(
                    height: 8,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 223, 223, 223),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      // textStyle: TextStyle(
                      //     fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Model3",
                      style: TextStyle(
                        color: Color.fromARGB(255, 2, 0, 0),
                        fontSize: 15,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final TextEditingController nomeCompletoController = TextEditingController();
final TextEditingController cpfController = TextEditingController();
final TextEditingController celularController = TextEditingController();
final TextEditingController emailController = TextEditingController();

final TextEditingController marcaTextController = TextEditingController();
final TextEditingController anoTextController = TextEditingController();
final TextEditingController modeloTextController = TextEditingController();
final TextEditingController corTextController = TextEditingController();
final TextEditingController kilometragemTextController =
    TextEditingController();

Gasolina? gasolinaSelecionada;

class FormularioDeEntradaPostVeiculo extends StatelessWidget {
  FormularioDeEntradaPostVeiculo({Key? key}) : super(key: key);
  final preferences = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dados do Veículo",
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                  ),
                                  Text(
                                    "Marca",
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  _marcaTextFormField(),
                                  Text(
                                    "Ano",
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  _anoTextFormField(),
                                  Text(
                                    "Combustível",
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  _gasolinaSelect(),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "",
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                  ),
                                  Text(
                                    "Modelo",
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  _modeloTextFormField(),
                                  Text(
                                    "Cor",
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  _corTextFormField(),
                                  Text(
                                    "Kilometragem",
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  _kilometragemTextFormField(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                ),
                _DadosDoCliente(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              color: Color.fromARGB(255, 255, 81, 0),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  onPressed: () {},
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(24, 11, 24, 11),
                                    child: Text(
                                      'Sair',
                                      style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 255, 81, 0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 255, 81, 0),
                              ),
                              onPressed: () async {
                                var result = await locator
                                    .get<AddOrderController>()
                                    .onCreateNewOrder(
                                      nomeCompletoController.text,
                                      cpfController.text,
                                      celularController.text,
                                      emailController.text,
                                      '${anoTextController.text}-${gasolinaSelecionada?.code}',
                                      corTextController.text,
                                      _licensePlate,
                                      kilometragemTextController.text,
                                    );
                                if (result) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VehicleData()),
                                  );
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(24, 11, 24, 11),
                                child: Text(
                                  'Cadastrar Passante',
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _marcaTextFormField() {
    return TextFormField(
      controller: marcaTextController,
    );
  }

  Widget _modeloTextFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _gasolinaSelect() {
    return DropdownButton<Gasolina>(
        items: [
          DropdownMenuItem<Gasolina>(
              value: Gasolina('1', 'Gasolina'), child: Text('Gasolina')),
          DropdownMenuItem<Gasolina>(
              value: Gasolina('2', 'Alcool'), child: Text('Alcool'))
        ],
        onChanged: (gasolina) {
          gasolinaSelecionada = gasolina;
        });
  }

  Widget _anoTextFormField() {
    return TextFormField(
      controller: anoTextController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _corTextFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
        fontSize: 12,
      ),
    );
  }

  Widget _kilometragemTextFormField() {
    return TextFormField(
      controller: kilometragemTextController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

class Gasolina {
  final String code;
  final String nome;

  Gasolina(this.code, this.nome);
}

class _DadosDoCliente extends StatelessWidget {
  _DadosDoCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Dados do Cliente",
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.normal,
                          fontSize: 30,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Text(
                        "Nome Completo",
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      _nomeCompletoTextField(),
                      Text(
                        "Celular",
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      _celularTextField(),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.normal,
                          fontSize: 30,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Text(
                        "CPF/CNPJ",
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      _cpjTextField(),
                      Text(
                        "e-Mail",
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      _emailTextField(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _nomeCompletoTextField() {
    return TextFormField(
      controller: nomeCompletoController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _cpjTextField() {
    return TextFormField(
      controller: cpfController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _celularTextField() {
    return TextFormField(
      controller: celularController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      controller: emailController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
