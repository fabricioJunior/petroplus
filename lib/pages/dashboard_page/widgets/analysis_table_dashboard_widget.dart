import 'package:flutter/material.dart';

class AnalysisTableDashboard extends StatelessWidget {
  AnalysisTableDashboard(
      {Key? key,
      required this.heightColorAllAnalysis,
      required this.heightColorLittleAnalysis,
      required this.heightDateAnalysis,
      required this.fontSizeDateAnalysis})
      : super(key: key);

  double? heightColorAllAnalysis;
  double? heightColorLittleAnalysis;
  String? heightDateAnalysis;
  double? fontSizeDateAnalysis;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          height: heightColorLittleAnalysis, //
          color: Color.fromARGB(255, 255, 142, 49),
        ),
        Container(
          width: double.infinity,
          height: heightColorAllAnalysis, //
          color: Color.fromARGB(255, 219, 99, 0),
        ),
        Container(
          height: 5,
        ),
        Text(
          "$heightDateAnalysis", //
          style: TextStyle(
            color: Color.fromARGB(155, 46, 44, 52),
            fontSize: fontSizeDateAnalysis,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
