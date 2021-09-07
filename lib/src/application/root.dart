import 'package:app/src/Pages/Cadastrar/choice.dart';
import 'package:app/src/Pages/login/loginPage.dart';
import 'package:app/src/application/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginRoot extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<LoginController>().user != null)
          ? ChoicePage()
          : LoginPage();
    });
  }
}
