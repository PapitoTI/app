import 'package:app/src/Pages/home_base/view.dart';
import 'package:app/src/Pages/login/loginPage.dart';
import 'package:app/src/Pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginRoot extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<LoginController>().tourist != null)
          ? HomeBasePage()
          : LoginPage();
    });
  }
}
