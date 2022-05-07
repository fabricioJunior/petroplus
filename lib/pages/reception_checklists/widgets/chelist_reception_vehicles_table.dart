import 'package:flutter/material.dart';

import '../../../widgets/vehicle_history_table_widget.dart';
import '../../dashboard_page/controles/state_todo.dart';
import '../../dashboard_page/controles/todo_controler.dart';
import 'vehicle_details_dialog.dart';

//String inspecionar = "inspecionar";
//String inspecionar = "Aguardando";
String inspecionar = "Desistência";

class chelistReceptionVehiclesTableTablet extends StatelessWidget {
  chelistReceptionVehiclesTableTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: Center(
                child: Text(
                  'PLACA',
                  style: TextStyle(
                    color: Color.fromARGB(139, 46, 44, 52),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Center(
                child: Text(
                  'CLIENTE',
                  style: TextStyle(
                    color: Color.fromARGB(139, 46, 44, 52),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Center(
                child: Text(
                  'MARCA/MODELO',
                  style: TextStyle(
                    color: Color.fromARGB(139, 46, 44, 52),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Center(
                child: Text(
                  'DATA AGENDADO',
                  style: TextStyle(
                    color: Color.fromARGB(139, 46, 44, 52),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Center(
                child: Text(
                  'STATUS',
                  style: TextStyle(
                    color: Color.fromARGB(139, 46, 44, 52),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: double.maxFinite,
          height: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(width: 2, color: Color.fromRGBO(235, 234, 237, 1)),
            color: Color.fromARGB(255, 235, 235, 235),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
              WidgetConteudoVeiculoCheclist(),
            ],
          ),
        ),
      ],
    );
  }
}

class ChelistReceptionVehiclesTableMobile extends StatefulWidget {
  final bool isAuditPage;
  const ChelistReceptionVehiclesTableMobile({Key? key, this.isAuditPage = false}) : super(key: key);

  @override
  State<ChelistReceptionVehiclesTableMobile> createState() =>
      _ChelistReceptionVehiclesTableMobileState();
}

class _ChelistReceptionVehiclesTableMobileState
    extends State<ChelistReceptionVehiclesTableMobile> {
  //Para iniciar antes de buildar a tela
  final TodoControler todocontrole = TodoControler();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todocontrole.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Flexible(
                flex: 4,
                child: Center(
                  child: Text(
                    'PLACA',
                    style: TextStyle(
                      color: Color.fromARGB(139, 46, 44, 52),
                      fontSize: 8,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Center(
                  child: Text(
                    'CLIENTE',
                    style: TextStyle(
                      color: Color.fromARGB(139, 46, 44, 52),
                      fontSize: 8,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Center(
                  child: Text(
                    'MARCA/MODELO',
                    style: TextStyle(
                      color: Color.fromARGB(139, 46, 44, 52),
                      fontSize: 8,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Center(
                  child: Text(
                    'DATA AGENDADO',
                    style: TextStyle(
                      color: Color.fromARGB(139, 46, 44, 52),
                      fontSize: 8,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Center(
                  child: Text(
                    'STATUS',
                    style: TextStyle(
                      color: Color.fromARGB(139, 46, 44, 52),
                      fontSize: 8,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.maxFinite,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(width: 2, color: Color.fromRGBO(235, 234, 237, 1)),
              color: Color.fromARGB(255, 235, 235, 235),
            ),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  width: double.maxFinite,
                  height: 290,
                  color: Color.fromARGB(255, 255, 255, 255),
                  // --------------------Inicio Loop Back
                  child: ValueListenableBuilder<StateTodo>(
                    valueListenable: todocontrole,
                    builder: (context, value, _) {
                      final state = value;
                      if (state is StateTodoLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is StateTodoSuccess) {
                        return ListView.builder(
                            itemCount: state.todoSuccess.length,
                            itemBuilder: (context, indice) {
                              return Column(
                                children: [
                                  Container(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context, 
                                        useRootNavigator: true,
                                        builder: (_) => VehicleDetailsDialog(isAuditPage: widget.isAuditPage),
                                      );
                                    },
                                    child: ConteudoVeiculoDashboard(
                                      placaVeiculo: (state.todoSuccess[indice].license_plate ?? ""),
                                      modeloVeiculo: (state.todoSuccess[indice].customer_name),
                                      dataVeiculo: (state.todoSuccess[indice].status),
                                    ),
                                  ),
                                  Container(
                                    height: 5,
                                  ),
                                ],
                              );
                            });
                      }
                      if (state is StateTodoError) {
                        return Center(child: Text(state.todoError));
                      }
                      return Container();
                    },
                  ),
                ),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
                WidgetConteudoVeiculoCheclistMobile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetConteudoVeiculoCheclist extends StatelessWidget {
  WidgetConteudoVeiculoCheclist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            if (inspecionar == "inspecionar") ...[
              // ------------------------------------------------Inspecionar
              ConteudoVeiculoCheclist(
                placaVeiculo: "KLM6J34",
                nomeClienteVeiculo: "Hallan Teste",
                modeloVeiculo: 'Honda Accordo LX',
                dataVeiculo: '10/01/2022 ás 08h30',
                statusVeiculo: '$inspecionar',
                coresTextA: 255,
                coresTextR: 4,
                coresTextG: 190,
                coresTextB: 60,
                fontSizeVeiculo: 10,
              ),
            ],
            // ------------------------------------------------Aguardando
            if (inspecionar == "Aguardando") ...[
              ConteudoVeiculoCheclist(
                placaVeiculo: "KLM6J34",
                nomeClienteVeiculo: "Hallan Teste",
                modeloVeiculo: 'Honda Accordo LX',
                dataVeiculo: '10/01/2022 ás 08h30',
                statusVeiculo: '$inspecionar',
                coresTextA: 255,
                coresTextR: 255,
                coresTextG: 95,
                coresTextB: 0,
                fontSizeVeiculo: 10,
              ),
            ],
            // ------------------------------------------------Desistência
            if (inspecionar == "Desistência") ...[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 243, 243, 243)),
                ),
                onPressed: () {
                  print("Teste");
                },
                child: ConteudoVeiculoCheclist(
                  placaVeiculo: "KLM6J34",
                  nomeClienteVeiculo: "Hallan Teste",
                  modeloVeiculo: 'Honda Accordo LX',
                  dataVeiculo: '10/01/2022 ás 08h30',
                  statusVeiculo: '$inspecionar',
                  coresTextA: 255,
                  coresTextR: 255,
                  coresTextG: 0,
                  coresTextB: 0,
                  fontSizeVeiculo: 10,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class WidgetConteudoVeiculoCheclistMobile extends StatelessWidget {
  WidgetConteudoVeiculoCheclistMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            if (inspecionar == "inspecionar") ...[
              // ------------------------------------------------Inspecionar
              ConteudoVeiculoCheclist(
                placaVeiculo: "KLM6J34",
                nomeClienteVeiculo: "Hallan Teste",
                modeloVeiculo: 'Honda Accordo LX',
                dataVeiculo: '10/01/2022 ás 08h30',
                statusVeiculo: '$inspecionar',
                coresTextA: 255,
                coresTextR: 4,
                coresTextG: 190,
                coresTextB: 60,
                fontSizeVeiculo: 10,
              ),
            ],
            // ------------------------------------------------Aguardando
            if (inspecionar == "Aguardando") ...[
              ConteudoVeiculoCheclist(
                placaVeiculo: "KLM6J34",
                nomeClienteVeiculo: "Hallan Teste",
                modeloVeiculo: 'Honda Accordo LX',
                dataVeiculo: '10/01/2022 ás 08h30',
                statusVeiculo: '$inspecionar',
                coresTextA: 255,
                coresTextR: 255,
                coresTextG: 95,
                coresTextB: 0,
                fontSizeVeiculo: 8,
              ),
            ],
            // ------------------------------------------------Desistência
            if (inspecionar == "Desistência") ...[
              ConteudoVeiculoCheclist(
                placaVeiculo: "KLM6J34",
                nomeClienteVeiculo: "Hallan Teste",
                modeloVeiculo: 'Honda Accordo LX',
                dataVeiculo: '10/01/2022 ás 08h30',
                statusVeiculo: '$inspecionar',
                coresTextA: 255,
                coresTextR: 255,
                coresTextG: 0,
                coresTextB: 0,
                fontSizeVeiculo: 8,
              ),
            ],
          ],
        );
      },
    );
  }
}
