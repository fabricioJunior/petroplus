import 'package:flutter/material.dart';

import '../../dashboard_page/widgets/date_selector.dart';
import '../../dashboard_page/widgets/overview_this_web.dart';

final List<String> semanas = [
  'Primeira Semana',
  'Segunda Semana',
  'Terceira Semana'
];
get selectedGender => null;

class DivschelistReceptionVehiclesTableTablet extends StatelessWidget {
  DivschelistReceptionVehiclesTableTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sua Agenda',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 2, color: Color.fromRGBO(235, 234, 237, 1)),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: DateSelector(),
          ),
        ],
      ),
    );
  }
}

class OverviewThisWeekTablet extends StatelessWidget {
  OverviewThisWeekTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 45),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Visão Geral',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.normal,
              fontSize: 36,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.today,
                color: const Color(0xFF2E2C34),
                size: 20.09,
              ),
              Container(
                width: 5,
              ),
              DropdownButton<String>(
                items: [
                  DropdownMenuItem(
                    child: Text(semanas[0]),
                    value: semanas[0],
                  ),
                  DropdownMenuItem(
                    child: Text(semanas[1]),
                    value: semanas[1],
                  ),
                  DropdownMenuItem(
                    child: Text(semanas[2]),
                    value: semanas[2],
                  ),
                ],
                onChanged: (value) => setState(
                  () {
                    var selectedGender = value;
                  },
                ),
                key: selectedGender,
                hint: const Text('Esta Semanas'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  setState(Null Function() param0) {}
}
