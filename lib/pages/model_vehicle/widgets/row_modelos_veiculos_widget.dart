import 'package:flutter/material.dart';

class RowModelosVeiculos extends StatelessWidget {
  RowModelosVeiculos(
      {Key? key,
      required this.modeloVeiculoBotao,
      required this.veiculoImagemModelo})
      : super(key: key);

  String? veiculoImagemModelo;
  String? modeloVeiculoBotao;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
      child: Column(
        children: [
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("$veiculoImagemModelo"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          FlatButton(
            child: Text(
              "$modeloVeiculoBotao",
              style: TextStyle(
                fontFamily: 'Manrope',
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
            color: Color.fromARGB(255, 214, 214, 214),
            splashColor: Color.fromARGB(255, 255, 81, 0),
            onPressed: () {
              // faz alguma coisa
            },
          ),
        ],
      ),
    );
  }
}
