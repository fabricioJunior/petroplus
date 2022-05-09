import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petroplus/pages/service_menu_page/service_menu_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:petroplus/pages/add_passenger/add_passenger_page.dart';

import '../../../widgets/appbar_uni_widget.dart';
import '../drawer_menu.dart/navigation_drawer_menu.dart';

class AnaliseVeiculoRotaMap {}

class EndReceptionPage extends StatefulWidget {
  final String? nomeCliente;
  final String? email;
  final String? celular;

  const EndReceptionPage({
    Key? key,
    required this.nomeCliente,
    required this.email,
    required this.celular,
  }) : super(key: key);

  @override
  State<EndReceptionPage> createState() => _EndReceptionPageState();
}

class _EndReceptionPageState extends State<EndReceptionPage> {
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

  String _placaVehicleDataTrue = "";
  String? _contatoVehicleDataTrue;
  String? _emailVehicleDataTrue;
  String? _modeloVehicleDataTrue;
  String? _nomeVehicleDataTrue;
  String? _statusVehicleDataTrue;

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
                            contatoClienteTrue: widget.celular ??
                                "Contato não cadastrado",
                            emailClienteTrue:
                                widget.email ?? "Email não cadastrado",
                            modeloClienteTrue: _modeloVehicleDataTrue ??
                                "Modelo não cadastrado",
                            nomeClienteTrue:
                                widget.nomeCliente ?? "Nome não cadastrado",
                            placaClienteTrue: _placaVehicleDataTrue,
                            statusClienteTrue: _statusVehicleDataTrue ??
                                " Status não cadastrado",
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            child: Image(
                                image: AssetImage(
                                    "assets/img/controleCadastroTrue01.png")),
                          ),
                          MyStatefulWidget(),
                          // Text(_teste),
                          // ElevatedButton(
                          //   child: Container(),
                          //   onPressed: () {
                          //     loadProducts();
                          //   },
                          // ),
                          //Text(analiseVeiculoRota.loadProducts().localizaoDoCliente.toString()),
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
                                              primary: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                            onPressed: () {},
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  24, 11, 24, 11),
                                              child: Text(
                                                'Voltar',
                                                style: TextStyle(
                                                    fontFamily: 'Manrope',
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 255, 81, 0)),
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
                                          primary:Color.fromARGB(255, 255, 81, 0),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) {
                                              return ServiceMenuPage();
                                            })
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              24, 11, 24, 11),
                                          child: Text(
                                            'Finalizar',
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
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 255, 81, 0),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) {
                                              return ServiceMenuPage();
                                            })
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 11, 10, 11),
                                          child: Text(
                                            'Finalizar e Abrir OS',
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
                      fontSize: 18,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
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

class MyStatefulWidget extends StatelessWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                "Finalizar Recepção",
                style: TextStyle(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.normal,
                    fontSize: 36,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
          // MyStatefulWidgetInco(),
          MyStatefulWidgetPartesInter(),
          MyStatefulWidgetPainel(),

          // MyStatefulWidgetPartesExter(),
        ],
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItemsPainel(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidgetInco extends StatefulWidget {
  const MyStatefulWidgetInco({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidgetInco> createState() => _MyStatefulWidgetIncoState();
}

class _MyStatefulWidgetIncoState extends State<MyStatefulWidgetInco> {
  final List<Item> _data = generateItemsPainel(1);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return Column(
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text("Inconvenientes"),
                );
              },
              body: ListTile(
                title: Text(""),
                subtitle: Column(
                  children: [Text("+ Adicionar Item")],
                ),
                // trailing: const Icon(Icons.delete),
                onTap: () {},
                //   setState(() {
                //     _data.removeWhere((Item currentItem) => item == currentItem);
                //   });
                // }
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class Item02 {
  Item02({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItemspainel(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidgetPainel extends StatefulWidget {
  const MyStatefulWidgetPainel({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidgetPainel> createState() => _MyStatefulWidgetPainelState();
}

class _MyStatefulWidgetPainelState extends State<MyStatefulWidgetPainel> {
  final List<Item> _data = generateItemspainel(1);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return Column(
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text("CheckList"),
                );
              },
              body: ListTile(
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .48,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.add_task,
                                    color: Color(0xff20C9AC),
                                  ),
                                  Container(
                                    width: 10,
                                  ),
                                  Text(
                                    "Hodômetro",
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                              Container(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.add_task,
                                    color: Color(0xff20C9AC),
                                  ),
                                  Container(
                                    width: 10,
                                  ),
                                  Text(
                                    "Combustível",
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.speed,
                                    color: Color(0xffFF6601),
                                  ),
                                  Container(
                                    width: 10,
                                  ),
                                  Text(
                                    "10.546 KM",
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                              Container(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.speed,
                                    color: Color(0xffFF6601),
                                  ),
                                  Container(
                                    width: 10,
                                  ),
                                  Text(
                                    "10.546 KM",
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // trailing: const Icon(Icons.delete),
                onTap: () {},
                //   setState(() {
                //     _data.removeWhere((Item currentItem) => item == currentItem);
                //   });
                // }
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class Item03 {
  Item03({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItemspainel3(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidgetPartesInter extends StatefulWidget {
  const MyStatefulWidgetPartesInter({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidgetPartesInter> createState() =>
      _MyStatefulWidgetPartesInterState();
}

class _MyStatefulWidgetPartesInterState
    extends State<MyStatefulWidgetPartesInter> {
  final List<Item> _data = generateItemspainel3(1);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return Column(
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text("Inconvenientes"),
                );
              },
              body: ListTile(
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .48,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.add_task,
                                    color: Color(0xff20C9AC),
                                  ),
                                  Container(
                                    width: 10,
                                  ),
                                  Text(
                                    "Manuais",
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                              Container(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.add_task,
                                    color: Color(0xff20C9AC),
                                  ),
                                  Container(
                                    width: 10,
                                  ),
                                  Text(
                                    "Tapetes",
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                              Container(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.add_task,
                                    color: Color.fromARGB(255, 122, 122, 122),
                                  ),
                                  Container(
                                    width: 10,
                                  ),
                                  Text(
                                    "Rádio",
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_box,
                                        color: Color(0xffFF6601),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "Sim",
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 34, 34, 34),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.crop_3_2,
                                        color: Color.fromARGB(255, 3, 1, 0),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "Sim",
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.crop_3_2,
                                        color: Color.fromARGB(255, 3, 1, 0),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "Sim",
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.crop_3_2,
                                        color: Color.fromARGB(255, 34, 34, 34),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "Não",
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 34, 34, 34),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_box,
                                        color: Color(0xffFF6601),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "Não",
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.crop_3_2,
                                        color: Color.fromARGB(255, 3, 1, 0),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "Não",
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.chat_bubble_outline,
                                        color: Color.fromARGB(255, 34, 34, 34),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 34, 34, 34),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.chat_bubble_outline,
                                        color: Color(0xffFF6601),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.chat_bubble_outline,
                                        color: Color.fromARGB(255, 3, 1, 0),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.attachment,
                                        color: Color.fromARGB(255, 34, 34, 34),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 34, 34, 34),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.attachment,
                                        color: Color(0xffFF6601),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.attachment,
                                        color: Color.fromARGB(255, 3, 1, 0),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // trailing: const Icon(Icons.delete),
                onTap: () {},
                //   setState(() {
                //     _data.removeWhere((Item currentItem) => item == currentItem);
                //   });
                // }
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class Item04 {
  Item04({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItemspainel4(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidgetPartesExter extends StatefulWidget {
  const MyStatefulWidgetPartesExter({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidgetPartesExter> createState() =>
      _MyStatefulWidgetPartesExterState();
}

class _MyStatefulWidgetPartesExterState
    extends State<MyStatefulWidgetPartesExter> {
  final List<Item> _data = generateItemspainel4(1);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return Column(
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text("Partes Externas  e Segurança"),
                );
              },
              body: ListTile(
                title: Text(""),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .48,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.add_task,
                                    color: Color(0xff20C9AC),
                                  ),
                                  Container(
                                    width: 10,
                                  ),
                                  Text(
                                    "Hodômetro",
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                              Container(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.add_task,
                                    color: Color(0xff20C9AC),
                                  ),
                                  Container(
                                    width: 10,
                                  ),
                                  Text(
                                    "Combustível",
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.speed,
                                    color: Color(0xffFF6601),
                                  ),
                                  Container(
                                    width: 10,
                                  ),
                                  Text(
                                    "10.546 KM",
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                              Container(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.speed,
                                    color: Color(0xffFF6601),
                                  ),
                                  Container(
                                    width: 10,
                                  ),
                                  Text(
                                    "10.546 KM",
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // trailing: const Icon(Icons.delete),
                onTap: () {},
                //   setState(() {
                //     _data.removeWhere((Item currentItem) => item == currentItem);
                //   });
                // }
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ],
    );
  }
}
