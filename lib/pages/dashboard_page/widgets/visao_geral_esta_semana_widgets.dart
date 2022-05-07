import 'package:flutter/material.dart';

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
        children: [
          Text(
            'Visão Geral',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.normal,
              fontSize: 30,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.today,
                color: const Color(0xFF2E2C34),
                size: 20.09,
              ),
              BotaoDataAcao(),
            ],
          ),
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
              BotaoDataAcao(),
            ],
          ),
        ],
      ),
    );
  }

  //setState(Null Function() param0) {}
}

class BotaoDataAcao extends StatefulWidget {
  const BotaoDataAcao({Key? key}) : super(key: key);

  @override
  State<BotaoDataAcao> createState() => _BotaoDataAcaoState();
}

class _BotaoDataAcaoState extends State<BotaoDataAcao> {
  DateTime date = DateTime(2022, 12, 24);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
          ),
          child: Text(
            '${date.day} - ${date.month} - ${date.year}',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Manrope',
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
          ),
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(1980),
              lastDate: DateTime(2030),
            );
            if (newDate == null) return;
            setState(() => date = newDate);
          },
        ),
      ],
    );
  }
}
