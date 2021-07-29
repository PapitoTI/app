import 'package:app/src/Pages/Home/TuristaHomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Orion',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TuristaHomePage());
  }
}
