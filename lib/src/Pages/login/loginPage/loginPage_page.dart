import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './loginPage_controller.dart';

class LoginPagePage extends GetView<LoginPageController> {
  const LoginPagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPagePage'),
      ),
      body: Container(),
    );
  }
}
