import 'package:get/get.dart';
import './loginPage_controller.dart';

class LoginPageBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(LoginPageController());
    }
}