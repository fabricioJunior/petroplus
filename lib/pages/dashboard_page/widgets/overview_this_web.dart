import 'package:flutter/material.dart';

import 'date_selector.dart';

final List<String> semanas = [
  'Primeira Semana',
  'Segunda Semana',
  'Terceira Semana'
];
get selectedGender => null;

class OverviewThisWeekMobile extends StatelessWidget {
  OverviewThisWeekMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Visão Geral',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.normal,
              fontSize: 30,
            ),
          ),
          DateSelector(),
        ],
      ),
    );
  }

  setState(Null Function() param0) {}
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
        children: const [
          Text(
            'Visão Geral',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.normal,
              fontSize: 36,
            ),
          ),
          DateSelector(),
        ],
      ),
    );
  }

  //setState(Null Function() param0) {}
}

