import 'package:flutter/material.dart';
import 'widgets/dashboard_responsive_widgets.dart';
import 'widgets/overview_this_web.dart';
import 'widgets/widgets_analysis_all_widget.dart';
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
                        if (isTablet || isMobile) ...[
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
                        if (isComput || isMobile) ...[
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
