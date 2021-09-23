import 'package:app/src/Pages/Pagamentos/pay.dart';
import 'package:app/src/Pages/PerfilG/pGuia.dart';
import 'package:app/src/Server/credentials.dart';
import 'package:app/src/Server/guide_server_connection_interface.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ServerConnectionBuilderInterface _builder = Get.find(tag: "builder");

  Rx<TouristServerConnectionInterface?> _userT =
      Rx<TouristServerConnectionInterface?>(null);

  TouristServerConnectionInterface? get user => _userT.value;

  Rx<GuideServerConnectionInterface?> _userG =
      Rx<GuideServerConnectionInterface?>(null);

  GuideServerConnectionInterface? get userG => _userG.value;

  void loginTUser(String email, String password) async {
    try {
      _userT.value =
          await _builder.connectTourist(Credentials(email, password));
      //Get.to(HomeBasePage());
      Get.to(PerfilGuiaPage());
    } catch (e) {}
  }

  void loginGUser(String email, String password) async {
    try {
      _userG.value = await _builder.connectGuide(Credentials(email, password));
      //Get.to(HomeBasePage());
      Get.to(Payment());
    } catch (e) {}
  }
}
