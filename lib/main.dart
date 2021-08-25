//import 'package:app/src/Pages/home_base/view.dart';
import 'package:app/src/Pages/login/initialPage.dart';

//import 'package:app/src/Pages/tourist_home/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Orion', theme: ThemeData.dark(), home: InitialPage());
  }
}
