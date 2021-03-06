import 'package:flutter/material.dart';
import '../dashboard_page/widgets/dashboard_responsive_widgets.dart';
import '../dashboard_page/widgets/overview_this_web.dart';
import '../dashboard_page/widgets/widgets_analysis_all_widget.dart';
import 'widgets/delivery_audit_page_widget.dart';
import '../reception_checklists/widgets/chelist_reception_vehicles_table.dart';
import '../reception_checklists/widgets/divschelist_reception_vehicles_table.dart';
import '../reception_checklists/widgets/inspection_service_tablet_widget.dart';
import '../reception_checklists/widgets/reception_checklists_widgets.dart';
import '../../widgets/appbar_uni_widget.dart';
import '../../widgets/vehicle_history_table_widget.dart';
import '../drawer_menu.dart/navigation_drawer_menu.dart';

class DeliveryAuditPage extends StatelessWidget {
  const DeliveryAuditPage({Key? key}) : super(key: key);

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
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    var isTablet = constraints.maxWidth > 500;
                    return Column(
                      children: [
// ------------------------------------------------Body/Tablet
                        if (isTablet) ...[
                          // ------------------------------------------------Checklists de Recepção
                          DeliveryAuditPageTablet(),
                          ChelistReceptionVehiclesTableTablet(),
                        ],
// ------------------------------------------------Body/Mobile
                        if (!isTablet) ...[
                          // ------------------------------------------------Checklists de Recepção
                          DeliveryAuditPageMobile(),
                          ChelistReceptionVehiclesTableMobile(isAuditPage: true),
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
