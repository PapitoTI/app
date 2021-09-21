import 'dart:io';

import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/Cadastrar/choice.dart';
import 'package:app/src/Pages/login/initialPage.dart';
import 'package:app/src/Pages/login/login_tourist.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';
import 'package:app/src/Pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'src/Server/local/server_connection_builder.dart';

void main() {
  ServerConnectionBuilderInterface builder = ServerConnectionBuilder();
  Get.lazyPut<LoginController>(() => LoginController());

  Get.put(builder, tag: "builder");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                      : ChoicePage();
                }
                return ListView();
              }),
        )
      ],
    );
  }
}
