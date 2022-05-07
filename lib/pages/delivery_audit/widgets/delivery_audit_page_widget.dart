import 'package:flutter/material.dart';

import '../../dashboard_page/widgets/visao_geral_esta_semana_widgets.dart';

final List<String> semanas = [
  'Primeira Semana',
  'Segunda Semana',
  'Terceira Semana'
];
get selectedGender => null;

class DeliveryAuditPageTablet extends StatelessWidget {
  DeliveryAuditPageTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Auditoria de Entrega',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.normal,
              fontSize: 30,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(width: 2, color: Color.fromRGBO(235, 234, 237, 1)),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [
                  const Icon(
                    Icons.today,
                    color: Color.fromARGB(172, 46, 44, 52),
                    size: 20.09,
                  ),
                  BotaoDataAcao(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryAuditPageMobile extends StatelessWidget {
  DeliveryAuditPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: Column(
        children: [
          Text(
            'Auditoria de Entrega',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.normal,
              fontSize: 30,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(width: 2, color: Color.fromRGBO(235, 234, 237, 1)),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.today,
                    color: Color.fromARGB(172, 46, 44, 52),
                    size: 20.09,
                  ),
                  BotaoDataAcao(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
