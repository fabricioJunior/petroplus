import 'package:flutter/material.dart';
import 'analysis_table_dashboard_widget.dart';

final Map analysisAll = {
  "all01": 30,
  "lit01": 30,
  "date01": "12 Mar",
  "all02": 50,
  "lit02": 50,
  "date02": "12 Mar",
  "all03": 10,
  "lit03": 10,
  "date03": "12 Mar",
  "all04": 50,
  "lit04": 50,
  "date04": "12 Mar",
  "all05": 30,
  "lit05": 40,
  "date05": "12 Mar",
  "all06": 50,
  "lit06": 50,
  "date06": "12 Mar",
  "all07": 20,
  "lit07": 20,
  "date07": "12 Tes",
  "all08": 50,
  "lit08": 50,
  "date08": "12 Mar",
  "all09": 50,
  "lit09": 50,
  "date09": "12 Mar",
  "all10": 50,
  "lit10": 50,
  "date10": "12 Mar",
};

double modelTablet = 1.77;
// ---------------------------------------------------------------------
double returnTabletAll01 = analysisAll["all01"] * modelTablet;
double returnTabletLit01 = analysisAll["lit01"] * modelTablet;

double returnTabletAll02 = analysisAll["all02"] * modelTablet;
double returnTabletLit02 = analysisAll["lit02"] * modelTablet;

double returnTabletAll03 = analysisAll["all03"] * modelTablet;
double returnTabletLit03 = analysisAll["lit03"] * modelTablet;

double returnTabletAll04 = analysisAll["all04"] * modelTablet;
double returnTabletLit04 = analysisAll["lit04"] * modelTablet;

double returnTabletAll05 = analysisAll["all05"] * modelTablet;
double returnTabletLit05 = analysisAll["lit05"] * modelTablet;

double returnTabletAll06 = analysisAll["all06"] * modelTablet;
double returnTabletLit06 = analysisAll["lit06"] * modelTablet;

double returnTabletAll07 = analysisAll["all07"] * modelTablet;
double returnTabletLit07 = analysisAll["lit07"] * modelTablet;

double returnTabletAll08 = analysisAll["all08"] * modelTablet;
double returnTabletLit08 = analysisAll["lit08"] * modelTablet;

double returnTabletAll09 = analysisAll["all09"] * modelTablet;
double returnTabletLit09 = analysisAll["lit09"] * modelTablet;

double returnTabletAll10 = analysisAll["all10"] * modelTablet;
double returnTabletLit10 = analysisAll["lit10"] * modelTablet;

double modelMobile = 1.33;
// ---------------------------------------------------------------------
double returnMobileAll01 = analysisAll["all01"] * modelMobile;
double returnMobileLit01 = analysisAll["lit01"] * modelMobile;

double returnMobileAll02 = analysisAll["all02"] * modelMobile;
double returnMobileLit02 = analysisAll["lit02"] * modelMobile;

double returnMobileAll03 = analysisAll["all03"] * modelMobile;
double returnMobileLit03 = analysisAll["lit03"] * modelMobile;

double returnMobileAll04 = analysisAll["all04"] * modelMobile;
double returnMobileLit04 = analysisAll["lit04"] * modelMobile;

double returnMobileAll05 = analysisAll["all05"] * modelMobile;
double returnMobileLit05 = analysisAll["lit05"] * modelMobile;

double returnMobileAll06 = analysisAll["all06"] * modelMobile;
double returnMobileLit06 = analysisAll["lit06"] * modelMobile;

double returnMobileAll07 = analysisAll["all07"] * modelMobile;
double returnMobileLit07 = analysisAll["lit07"] * modelMobile;

double returnMobileAll08 = analysisAll["all08"] * modelMobile;
double returnMobileLit08 = analysisAll["lit08"] * modelMobile;

double returnMobileAll09 = analysisAll["all09"] * modelMobile;
double returnMobileLit09 = analysisAll["lit09"] * modelMobile;

double returnMobileAll10 = analysisAll["all10"] * modelMobile;
double returnMobileLit10 = analysisAll["lit10"] * modelMobile;

double modelPc = 3.6;
// ---------------------------------------------------------------------
double returnPcAll01 = analysisAll["all01"] * modelPc;
double returnPcLit01 = analysisAll["lit01"] * modelPc;

