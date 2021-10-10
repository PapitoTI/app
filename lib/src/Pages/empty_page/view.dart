import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class EmptyPagePage extends StatelessWidget {
  final logic = Get.put(EmptyPageLogic());
  final state = Get.find<EmptyPageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column()),
    );
  }
}
