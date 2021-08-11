import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ProfileGPage extends StatefulWidget {
  @override
  _ProfileGPageState createState() => _ProfileGPageState();
}

class _ProfileGPageState extends State<ProfileGPage> {
  final ProfileGLogic logic = Get.put(ProfileGLogic());
  final ProfileGState state = Get.find<ProfileGLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Text("Counter ${logic.counter.value}")),
              RaisedButton(
                child: Text("Increase"),
                onPressed: () => logic.increaseCounter(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ProfileGLogic>();
    super.dispose();
  }
}
