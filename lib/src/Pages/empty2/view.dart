import 'package:app/src/Widget/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class Empty2Page extends StatelessWidget {
  final logic = Get.put(Empty2Logic());

  var argumentos = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print(argumentos);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BackButtonWidget(title: 'Página vazia'),
            ),
            Text(argumentos[1].toString()),
            Text(argumentos[2]),
            Text(argumentos[3]),
          ],
        )),
      ),
    );
  }
}
