import 'package:flutter/material.dart';

void toast(BuildContext context, String msg){
  SnackBar snackBar = SnackBar(content: Text(msg), duration: Duration(seconds: 2));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}