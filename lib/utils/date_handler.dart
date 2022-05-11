
import 'dart:developer';

import 'package:flutter/foundation.dart';

String getDateBr(DateTime dateTime) {
  return '${_getZeroNumber(dateTime.day)}/${_getZeroNumber(dateTime.month)}/${dateTime.year} ás ${_getZeroNumber(dateTime.hour)}h${_getZeroNumber(dateTime.minute)}';
}

String _getZeroNumber(num number) {
  if (number < 10 && !number.toString().startsWith('0')) {
    return '0$number';
  } else {
    return number.toString();
  }
}

String getMontInName(num month) {
  if (month == 1) {
    return 'Jan';
  } else if (month == 2) {
    return 'Fev';
  } else if (month == 3) {
    return 'Mar';
  } else if (month == 4) {
    return 'Abr';
  } else if (month == 5) {
    return 'Mai';
  } else if (month == 6) {
    return 'Jun';
  } else if (month == 7) {
    return 'Jul';
  } else if (month == 8) {
    return 'Ago';
  } else if (month == 9) {
    return 'Set';
  } else if (month == 10) {
    return 'Out';
  } else if (month == 11) {
    return 'Nov';
  } else if (month == 12) {
    return 'Dez';
  }

  return 'null';
}

var currentDate = DateTime.now();

class DateHandler extends ValueNotifier<String> {
  DateHandler() : super('${_getZeroNumber(currentDate.day)} ${getMontInName(currentDate.month)} - ${_getZeroNumber(currentDate.add(Duration(days: 7)).day)} ${getMontInName(currentDate.add(Duration(days: 7)).month)}');

  ValueNotifier<String> dateInterval = ValueNotifier<String>('${_getZeroNumber(currentDate.day)} ${getMontInName(currentDate.month)} - ${_getZeroNumber(currentDate.add(Duration(days: 7)).day)} ${getMontInName(currentDate.add(Duration(days: 7)).month)}');

  void getDateForward() {
  final lastDate = currentDate.add(Duration(days: 7));
    dateInterval.value = '${_getZeroNumber(currentDate.day)} ${getMontInName(currentDate.month)} - ${_getZeroNumber(lastDate.day)} ${getMontInName(lastDate.month)}';
    currentDate = lastDate;
  }

  void getDateBackward() {
    final lastDate = currentDate.subtract(Duration(days: 7));
    dateInterval.value = '${_getZeroNumber(currentDate.day)} ${getMontInName(currentDate.month)} - ${_getZeroNumber(lastDate.day)} ${getMontInName(lastDate.month)}';
    currentDate = lastDate;
  }

  
}