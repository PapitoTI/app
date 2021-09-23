import 'package:app/src/Pages/home_base/view.dart';
import 'package:app/src/Server/credentials.dart';
import 'package:app/src/Server/guide_server_connection_interface.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ServerConnectionBuilderInterface _builder;
  Rx<TouristServerConnectionInterface?> _tourist =
      Rx<TouristServerConnectionInterface?>(null);
  Rx<GuideServerConnectionInterface?> _guide =
      Rx<GuideServerConnectionInterface?>(null);

  LoginController(
    this._builder,
  );

  TouristServerConnectionInterface? get tourist => _tourist.value;

  GuideServerConnectionInterface? get guide => _guide.value;

  void loginTourist(String email, String password) async {
    try {
      _tourist.value =
          await _builder.connectTourist(Credentials(email, password));
      Get.to(HomeBasePage(), arguments: _tourist.value);
    } catch (e) {}
  }

  void singOutTourist(String email, String password) {
    try {} catch (e) {}
  }

  void loginGuide(String email, String password) async {
    try {
      _guide.value = await _builder.connectGuide(Credentials(email, password));
      Get.to(HomeBasePage(), arguments: _guide.value);
    } catch (e) {}
  }

  void singOutGuide(String email, String password) {
    try {} catch (e) {}
  }
}
