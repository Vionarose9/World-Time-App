import 'package:flutter/material.dart';
import 'package:worldtime/pages/chooselocation.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';

void main() {
  runApp(MaterialApp(routes: {
    '/home': (context) => Home(),
    '/chooselocation': (context) => ChooseLocation(),
    '/': (context) => Loading()
  }));
}
