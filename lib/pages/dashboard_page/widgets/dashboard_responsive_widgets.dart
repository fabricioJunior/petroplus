import 'package:flutter/material.dart';

final Map dataDesh = {
  "tm_h": "36h",
  "tm_h_r": "Total hrs.",
  "tm_hm": "32h 20m",
  "tm_hm_r": "Tempo efetivo",
  "tm_hmm": "3h 4m",
  "tm_hmm_r": "Não efetivo",
  "tm_por": "95%",
  "tm_por_r": "Produtividade",
};

class OveralTimeUsedMobile extends StatelessWidget {
  OveralTimeUsedMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              "Tempo total de uso",
              style: TextStyle(
                color: Color(0xFF2E2C34),
                fontSize: 35,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 2,
            ),
            Text(
              "Aqui mostramos dados sobre suas horas de trabalho efetivas",
              style: TextStyle(
                color: Color.fromARGB(155, 46, 44, 52),
                fontSize: 10,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

// -----------------------------------------Row 36h
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetTimeUsed(
                  timeUsedScoreanalysis: dataDesh["tm_h"],
                  timeUsedScoreanalysisSize: 20,
                  timeUsedScoreanalysisResult: dataDesh["tm_h_r"],
                  timeUsedScoreanalysisResultSize: 10),
              WidgetTimeUsed(
                  timeUsedScoreanalysis: dataDesh["tm_hm"],
                  timeUsedScoreanalysisSize: 20,
                  timeUsedScoreanalysisResult: dataDesh["tm_hm_r"],
                  timeUsedScoreanalysisResultSize: 10),
              WidgetTimeUsed(
                  timeUsedScoreanalysis: dataDesh["tm_hmm"],
                  timeUsedScoreanalysisSize: 20,
                  timeUsedScoreanalysisResult: dataDesh["tm_hmm_r"],
                  timeUsedScoreanalysisResultSize: 10),
              WidgetTimeUsed(
                  timeUsedScoreanalysis: dataDesh["tm_por"],
                  timeUsedScoreanalysisSize: 20,
                  timeUsedScoreanalysisResult: dataDesh["tm_por_r"],
                  timeUsedScoreanalysisResultSize: 10),
            ],
          ),
        ),
// -----------------------------------------
      ],
    );
  }
}

class OveralTimeUsedTablet extends StatelessWidget {
  const OveralTimeUsedTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tempo total de uso',
                style: TextStyle(
                  color: Color(0xFF2E2C34),
                  fontSize: 18,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                height: 5,
              ),
              Text(
                "Aqui mostramos dados sobre suas horas de trabalho efetivas",
                style: TextStyle(
                  color: Color.fromARGB(155, 46, 44, 52),
                  fontSize: 10,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

// -----------------------------------------Row 36h
          Row(
            children: [
              WidgetTimeUsed(
                  timeUsedScoreanalysis: dataDesh["tm_h"],
                  timeUsedScoreanalysisSize: 18,
                  timeUsedScoreanalysisResult: dataDesh["tm_h_r"],
                  timeUsedScoreanalysisResultSize: 9),
              Container(
                width: 8,
              ),
              WidgetTimeUsed(
                  timeUsedScoreanalysis: dataDesh["tm_hm"],
                  timeUsedScoreanalysisSize: 18,
                  timeUsedScoreanalysisResult: dataDesh["tm_hm_r"],
                  timeUsedScoreanalysisResultSize: 9),
              Container(
                width: 8,
              ),
              WidgetTimeUsed(
                  timeUsedScoreanalysis: dataDesh["tm_hmm"],
                  timeUsedScoreanalysisSize: 18,
                  timeUsedScoreanalysisResult: dataDesh["tm_hmm_r"],
                  timeUsedScoreanalysisResultSize: 9),
              Container(
                width: 8,
              ),
              WidgetTimeUsed(
                  timeUsedScoreanalysis: dataDesh["tm_por"],
                  timeUsedScoreanalysisSize: 18,
                  timeUsedScoreanalysisResult: dataDesh["tm_por_r"],
                  timeUsedScoreanalysisResultSize: 9),
            ],
          ),
// -----------------------------------------
        ],
      ),
    );
  }
}

class OveralTimeUsedPc extends StatelessWidget {
  const OveralTimeUsedPc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tempo total de uso',
                style: TextStyle(
                  color: Color(0xFF2E2C34),
                  fontSize: 25,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                height: 5,
              ),
              Text(
                "Aqui mostramos dados sobre suas horas de trabalho efetivas",
                style: TextStyle(
                  color: Color.fromARGB(155, 46, 44, 52),
                  fontSize: 15,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

// -----------------------------------------Row 36h
          Row(
            children: [
              WidgetTimeUsed(
                  timeUsedScoreanalysis: dataDesh["tm_h"],
                  timeUsedScoreanalysisSize: 25,
                  timeUsedScoreanalysisResult: dataDesh["tm_h_r"],
                  timeUsedScoreanalysisResultSize: 15),
              Container(
                width: 12,
              ),
              WidgetTimeUsed(
                  timeUsedScoreanalysis: dataDesh["tm_hm"],
                  timeUsedScoreanalysisSize: 25,
                  timeUsedScoreanalysisResult: dataDesh["tm_hm_r"],
                  timeUsedScoreanalysisResultSize: 15),
              Container(
                width: 12,
              ),
              WidgetTimeUsed(
                  timeUsedScoreanalysis: dataDesh["tm_hmm"],
                  timeUsedScoreanalysisSize: 25,
                  timeUsedScoreanalysisResult: dataDesh["tm_hmm_r"],
                  timeUsedScoreanalysisResultSize: 15),
              Container(
                width: 12,
              ),
              WidgetTimeUsed(
                  timeUsedScoreanalysis: dataDesh["tm_por"],
                  timeUsedScoreanalysisSize: 25,
                  timeUsedScoreanalysisResult: dataDesh["tm_por_r"],
                  timeUsedScoreanalysisResultSize: 15),
            ],
          ),
// -----------------------------------------
        ],
      ),
    );
  }
}

class WidgetTimeUsed extends StatelessWidget {
  String? timeUsedScoreanalysis;
  double? timeUsedScoreanalysisSize;
  String? timeUsedScoreanalysisResult;
  double? timeUsedScoreanalysisResultSize;

  WidgetTimeUsed(
      {Key? key,
      required this.timeUsedScoreanalysis,
      required this.timeUsedScoreanalysisSize,
      required this.timeUsedScoreanalysisResult,
      required this.timeUsedScoreanalysisResultSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$timeUsedScoreanalysis",
          // '95%',
          style: TextStyle(
            color: Color(0xFF2E2C34),
            fontSize: timeUsedScoreanalysisSize,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: 6,
        ),
        Text(
          "$timeUsedScoreanalysisResult",
          style: TextStyle(
            color: Color.fromARGB(155, 46, 44, 52),
            fontSize: timeUsedScoreanalysisResultSize,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