double returnPcAll02 = analysisAll["all02"] * modelPc;
double returnPcLit02 = analysisAll["lit02"] * modelPc;

double returnPcAll03 = analysisAll["all03"] * modelPc;
double returnPcLit03 = analysisAll["lit03"] * modelPc;

double returnPcAll04 = analysisAll["all04"] * modelPc;
double returnPcLit04 = analysisAll["lit04"] * modelPc;

double returnPcAll05 = analysisAll["all05"] * modelPc;
double returnPcLit05 = analysisAll["lit05"] * modelPc;

double returnPcAll06 = analysisAll["all06"] * modelPc;
double returnPcLit06 = analysisAll["lit06"] * modelPc;

double returnPcAll07 = analysisAll["all07"] * modelPc;
double returnPcLit07 = analysisAll["lit07"] * modelPc;

double returnPcAll08 = analysisAll["all08"] * modelPc;
double returnPcLit08 = analysisAll["lit08"] * modelPc;

double returnPcAll09 = analysisAll["all09"] * modelPc;
double returnPcLit09 = analysisAll["lit09"] * modelPc;

double returnPcAll10 = analysisAll["all10"] * modelPc;
double returnPcLit10 = analysisAll["lit10"] * modelPc;

double fontSizeDateMobile = 6;
double fontSizeDateTablet = 10;
double fontSizeDatePc = 15;

// ---------------------------------------------------------------------
class WidgetsAnalysisAllMobile extends StatelessWidget {
  const WidgetsAnalysisAllMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 150,
      child: Stack(
        children: [
          Row(
            children: [
              FlexibleHoursLineMobile(),
            ],
          ),
          FlexibleHoursAnalisticMobile(),
        ],
      ),
    );
  }
}

class WidgetsAnalysisAllTablet extends StatelessWidget {
  const WidgetsAnalysisAllTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 200,
      child: Stack(
        children: [
          FlexibleHoursLineTablet(),
          FlexibleHoursAnalisticTablet(),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------

class FlexibleHoursLineTablet extends StatelessWidget {
  const FlexibleHoursLineTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  child: Text(
                    "10h",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              Flexible(
                flex: 120,
                child: Container(
                  width: double.maxFinite,
                  height: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        // ------------------
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  child: Text(
                    "8h",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              Flexible(
                flex: 120,
                child: Container(
                  width: double.maxFinite,
                  height: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        // ------------------
        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  child: Text(
                    "6h",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              Flexible(
                flex: 120,
                child: Container(
                  width: double.maxFinite,
                  height: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  child: Text(
                    "4h",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              Flexible(
                flex: 120,
                child: Container(
                  width: double.maxFinite,
                  height: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  child: Text(
                    "2h",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              Flexible(
                flex: 120,
                child: Container(
                  width: double.maxFinite,
                  height: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        // -----------------------------------------Inicio

        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  child: Text(
                    "0h",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              Flexible(
                flex: 120,
                child: Container(
                  width: double.maxFinite,
                  height: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        // ---------------------------------fim
        Flexible(
          flex: 3,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        // ---------------------------------
      ],
    );
  }
}

class FlexibleHoursLineMobile extends StatelessWidget {
  const FlexibleHoursLineMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "10h",
                    style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 0.2,
                    color: Color.fromARGB(255, 114, 114, 114),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        // ------------------
        Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "8h",
                    style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 0.2,
                    color: Color.fromARGB(255, 114, 114, 114),
                  ),
                ),
              ],
            ),
          ),
        ),
        // ------------------
        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "6h",
                    style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 0.2,
                    color: Color.fromARGB(255, 114, 114, 114),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "4h",
                    style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 0.2,
                    color: Color.fromARGB(255, 114, 114, 114),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "2h",
                    style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 0.2,
                    color: Color.fromARGB(255, 114, 114, 114),
                  ),
                ),
              ],
            ),
          ),
        ),
        // -----------------------------------------Inicio

        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "0h",
                    style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 0.2,
                    color: Color.fromARGB(255, 114, 114, 114),
                  ),
                ),
              ],
            ),
          ),
        ),
        // ---------------------------------fim
        Flexible(
          flex: 3,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        // ---------------------------------
      ],
    );
  }
}

