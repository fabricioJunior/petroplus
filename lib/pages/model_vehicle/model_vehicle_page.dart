import 'package:flutter/material.dart';
import '../dashboard_page/widgets/dashboard_responsive_widgets.dart';
import '../dashboard_page/widgets/visao_geral_esta_semana_widgets.dart';
import '../dashboard_page/widgets/widgets_analysis_all_widget.dart';
import 'widgets/row_modelos_veiculos_widget.dart';
import '../reception_checklists/widgets/chelist_reception_vehicles_table.dart';
import '../reception_checklists/widgets/divschelist_reception_vehicles_table.dart';
import '../reception_checklists/widgets/inspection_service_tablet_widget.dart';
import '../reception_checklists/widgets/reception_checklists_widgets.dart';
import '../../widgets/appbar_uni_widget.dart';
import '../../widgets/vehicle_history_table_widget.dart';
import '../drawer_menu.dart/navigation_drawer_menu.dart';

String veiculo1 = "assets/img/Model3.png";
String modelo1 = "Modelo 1";

String veiculo2 = "assets/img/ModelS.png";
String modelo2 = "Modelo S";

String veiculo3 = "assets/img/ModelX.png";
String modelo3 = "Modelo X";

String veiculo4 = "assets/img/ModelY.png";
String modelo4 = "Modelo Y";

class ModelVehicle extends StatelessWidget {
  const ModelVehicle({Key? key}) : super(key: key);

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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  var isTablet = constraints.maxWidth > 500;
                  return Column(
                    children: [
// ------------------------------------------------Body/Tablet
                      if (isTablet) ...[
                        // ------------------------------------------------VisãoGeral/EstaSemana
                        ModelosVeiculosTablet(),
                      ],
// ------------------------------------------------Body/Mobile
                      if (!isTablet) ...[
                        // ------------------------------------------------VisãoGeral/EstaSemana
                        ModelosVeiculosMobile(),
                      ],
// ------------------------------------------------
                    ],
                  );
                },
              ),
            ),
          ],
        ),
// ------------------------------------------------
      ),
    );
  }
}

class ModelosVeiculosTablet extends StatelessWidget {
  const ModelosVeiculosTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RowModelosVeiculos(
              modeloVeiculoBotao: modelo1,
              veiculoImagemModelo: veiculo1,
            ),
            RowModelosVeiculos(
              modeloVeiculoBotao: modelo2,
              veiculoImagemModelo: veiculo2,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RowModelosVeiculos(
              modeloVeiculoBotao: modelo3,
              veiculoImagemModelo: veiculo3,
            ),
            RowModelosVeiculos(
              modeloVeiculoBotao: modelo4,
              veiculoImagemModelo: veiculo4,
            ),
          ],
        ),
      ],
    );
  }
}

class ModelosVeiculosMobile extends StatelessWidget {
  const ModelosVeiculosMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RowModelosVeiculos(
              modeloVeiculoBotao: modelo1,
              veiculoImagemModelo: veiculo1,
            ),
            RowModelosVeiculos(
              modeloVeiculoBotao: modelo2,
              veiculoImagemModelo: veiculo2,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RowModelosVeiculos(
              modeloVeiculoBotao: modelo3,
              veiculoImagemModelo: veiculo3,
            ),
            RowModelosVeiculos(
              modeloVeiculoBotao: modelo4,
              veiculoImagemModelo: veiculo4,
            ),
          ],
        ),
      ],
    );
  }
}
