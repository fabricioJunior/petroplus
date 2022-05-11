import 'package:flutter/material.dart';

Widget buildCircularProgress() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Color(0xffff6601)),
      ),
    ),
  );
}

Widget loadingDialog() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 100,
        width: 200,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCircularProgress(),
              Text(
                'Carregando...', 
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}