import 'dart:async';
import 'package:get/get.dart';
import 'package:app/src/Routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(Duration(seconds: 5), () {
      Get.offAndToNamed(AppRoutes.DASHBOARD);
    });
  }
}