// ---------------------------------------------------------------------
class FlexibleHoursAnalisticTablet extends StatelessWidget {
  const FlexibleHoursAnalisticTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 5, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnTabletAll01,
            heightColorLittleAnalysis: returnTabletLit01,
            heightDateAnalysis: analysisAll["date01"],
            fontSizeDateAnalysis: fontSizeDateTablet,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnTabletAll02,
            heightColorLittleAnalysis: returnTabletLit02,
            heightDateAnalysis: analysisAll["date02"],
            fontSizeDateAnalysis: fontSizeDateTablet,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnTabletAll03,
            heightColorLittleAnalysis: returnTabletLit03,
            heightDateAnalysis: analysisAll["date03"],
            fontSizeDateAnalysis: fontSizeDateTablet,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnTabletAll04,
            heightColorLittleAnalysis: returnTabletLit04,
            heightDateAnalysis: analysisAll["date04"],
            fontSizeDateAnalysis: fontSizeDateTablet,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnTabletAll05,
            heightColorLittleAnalysis: returnTabletLit05,
            heightDateAnalysis: analysisAll["date05"],
            fontSizeDateAnalysis: fontSizeDateTablet,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnTabletAll06,
            heightColorLittleAnalysis: returnTabletLit06,
            heightDateAnalysis: analysisAll["date06"],
            fontSizeDateAnalysis: fontSizeDateTablet,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnTabletAll07,
            heightColorLittleAnalysis: returnTabletLit07,
            heightDateAnalysis: analysisAll["date07"],
            fontSizeDateAnalysis: fontSizeDateTablet,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnTabletAll08,
            heightColorLittleAnalysis: returnTabletLit08,
            heightDateAnalysis: analysisAll["date08"],
            fontSizeDateAnalysis: fontSizeDateTablet,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnTabletAll09,
            heightColorLittleAnalysis: returnTabletLit09,
            heightDateAnalysis: analysisAll["date09"],
            fontSizeDateAnalysis: fontSizeDateTablet,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnTabletAll10,
            heightColorLittleAnalysis: returnTabletLit10,
            heightDateAnalysis: analysisAll["date10"],
            fontSizeDateAnalysis: fontSizeDateTablet,
          ),
        ),
        Flexible(
          flex: 1, child: Container(),
          // width: 60,
        ),
      ],
    );
  }
}

class FlexibleHoursAnalisticMobile extends StatelessWidget {
  const FlexibleHoursAnalisticMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnMobileAll01,
            heightColorLittleAnalysis: returnMobileLit01,
            heightDateAnalysis: analysisAll["date01"],
            fontSizeDateAnalysis: fontSizeDateMobile,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnMobileAll02,
            heightColorLittleAnalysis: returnMobileLit02,
            heightDateAnalysis: analysisAll["date02"],
            fontSizeDateAnalysis: fontSizeDateMobile,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnMobileAll03,
            heightColorLittleAnalysis: returnMobileLit03,
            heightDateAnalysis: analysisAll["date03"],
            fontSizeDateAnalysis: fontSizeDateMobile,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnMobileAll04,
            heightColorLittleAnalysis: returnMobileLit04,
            heightDateAnalysis: analysisAll["date04"],
            fontSizeDateAnalysis: fontSizeDateMobile,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnMobileAll05,
            heightColorLittleAnalysis: returnMobileLit05,
            heightDateAnalysis: analysisAll["date05"],
            fontSizeDateAnalysis: fontSizeDateMobile,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnMobileAll06,
            heightColorLittleAnalysis: returnMobileLit06,
            heightDateAnalysis: analysisAll["date06"],
            fontSizeDateAnalysis: fontSizeDateMobile,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnMobileAll07,
            heightColorLittleAnalysis: returnMobileLit07,
            heightDateAnalysis: analysisAll["date07"],
            fontSizeDateAnalysis: fontSizeDateMobile,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnMobileAll08,
            heightColorLittleAnalysis: returnMobileLit08,
            heightDateAnalysis: analysisAll["date08"],
            fontSizeDateAnalysis: fontSizeDateMobile,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnMobileAll09,
            heightColorLittleAnalysis: returnMobileLit09,
            heightDateAnalysis: analysisAll["date09"],
            fontSizeDateAnalysis: fontSizeDateMobile,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnMobileAll10,
            heightColorLittleAnalysis: returnMobileLit10,
            heightDateAnalysis: analysisAll["date10"],
            fontSizeDateAnalysis: fontSizeDateMobile,
          ),
        ),
      ],
    );
  }
}

