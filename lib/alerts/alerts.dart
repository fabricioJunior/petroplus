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