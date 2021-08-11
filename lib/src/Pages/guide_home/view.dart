import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class GuideHomePage extends StatefulWidget {
  @override
  _GuideHomePageState createState() => _GuideHomePageState();
}

class _GuideHomePageState extends State<GuideHomePage> {
  final GuideHomeLogic logic = Get.put(GuideHomeLogic());
  final GuideHomeState state = Get.find<GuideHomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Home Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<GuideHomeLogic>();
    super.dispose();
  }
}
