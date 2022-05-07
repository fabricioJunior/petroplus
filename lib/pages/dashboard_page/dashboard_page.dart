import 'package:flutter/material.dart';
import 'package:petroplus/pages/dashboard_page/widgets/dashboard_responsive_widgets.dart';
import 'package:petroplus/pages/dashboard_page/widgets/visao_geral_esta_semana_widgets.dart';
import 'package:petroplus/pages/dashboard_page/widgets/widgets_analysis_all_widget.dart';
import '../../widgets/appbar_uni_widget.dart';
import '../../widgets/vehicle_history_table_widget.dart';
import '../drawer_menu.dart/navigation_drawer_menu.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

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
                width: MediaQuery.of(context).size.width * .9,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    var isMobile = constraints.minWidth < 500;
                    var isTablet = constraints.minWidth > 500 &&
                        constraints.minWidth < 900;
                    var isComput = constraints.minWidth > 900;
                    return Column(
                      children: [
// ------------------------------------------------Body/Mobile
                        if (isMobile) ...[
                          // ------------------------------------------------VisãoGeral/EstaSemana
                          OverviewThisWeekMobile(),
                          // -----------------------------------------Row Overal Time Used / 36h
                          OveralTimeUsedMobile(),
                          // ------------------------------------------------Sistema Analise
                          WidgetsAnalysisAllMobile(),
                          // ------------------------------------------------Agendamentos de Entrada
                          IncomingAppointmentsMobile(),
                        ],
// ------------------------------------------------Body/Tablet
                        if (isTablet) ...[
                          // ------------------------------------------------VisãoGeral/EstaSemana
                          OverviewThisWeekTablet(),
                          // -----------------------------------------Row Overal Time Used / 36h
                          OveralTimeUsedTablet(),
                          // ------------------------------------------------Sistema Analise
                          WidgetsAnalysisAllTablet(),
                          // ------------------------------------------------Agendamentos de Entrada
                          IncomingAppointmentsTablet(),
                        ],
// ------------------------------------------------Body/Computadores
                        if (isComput) ...[
                          // ------------------------------------------------VisãoGeral/EstaSemana
                          OverviewThisWeekTablet(),
                          // -----------------------------------------Row Overal Time Used / 36h
                          OveralTimeUsedPc(),
                          // ------------------------------------------------Sistema Analise
                          WidgetsAnalysisAllPc(),
                          // ------------------------------------------------Agendamentos de Entrada
                          IncomingAppointmentsTablet(),
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
