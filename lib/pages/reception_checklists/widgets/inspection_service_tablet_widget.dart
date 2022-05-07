import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

double valorDaporCentagem = 100; //Não alterar pois é um valor fixo

double porcentInspecaoVeiculo = 60;

double valorRestoPorcentagem = valorDaporCentagem - porcentInspecaoVeiculo;

class InspectionServiceTablet extends StatefulWidget {
  InspectionServiceTablet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.maxFinite,
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
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
                        centerSpaceRadius: 25,
                        sections: showingSections()),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.error,
                          color: Color.fromRGBO(255, 102, 1, 1),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Atendimento de Inspeção",
                  style: TextStyle(
                    color: Color.fromARGB(255, 59, 56, 56),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Veículos inspecionados com sucesso:",
                      style: TextStyle(
                        color: Color.fromARGB(255, 107, 107, 107),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "${porcentInspecaoVeiculo.round()}%",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 102, 1, 1),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "QTD VEÍCULOS",
                  style: TextStyle(
                    color: Color.fromRGBO(132, 129, 138, 1),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "120",
                      style: TextStyle(
                        color: Color.fromRGBO(46, 44, 52, 1),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "(70)",
                      style: TextStyle(
                        color: Color.fromRGBO(32, 201, 172, 1),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
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
      final radius = isTouched ? 50.0 : 5.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color.fromRGBO(255, 102, 1, 1),
            value: porcentInspecaoVeiculo,
            radius: radius,
            titlePositionPercentageOffset: -1000,
          );
        case 1:
          return PieChartSectionData(
            color: Color.fromARGB(255, 228, 227, 227),
            value: valorRestoPorcentagem,
            radius: radius,
            titlePositionPercentageOffset: -1000,
          );
        default:
          throw Error();
      }
    });
  }
}

class InspectionServiceMobile extends StatefulWidget {
  InspectionServiceMobile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State2();
}

class PieChart2State2 extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 8,
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
                        centerSpaceRadius: 40,
                        sections: showingSections()),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: Color.fromRGBO(255, 102, 1, 1),
                        size: 50,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Atendimento de Inspeção",
                style: TextStyle(
                  color: Color.fromARGB(255, 59, 56, 56),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Veículos inspecionados com sucesso:",
                    style: TextStyle(
                      color: Color.fromARGB(255, 107, 107, 107),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "${porcentInspecaoVeiculo.round()}%",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 102, 1, 1),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  "QTD VEÍCULOS",
                  style: TextStyle(
                    color: Color.fromRGBO(132, 129, 138, 1),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "120",
                    style: TextStyle(
                      color: Color.fromRGBO(46, 44, 52, 1),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "(70)",
                    style: TextStyle(
                      color: Color.fromRGBO(32, 201, 172, 1),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
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
            color: Color.fromRGBO(255, 102, 1, 1),
            value: porcentInspecaoVeiculo,
            radius: radius,
            titlePositionPercentageOffset: -1000,
          );
        case 1:
          return PieChartSectionData(
            color: Color.fromARGB(255, 228, 227, 227),
            value: valorRestoPorcentagem,
            radius: radius,
            titlePositionPercentageOffset: -1000,
          );
        default:
          throw Error();
      }
    });
  }
}
