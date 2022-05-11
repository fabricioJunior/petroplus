import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showAlert(String msg, {
  Color? backgroundColor, 
  Toast? toastLength, 
  ToastGravity? toastGravity,
  bool isError = false,
}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: toastLength ?? Toast.LENGTH_SHORT,
    gravity: toastGravity ?? ToastGravity.BOTTOM,
    backgroundColor: backgroundColor ?? (isError ? Colors.red : Colors.grey.shade800),
    textColor: Colors.white,
    fontSize: 14,
  );
}

void showAlertDialog(
  BuildContext context, 
  String message, {
    String? description,
  }
) {
  showDialog(
    context: context, 
    builder: (context) {
      return _errorDialog(message, description: description);
    },
  );
}

Widget _errorDialog(
  String message, {
    String? description, 
    bool isError = true,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: 300,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  isError ? Icons.error : Icons.check_box, 
                  color: isError ? Colors.red.shade900 : Colors.green, size: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    message, 
                    style: TextStyle(
                      fontSize: 22, 
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                if (description != null) Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Text(
                    description, 
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}