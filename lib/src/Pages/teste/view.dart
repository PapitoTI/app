import 'package:app/src/Widget/CustomTableCalendar/CustomTableCalendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TestePage extends StatefulWidget {
  @override
  _TestePageState createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  final TesteLogic logic = Get.put(TesteLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/SP.jpg",
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(0.7),
              child: SafeArea(
                  child:
                      Center(child: Container(child: (CustomTableCalendar())))),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<TesteLogic>();
    super.dispose();
  }
}
