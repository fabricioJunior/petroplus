import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petroplus/models/maker_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/order_controller.dart';
import '../../../models/vmodel_model.dart';
import '../../../service_locator.dart';
import '../../../widgets/appbar_uni_widget.dart';
import '../../add_passenger/add_passenger_page.dart';
import '../../drawer_menu.dart/navigation_drawer_menu.dart';
import '../vehicle_data_true/vehicle_data_true.dart';

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
  String _contatoVehicleDataTrue = "Contato";
  String _emailVehicleDataTrue = "Email";
  String _modeloVehicleDataTrue = "Modelo";
  String _nomeVehicleDataTrue = "Nome";
  String _statusVehicleDataTrue = "Status";

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

    // if (controleLoop["address_number"] == null) {
    //   _contatoVehicleDataTrue = controleLoop["address_number"];
    // } else {
    //   _contatoVehicleDataTrue = controleLoop["address_number"].toString();
    // }

    // if (controleLoop["email"] == null) {
    //   _emailVehicleDataTrue = controleLoop["email"];
    // } else {
    //   _emailVehicleDataTrue = controleLoop["email"].toString();
    // }

    if (controleLoop["vehicle_model_id"] == null) {
      _modeloVehicleDataTrue = controleLoop["vehicle_model_id"];
    } else {
      _modeloVehicleDataTrue = controleLoop["vehicle_model_id"].toString();
    }

    // if (controleLoop["customer_name"] == null) {
    //   _nomeVehicleDataTrue = controleLoop["customer_name"];
    // } else {
    //   _nomeVehicleDataTrue = controleLoop["customer_name"].toString();
    // }

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
              child: SizedBox(
                // width: MediaQuery.of(context).size.width * .9,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    var isTablet = constraints.maxWidth > 500;
                    return Column(
                      children: [
// ------------------------------------------------Body/Tablet
                        if (!isTablet) ...[
                          // ------------------------------------------------Checklists de Recep????o

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
                          FormularioDeEntradaPostVeiculo(
                            onCellChanged: (value) => setState(() {
                              _contatoVehicleDataTrue = value;
                            }),
                            onNameChanged: (value) => setState(() {
                              _nomeVehicleDataTrue = value;
                            }),
                            onEmailChanged: (value) => setState(() {
                              _emailVehicleDataTrue = value;
                            }),
                            nomeCliente: _nomeVehicleDataTrue,
                            email: _emailVehicleDataTrue,
                            celular: _contatoVehicleDataTrue,
                            placaCliente: widget.licensePlate,
                          ),
                        ],
// ------------------------------------------------Body/Mobile
                        if (!isTablet) ...[
                          // ------------------------------------------------Checklists de Recep????o
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
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: SizedBox(
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
                        // fit: BoxFit.contain,
                      ),
                    ),
                    child: Center(
                      child: placaClienteTrue == null
                          ? CircularProgressIndicator()
                          : Text(
                              placaClienteTrue?.toUpperCase() ?? 'SEM PLACA',
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
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$nomeClienteTrue",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(height: 3),
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
                      Container(width: 3),
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
                  Container(height: 3),
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
            child: SizedBox(
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
final TextEditingController combustivelTextController = TextEditingController();
final TextEditingController modeloTextController = TextEditingController();
final TextEditingController corTextController = TextEditingController();
final TextEditingController kilometragemTextController =
    TextEditingController();

Gasolina? gasolinaSelecionada;
MakerModel? markModelSelecionada;
VModelModel? modelSelect;

class FormularioDeEntradaPostVeiculo extends StatelessWidget {
  final Function(String) onNameChanged;
  final Function(String) onCellChanged;
  final Function(String) onEmailChanged;

  final String? nomeCliente;
  final String? celular;
  final String? placaCliente;
  final String? email;

  FormularioDeEntradaPostVeiculo(
      {Key? key,
      required this.onNameChanged,
      required this.onCellChanged,
      required this.onEmailChanged,
      required this.nomeCliente,
      required this.email,
      required this.celular,
      required this.placaCliente})
      : super(key: key);
  final preferences = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: _sucessState(context),
    );
  }

  Widget _loadState() {
    return CircularProgressIndicator();
  }

  Widget _sucessState(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            children: [
              SizedBox(
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
                                  "Dados do Ve??culo",
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
                                _marcaTextFormField([]),
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
                                  "Combust??vel",
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
                                _modeloTextFormField([]),
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
              _DadosDoCliente(
                onNameChanged: onNameChanged,
                onCellChanged: onCellChanged,
                onEmailChanged: onEmailChanged,
              ),
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
                                onPressed: () => Navigator.of(context).pop(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(24, 11, 24, 11),
                                  child: Text(
                                    'Sair',
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 255, 81, 0)),
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
                              var result =
                                  await locator.get<OrderController>().post(
                                        nomeCompletoController.text,
                                        cpfController.text,
                                        celularController.text,
                                        emailController.text,
                                        anoTextController.text,
                                        corTextController.text,
                                        _licensePlate,
                                        kilometragemTextController.text,
                                        int.parse(
                                          gasolinaSelecionada?.code ?? '1',
                                        ),
                                      );
                              if (result) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VehicleData(
                                            nomeCliente: nomeCliente,
                                            email: email,
                                            celular: celular,
                                            placaCliente: placaCliente,
                                          )),
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
    );
  }

  Widget _errorState() {
    return Text('Error ao carregar informa????es');
  }

  Widget _marcaTextFormField(List<MakerModel> models) {
    return MarksDropdown(models);
  }

  Widget _modeloTextFormField(List<VModelModel> models) {
    return _ModelsDropdown(models);
  }

  Widget _gasolinaSelect() {
    return _GasolinaDropdown();
  }

  Widget _anoTextFormField() {
    return TextFormField(
      controller: anoTextController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _corTextFormField() {
    return TextFormField(
      controller: corTextController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _kilometragemTextFormField() {
    return TextFormField(
      controller: kilometragemTextController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

class MarksDropdown extends StatefulWidget {
  final List<MakerModel> models;

  MarksDropdown(this.models, {Key? key}) : super(key: key);

  @override
  State<MarksDropdown> createState() => _MarksDropdownState();
}

class _MarksDropdownState extends State<MarksDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x0FE8DEF2),
      child: DropdownButton<MakerModel>(
        value: widget.models[0],
        elevation: 16,
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        onChanged: (MakerModel? newValue) {
          setState(() {
     
          });
        },
        items: widget.models
            .map<DropdownMenuItem<MakerModel>>((MakerModel value) {
              return DropdownMenuItem<MakerModel>(
                value: value,
                child: Text(value.name ?? ''),
              );
            })
            .toSet()
            .toList(),
      ),
    );
  }
}

class _ModelsDropdown extends StatefulWidget {
  final List<VModelModel> models;

  const _ModelsDropdown(this.models, {Key? key}) : super(key: key);

  @override
  State<_ModelsDropdown> createState() => _ModelsDropdownState();
}

class _ModelsDropdownState extends State<_ModelsDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(15, 232, 222, 242),
      child: DropdownButton<VModelModel>(
        value: widget.models.isNotEmpty ? widget.models.first : null,
        elevation: 16,
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        onChanged: (VModelModel? newValue) {
          setState(() {
          });
        },
        items: widget.models.map<DropdownMenuItem<VModelModel>>((VModelModel value) {
          return DropdownMenuItem<VModelModel>(
            value: value,
            child: Text(value.name ?? ''),
          );
        }).toList(),
      ),
    );
  }
}

class _GasolinaDropdown extends StatefulWidget {
  const _GasolinaDropdown({Key? key}) : super(key: key);

  @override
  State<_GasolinaDropdown> createState() => _GasolinaDropdownState();
}

class _GasolinaDropdownState extends State<_GasolinaDropdown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(15, 232, 222, 242),
      child: DropdownButton<Gasolina>(
        value: gasolinaSelecionada,
        elevation: 16,
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        onChanged: (Gasolina? newValue) {
          setState(() {
            gasolinaSelecionada = newValue!;
          });
        },
        items: [Gasolina('1', 'Gasolina'), Gasolina('2', 'Alcool')]
            .map<DropdownMenuItem<Gasolina>>((Gasolina value) {
          return DropdownMenuItem<Gasolina>(
            value: value,
            child: Text(value.nome),
          );
        }).toList(),
      ),
    );
  }
}

class _DadosDoCliente extends StatefulWidget {
  final Function(String) onNameChanged;
  final Function(String) onCellChanged;
  final Function(String) onEmailChanged;

  const _DadosDoCliente({
    Key? key,
    required this.onNameChanged,
    required this.onCellChanged,
    required this.onEmailChanged,
  }) : super(key: key);

  @override
  State<_DadosDoCliente> createState() => _DadosDoClienteState();
}

class _DadosDoClienteState extends State<_DadosDoCliente> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                      _nomeCompletoTextField(widget.onNameChanged),
                      Text(
                        "Celular",
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      _celularTextField(widget.onCellChanged),
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
                      _emailTextField(widget.onEmailChanged),
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

  Widget _nomeCompletoTextField(Function(String) onNameChanged) {
    return TextFormField(
      controller: nomeCompletoController,
      onChanged: (value) {
        setState(() {
          onNameChanged(nomeCompletoController.text);
        });
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _cpjTextField() {
    return TextFormField(
      controller: cpfController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _celularTextField(Function(String) onCellChanged) {
    return TextFormField(
      controller: celularController,
      onChanged: (value) {
        setState(() {
          onCellChanged(celularController.text);
        });
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _emailTextField(Function(String) onEmailChanged) {
    return TextFormField(
      controller: emailController,
      onChanged: (value) {
        setState(() {
          onEmailChanged(emailController.text);
        });
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

class Gasolina extends Equatable {
  final String code;
  final String nome;

  Gasolina(this.code, this.nome);

  @override
  List<Object?> get props => [code, nome];
}
