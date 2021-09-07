import 'package:app/src/Pages/teste/view.dart';
import 'package:app/src/Server/credentials.dart';
import 'package:app/src/Server/local/server_connection_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class TestePage2Page extends StatefulWidget {
  @override
  _TestePage2PageState createState() => _TestePage2PageState();
}

class _TestePage2PageState extends State<TestePage2Page> {
  final TestePage2Logic logic = Get.put(TestePage2Logic());
  final TestePage2State state = Get.find<TestePage2Logic>().state;

  var builder = ServerConnectionBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: ElevatedButton(
          onPressed: () async {
            var connection = await builder
                .connectTourist(Credentials('userName', 'password'));
            Get.to(TestePage(connection));
          },
          child: Text('Teste'),
        )),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<TestePage2Logic>();
    super.dispose();
  }
}