class WidgetsAnalysisAllPc extends StatelessWidget {
  const WidgetsAnalysisAllPc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 400,
      child: Stack(
        children: [
          FlexibleHoursLinePc(),
          FlexibleHoursAnalisticPc(),
        ],
      ),
    );
  }
}

class FlexibleHoursLinePc extends StatelessWidget {
  const FlexibleHoursLinePc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  child: Text(
                    "10h",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              Flexible(
                flex: 120,
                child: Container(
                  width: double.maxFinite,
                  height: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        // ------------------
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  child: Text(
                    "8h",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              Flexible(
                flex: 120,
                child: Container(
                  width: double.maxFinite,
                  height: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        // ------------------
        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  child: Text(
                    "6h",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              Flexible(
                flex: 120,
                child: Container(
                  width: double.maxFinite,
                  height: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  child: Text(
                    "4h",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              Flexible(
                flex: 120,
                child: Container(
                  width: double.maxFinite,
                  height: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  child: Text(
                    "2h",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              Flexible(
                flex: 120,
                child: Container(
                  width: double.maxFinite,
                  height: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        // -----------------------------------------Inicio

        Flexible(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  child: Text(
                    "0h",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                ),
              ),
              Flexible(
                flex: 120,
                child: Container(
                  width: double.maxFinite,
                  height: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        // ---------------------------------fim
        Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
          ),
        ),
        // ---------------------------------
      ],
    );
  }
}

class FlexibleHoursAnalisticPc extends StatelessWidget {
  const FlexibleHoursAnalisticPc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 5, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnPcAll01,
            heightColorLittleAnalysis: returnPcLit01,
            heightDateAnalysis: analysisAll["date01"],
            fontSizeDateAnalysis: fontSizeDatePc,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnPcAll02,
            heightColorLittleAnalysis: returnPcLit02,
            heightDateAnalysis: analysisAll["date02"],
            fontSizeDateAnalysis: fontSizeDatePc,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnPcAll03,
            heightColorLittleAnalysis: returnPcLit03,
            heightDateAnalysis: analysisAll["date03"],
            fontSizeDateAnalysis: fontSizeDatePc,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnPcAll04,
            heightColorLittleAnalysis: returnPcLit04,
            heightDateAnalysis: analysisAll["date04"],
            fontSizeDateAnalysis: fontSizeDatePc,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnPcAll05,
            heightColorLittleAnalysis: returnPcLit05,
            heightDateAnalysis: analysisAll["date05"],
            fontSizeDateAnalysis: fontSizeDatePc,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnPcAll06,
            heightColorLittleAnalysis: returnPcLit06,
            heightDateAnalysis: analysisAll["date06"],
            fontSizeDateAnalysis: fontSizeDatePc,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnPcAll07,
            heightColorLittleAnalysis: returnPcLit07,
            heightDateAnalysis: analysisAll["date07"],
            fontSizeDateAnalysis: fontSizeDatePc,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnPcAll08,
            heightColorLittleAnalysis: returnPcLit08,
            heightDateAnalysis: analysisAll["date08"],
            fontSizeDateAnalysis: fontSizeDatePc,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnPcAll09,
            heightColorLittleAnalysis: returnPcLit09,
            heightDateAnalysis: analysisAll["date09"],
            fontSizeDateAnalysis: fontSizeDatePc,
          ),
        ),
        Flexible(
          flex: 3, child: Container(),
          // width: 60,
        ),
        Flexible(
          flex: 5,
          child: AnalysisTableDashboard(
            heightColorAllAnalysis: returnPcAll10,
            heightColorLittleAnalysis: returnPcLit10,
            heightDateAnalysis: analysisAll["date10"],
            fontSizeDateAnalysis: fontSizeDatePc,
          ),
        ),
        Flexible(
          flex: 1, child: Container(),
          // width: 60,
        ),
      ],
    );
  }
}
