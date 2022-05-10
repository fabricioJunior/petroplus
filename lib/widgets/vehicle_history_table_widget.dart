import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:petroplus/controllers/vehicle_controler.dart';
import 'package:petroplus/widgets/circular_progress.dart';
import '../models/vehicle_model.dart';
import '../pages/reception_checklists/widgets/vehicle_details_dialog.dart';
import '../service_locator.dart';

double porcentagemVendas = 30;
double revisaoVendas = 50;

class IncomingAppointmentsTablet extends StatefulWidget {
  const IncomingAppointmentsTablet({Key? key}) : super(key: key);

  @override
  State<IncomingAppointmentsTablet> createState() =>
      _IncomingAppointmentsTabletState();
}

class _IncomingAppointmentsTabletState extends State<IncomingAppointmentsTablet> {

// __________________________________________________
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
      child: Row(
        children: [
          Flexible(
            flex: 15,
            child: Container(
              height: 400,
              color: Color.fromARGB(135, 223, 223, 223),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Agendamentos de entrada',
                                style: TextStyle(
                                  color: Color(0xFF2E2C34),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Veja as tarefas em uma folha',
                                style: TextStyle(
                                  color: Color.fromARGB(139, 46, 44, 52),
                                  fontSize: 10,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.autorenew_outlined,
                                    color: Color.fromARGB(255, 73, 73, 73),
                                    size: 18,
                                  ),
                                  Text(
                                    'Atualização',
                                    style: TextStyle(
                                      color: Color.fromARGB(139, 46, 44, 52),
                                      fontSize: 15,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                              future: locator.get<VehicleController>().get(),
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
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 8,
            child: Container(
              height: 400,
              width: double.maxFinite,
              color: Color.fromARGB(135, 224, 224, 224),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Venda Recomendados",
                      style: TextStyle(
                        color: Color(0xFF2E2C34),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    pizzaGraphicDashboardTablet(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IncomingAppointmentsMobile extends StatefulWidget {
  const IncomingAppointmentsMobile({Key? key}) : super(key: key);

  @override
  State<IncomingAppointmentsMobile> createState() =>
      _IncomingAppointmentsMobileState();
}

class _IncomingAppointmentsMobileState extends State<IncomingAppointmentsMobile> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
      child: Column(
        children: [
          Container(
            height: 400,
            color: Color.fromARGB(135, 223, 223, 223),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Agendamentos de entrada',
                              style: TextStyle(
                                color: Color(0xFF2E2C34),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Veja as tarefas em uma folha',
                              style: TextStyle(
                                color: Color.fromARGB(139, 46, 44, 52),
                                fontSize: 10,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.autorenew_outlined,
                                  color: Color.fromARGB(255, 73, 73, 73),
                                  size: 18,
                                ),
                                Text(
                                  'Atualização',
                                  style: TextStyle(
                                    color: Color.fromARGB(139, 46, 44, 52),
                                    fontSize: 15,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                          child: FutureBuilder<List<VehicleModel>>(
                            future: locator.get<VehicleController>().get(),
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
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
          ),
          Container(
            height: 400,
            width: double.maxFinite,
            color: Color.fromARGB(135, 224, 224, 224),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Venda Recomendados",
                    style: TextStyle(
                      color: Color(0xFF2E2C34),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  pizzaGraphicDashboardMobile(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConteudoVeiculoDashboard extends StatelessWidget {
  final VehicleModel vehicleModel;
  ConteudoVeiculoDashboard({
    Key? key,
    required this.placaVeiculo,
    required this.modeloVeiculo,
    required this.dataVeiculo,
    required this.vehicleModel,
  }) : super(key: key);

  String? placaVeiculo;
  String? modeloVeiculo;
  String? dataVeiculo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context, 
          useRootNavigator: true,
          builder: (_) => VehicleDetailsDialog(
            isTablet: true,
            nome: vehicleModel.customerName,
            email: vehicleModel.email,
            celular: vehicleModel.phoneNumber,
            modelo: vehicleModel.vehicleModelId.toString(),
            ano: vehicleModel.vehicleYear,
            cor: vehicleModel.vehicleColor,
            km: vehicleModel.mileage,
            placa: vehicleModel.licensePlate,
            mecanico: 'Não definido',
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 10,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 7,
                child: Container(
                  height: 35,
                  // width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/placa.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "$placaVeiculo",
                      style: TextStyle(
                        color: Color.fromARGB(255, 46, 44, 52),
                        fontSize: 13,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 10,
                child: Container(
                  child: Center(
                    child: Text(
                      '$modeloVeiculo',
                      style: TextStyle(
                        color: Color.fromARGB(255, 46, 44, 52),
                        fontSize: 10,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 10,
                child: Container(
                  child: Center(
                    child: Text(
                      '$dataVeiculo',
                      style: TextStyle(
                        color: Color.fromARGB(255, 46, 44, 52),
                        fontSize: 10,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class ConteudoVeiculoCheclist extends StatelessWidget {
  ConteudoVeiculoCheclist({
    Key? key,
    required this.placaVeiculo,
    required this.modeloVeiculo,
    required this.dataVeiculo,
    required this.nomeClienteVeiculo,
    required this.statusVeiculo,
    required this.coresTextA,
    required this.coresTextR,
    required this.coresTextG,
    required this.coresTextB,
    required this.fontSizeVeiculo,
  }) : super(key: key);

  String? nomeClienteVeiculo;
  String? placaVeiculo;
  String? modeloVeiculo;
  String? dataVeiculo;
  String? statusVeiculo;
  int coresTextA = 0;
  int coresTextR = 0;
  int coresTextG = 0;
  int coresTextB = 0;
  double? fontSizeVeiculo;
  //int tranparenciaFundoCor = coresTextA + 100;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 7,
              child: Container(
                height: 35,
                // width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/placa.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Center(
                  child: Text(
                    "$placaVeiculo",
                    style: TextStyle(
                      color: Color.fromARGB(99, 46, 44, 52),
                      fontSize: fontSizeVeiculo,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 10,
              child: Container(
                child: Center(
                  child: Text(
                    '$nomeClienteVeiculo',
                    style: TextStyle(
                      color: Color.fromARGB(255, 46, 44, 52),
                      fontSize: fontSizeVeiculo,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 10,
              child: Container(
                child: Center(
                  child: Text(
                    '$modeloVeiculo',
                    style: TextStyle(
                      color: Color.fromARGB(255, 46, 44, 52),
                      fontSize: fontSizeVeiculo,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 10,
              child: Container(
                child: Center(
                  child: Text(
                    '$dataVeiculo',
                    style: TextStyle(
                      color: Color.fromARGB(255, 46, 44, 52),
                      fontSize: fontSizeVeiculo,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Container(
                  color: Color.fromARGB(
                      coresTextA - 220, coresTextR, coresTextG, coresTextB),
                  child: Center(
                    child: Text(
                      '$statusVeiculo',
                      style: TextStyle(
                        color: Color.fromARGB(
                            coresTextA, coresTextR, coresTextG, coresTextB),
                        fontSize: fontSizeVeiculo,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 10,
        ),
      ],
    );
  }
}

class pizzaGraphicDashboardTablet extends StatefulWidget {
  pizzaGraphicDashboardTablet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 40),
                child: AspectRatio(
                  aspectRatio: 3,
                  child: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(touchCallback:
                            (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 60,
                        sections: showingSections()),
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${porcentagemVendas.round()}%",
                      style: TextStyle(
                        color: Color.fromARGB(255, 46, 44, 52),
                        fontSize: 20,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      height: 5,
                    ),
                    Text(
                      "das Vendas",
                      style: TextStyle(
                        color: Color.fromARGB(255, 67, 66, 71),
                        fontSize: 13,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 255, 94, 0),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 11,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.maxFinite,
                          child: Text(
                            "Revisão",
                            style: TextStyle(
                              color: Color.fromARGB(255, 67, 66, 71),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Text(
                      "${revisaoVendas.round()}%",
                      style: TextStyle(
                        color: Color.fromARGB(255, 67, 66, 71),
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: new BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 11,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.maxFinite,
                          child: Text(
                            "Recomendados",
                            style: TextStyle(
                              color: Color.fromARGB(255, 67, 66, 71),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Text(
                      "${porcentagemVendas.round()}%",
                      style: TextStyle(
                        color: Color.fromARGB(255, 67, 66, 71),
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 50.0 : 10.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color.fromARGB(255, 255, 102, 0),
            value: revisaoVendas,
            radius: radius,
            titlePositionPercentageOffset: -100,
          );
        case 1:
          return PieChartSectionData(
            color: Color.fromARGB(255, 255, 174, 0),
            value: porcentagemVendas,
            radius: radius,
            titlePositionPercentageOffset: -100,
          );
        default:
          throw Error();
      }
    });
  }
}

class pizzaGraphicDashboardMobile extends StatefulWidget {
  pizzaGraphicDashboardMobile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State2();
}

class PieChart2State2 extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 2,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 60,
                      sections: showingSections()),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${porcentagemVendas.round()}%",
                      style: TextStyle(
                        color: Color.fromARGB(255, 46, 44, 52),
                        fontSize: 20,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      height: 5,
                    ),
                    Text(
                      "das Vendas",
                      style: TextStyle(
                        color: Color.fromARGB(255, 67, 66, 71),
                        fontSize: 13,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Column(
              children: [
                Container(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 255, 94, 0),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 11,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            child: Text(
                              "Revisão",
                              style: TextStyle(
                                color: Color.fromARGB(255, 67, 66, 71),
                                fontSize: 12,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Text(
                        "${revisaoVendas.round()}%",
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 66, 71),
                          fontSize: 12,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: new BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 11,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            child: Text(
                              "Recomendados",
                              style: TextStyle(
                                color: Color.fromARGB(255, 67, 66, 71),
                                fontSize: 12,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Text(
                        "${porcentagemVendas.round()}%",
                        style: TextStyle(
                          color: Color.fromARGB(255, 67, 66, 71),
                          fontSize: 12,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 50.0 : 10.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color.fromARGB(255, 255, 102, 0),
            value: revisaoVendas,
            radius: radius,
            titlePositionPercentageOffset: -100,
          );
        case 1:
          return PieChartSectionData(
            color: Color.fromARGB(255, 255, 174, 0),
            value: porcentagemVendas,
            radius: radius,
            titlePositionPercentageOffset: -100,
          );
        default:
          throw Error();
      }
    });
  }
}
