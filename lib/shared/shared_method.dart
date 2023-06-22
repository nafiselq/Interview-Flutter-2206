import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01_test/shared/theme.dart';
import 'package:intl/intl.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 2.3, left: 40, right: 40),
    backgroundColor: kRedColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}

String formatTglIndo(String tanggal) {
  DateTime dateTime = DateFormat("yyyy-MM-dd").parse(tanggal);

  var m = DateFormat('MM').format(dateTime);
  var d = DateFormat('dd').format(dateTime).toString();
  var Y = DateFormat('yyyy').format(dateTime).toString();
  var month = "";
  switch (m) {
    case '01':
      {
        month = "Januari";
      }
      break;
    case '02':
      {
        month = "Februari";
      }
      break;
    case '03':
      {
        month = "Maret";
      }
      break;
    case '04':
      {
        month = "April";
      }
      break;
    case '05':
      {
        month = "Mei";
      }
      break;
    case '06':
      {
        month = "Juni";
      }
      break;
    case '07':
      {
        month = "Juli";
      }
      break;
    case '08':
      {
        month = "Agustus";
      }
      break;
    case '09':
      {
        month = "September";
      }
      break;
    case '10':
      {
        month = "Oktober";
      }
      break;
    case '11':
      {
        month = "November";
      }
      break;
    case '12':
      {
        month = "Desember";
      }
      break;
  }
  return "$d $month $Y";
}
