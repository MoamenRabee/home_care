import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage({
  required String message,
  Color? color,
  Color? textColor,
}) async {
  await Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: color ?? Colors.blue,
    textColor: textColor ?? Colors.white,
    fontSize: 16.0,
  );
}
