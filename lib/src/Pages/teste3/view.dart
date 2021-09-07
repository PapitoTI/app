import 'package:app/src/Widget/search_widget/view.dart';
import 'package:app/src/Widget/timeline_widget2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class Teste3Page extends StatefulWidget {
  @override
  _Teste3PageState createState() => _Teste3PageState();
}

class _Teste3PageState extends State<Teste3Page> {
  final Teste3Logic logic = Get.put(Teste3Logic());
  final Teste3State state = Get.find<Teste3Logic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Expanded(flex: 4, child: SearchWidgetPage()),
                Expanded(flex: 20, child: TimelineWidget2())
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<Teste3Logic>();
    super.dispose();
  }
}
