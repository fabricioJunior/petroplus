import 'package:flutter/material.dart';

import '../../../controllers/vehicle_controler.dart';
import '../../../models/vehicle_model.dart';
import '../../../service_locator.dart';
import '../../../widgets/circular_progress.dart';
import '../../../widgets/vehicle_history_table_widget.dart';

//String inspecionar = "inspecionar";
//String inspecionar = "Aguardando";
String inspecionar = "Desistência";

class ChelistReceptionVehiclesTableTablet extends StatelessWidget {
  
  final bool isAuditPage;
  
  const ChelistReceptionVehiclesTableTablet({
    Key? key,
    this.isAuditPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      color: Color.fromARGB(136, 255, 255, 255),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Flexible(
                flex: 3,
                child: Center(
                  child: Text(
                    'PLACA',
                    style: TextStyle(
                      color: Color.fromARGB(139, 46, 44, 52),
                      fontSize: 14,
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
                    'VEÍCULO',
                    style: TextStyle(
                      color: Color.fromARGB(139, 46, 44, 52),
                      fontSize: 14,
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
                    'DATA',
                    style: TextStyle(
                      color: Color.fromARGB(139, 46, 44, 52),
                      fontSize: 14,
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
            height: 290,
            color: Color.fromARGB(255, 255, 255, 255),
            // --------------------Inicio Loop Back
            child: FutureBuilder<List<VehicleModel>>(
              future: locator.get<VehicleController>().getVehicles(),
              builder: (context, snapshot) {
                
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return buildCircularProgress();
                }

                if (snapshot.hasData) {

                  final vehicles = snapshot.data;

                  return ListView.builder(
                    itemCount: vehicles?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height: 5),
                          ConteudoVeiculoDashboard(
                            vehicleModel: vehicles![index],
                            placaVeiculo: (vehicles[index].licensePlate ?? ""),
                            modeloVeiculo: (vehicles[index].vehicleModelId.toString()),
                            dataVeiculo: (vehicles[index].vehicleYear),
                          ),
                          Container(
                            height: 5,
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return Center(child: Text('Nenhum veículo encontrado'));
                }

              }
            ),
          ),
        ],
      ),
    );
  }
}

class ChelistReceptionVehiclesTableMobile extends StatefulWidget {
  final bool isAuditPage;
  const ChelistReceptionVehiclesTableMobile({Key? key, this.isAuditPage = false}) : super(key: key);

  @override
  State<ChelistReceptionVehiclesTableMobile> createState() => _ChelistReceptionVehiclesTableMobileState();
}

class _ChelistReceptionVehiclesTableMobileState extends State<ChelistReceptionVehiclesTableMobile> {

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
                  child: FutureBuilder<List<VehicleModel>>(
                    future: locator.get<VehicleController>().getVehicles(),
                    builder: (context, snapshot) {
                      
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return buildCircularProgress();
                      }

                      if (snapshot.hasData) {

                        final vehicles = snapshot.data;

                        return ListView.builder(
                          itemCount: vehicles?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(height: 5),
                                ConteudoVeiculoDashboard(
                                  vehicleModel: vehicles![index],
                                  placaVeiculo: (vehicles[index].licensePlate ?? ""),
                                  modeloVeiculo: (vehicles[index].vehicleModelId.toString()),
                                  dataVeiculo: (vehicles[index].vehicleYear),
                                ),
                                Container(
                                  height: 5,
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        return Center(child: Text('Nenhum veículo encontrado'));
                      }

                    }
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
