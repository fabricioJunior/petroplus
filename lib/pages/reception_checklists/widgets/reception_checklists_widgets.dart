import 'package:flutter/material.dart';

import '../../add_passenger/add_passenger_page.dart';

get selectedGender => null;

class ReceptionChecklistsTablet extends StatelessWidget {
  ReceptionChecklistsTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Checklists de Recepção',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.normal,
              fontSize: 30,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 255, 102, 0),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.directions_car_filled_sharp,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 25,
                  ),
                  Container(
                    width: 5,
                  ),
                  // TextButton.icon(onPressed: onPressed, icon: icon, label: label),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(0, 0, 190, 41),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddPassenger(),
                        ),
                      );
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text("Deslogado com sucesso!"),
                      //   ),
                      // );
                    },
                    child: Text(
                      "Adicionar Passante",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  setState(Null Function() param0) {}
}

class ReceptionChecklistsMobile extends StatelessWidget {
  ReceptionChecklistsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Checklists de Recepção',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.normal,
              fontSize: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 255, 102, 0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.directions_car_filled_sharp,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 25,
                    ),
                    Container(
                      width: 5,
                    ),
                    // TextButton.icon(onPressed: onPressed, icon: icon, label: label),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(0, 0, 190, 41),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddPassenger(),
                          ),
                        );
                      },
                      child: Text(
                        "Adicionar Passante",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                Icons.directions_car_filled_sharp,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 25,
              ),
              Container(
                width: 5,
              ),
              // TextButton.icon(onPressed: onPressed, icon: icon, label: label),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(0, 0, 190, 41),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddPassenger(),
                    ),
                  );

                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text("Deslogado com sucesso!"),
                  //   ),
                  // );
                },
                child: Text(
                  "Adicionar Passante",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  setState(Null Function() param0) {}
}
