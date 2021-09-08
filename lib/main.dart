import 'dart:io';

import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/login/initialPage.dart';
import 'package:app/src/Pages/login/loginPage.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';
import 'package:app/src/Pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'src/Server/local/server_connection_builder.dart';

void main() {
  var builder = ServerConnectionBuilder();
  runApp(MyApp(builder));
}

class MyApp extends StatefulWidget {
  final ServerConnectionBuilderInterface _builder;
  MyApp(this._builder);

  @override
  _MyAppState createState() => _MyAppState(_builder);
}

class _MyAppState extends State<MyApp> {
  final ServerConnectionBuilderInterface _builder;
  _MyAppState(this._builder) {
    Get.lazyPut<LoginController>(
        () => LoginController(ServerConnectionBuilder()));
  }

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
