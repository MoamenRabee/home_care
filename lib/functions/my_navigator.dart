import 'package:flutter/material.dart';

void navigateTo(BuildContext context,Widget page){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>page));
}

void navigateOff(BuildContext context,Widget page){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>page));
}

void navigateOffAll(BuildContext context,Widget page){
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>page),(Route<dynamic> route) => false);
}