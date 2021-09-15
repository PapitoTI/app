import 'package:app/src/Server/server_connection_builder_interface.dart';
import 'package:get/get.dart';

class RegisterGuideController extends GetxController {
  final ServerConnectionBuilderInterface _builder = Get.find(tag: "builder");
  void registerGuide(String email, String password, String name, String phone,
      String certificate) async {
    var register = await _builder.connectRegister();

    var result =
        await register.registerGuide(email, password, name, phone, certificate);

    update();
  }
}
