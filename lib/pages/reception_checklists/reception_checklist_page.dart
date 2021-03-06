import 'package:flutter/material.dart';
import '../dashboard_page/widgets/dashboard_responsive_widgets.dart';
import '../dashboard_page/widgets/overview_this_web.dart';
import '../dashboard_page/widgets/widgets_analysis_all_widget.dart';
import 'widgets/chelist_reception_vehicles_table.dart';
import 'widgets/divschelist_reception_vehicles_table.dart';
import 'widgets/inspection_service_tablet_widget.dart';
import 'widgets/reception_checklists_widgets.dart';
import '../../widgets/appbar_uni_widget.dart';
import '../../widgets/vehicle_history_table_widget.dart';
import '../drawer_menu.dart/navigation_drawer_menu.dart';

class ReceptionChecklist extends StatelessWidget {
  const ReceptionChecklist({Key? key}) : super(key: key);

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
                    var isTablet = constraints.maxWidth > 500;
                    return Column(
                      children: [
// ------------------------------------------------Body/Tablet
                        if (isTablet) ...[
                          // ------------------------------------------------Checklists de Recepção
                          ReceptionChecklistsTablet(),
                          InspectionServiceTablet(),
                          DivschelistReceptionVehiclesTableTablet(),
                          ChelistReceptionVehiclesTableTablet(),
                        ],
// ------------------------------------------------Body/Mobile
                        if (!isTablet) ...[
                          // ------------------------------------------------Checklists de Recepção
                          ReceptionChecklistsMobile(),
                          InspectionServiceMobile(),
                          DivschelistReceptionVehiclesTableTablet(),
                          ChelistReceptionVehiclesTableMobile(),
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
