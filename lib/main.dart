//import 'package:app/src/Pages/home_base/view.dart';
import 'dart:io';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/Cadastrar/choice.dart';
import 'package:app/src/Pages/login/initialPage.dart';
import 'package:app/src/Pages/login/loginPage.dart';
//import 'package:app/src/Pages/tourist_home/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

//import 'src/Pages/login/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Orion',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Palette.branco,
          ),
        ),
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => FutureBuilder(
              future: getTemporaryDirectory(),
              builder:
                  (BuildContext context, AsyncSnapshot<Directory> snapshot) {
                if (snapshot.hasData) {
                  return FileSystemEntity.typeSync(
                              snapshot.data!.path + "Tutorial") ==
                          FileSystemEntityType.notFound
                      ? InitialPage()
                      : LoginPage();
                }
                return ListView();
              }),
        )
      ],
    );
  }
}
