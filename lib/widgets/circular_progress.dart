import 'package:flutter/material.dart';

Widget buildCircularProgress() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Color(0xffff6601))),
    ),
  );
}