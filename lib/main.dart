import 'dart:io';

import 'package:app/src/Pages/Cadastrar/choice.dart';
import 'package:app/src/Pages/login/initialPage.dart';
import 'package:app/src/Pages/login/login_controller.dart';
import 'package:app/src/Server/local/server_connection_builder.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  // ServerConnectionBuilderInterface builder =
  //     GrpcServerConnectionBuilder("177.140.117.183", 5001);
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('pt', 'BR')],
      title: 'Orion',
      theme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/',
          page: () => FutureBuilder(
              future: getTemporaryDirectory(),
              builder: (context, AsyncSnapshot<Directory> snapshot) =>
                  !snapshot.hasData ||
                          FileSystemEntity.typeSync(
                                  snapshot.data!.path + "Tutorial") ==
                              FileSystemEntityType.notFound
                      ? InitialPage()
                      : ChoicePage()),
        )
      ],
    );
  }
}
