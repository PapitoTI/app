import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/login/login_controller.dart';
import 'package:app/src/Pages/login/login_guide.dart';
import 'package:app/src/Pages/login/login_tourist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoicePage extends StatelessWidget {
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/Ceu.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Color.fromRGBO(36, 117, 252, 20), BlendMode.modulate)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/images/LogoR.png",
              width: 176,
              height: 57,
              fit: BoxFit.fitWidth,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 48.0,
                  ),
                  child: Container(
                    child: Text(
                      'Tipo do perfil',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Palette.branco,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    //Get.to
                    onTap: () => Get.to(() => LoginGuidePage()),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(.18)),
                      width: 254,
                      height: 113,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: Container(
                              child: Image.asset(
                                "assets/images/PerfilG.png",
                                height: 83,
                                width: 80,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Text("Guia",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Palette.branco,
                                  fontSize: 26,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    onTap: () => Get.to(() => LoginTouristPage()),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(.18)),
                      width: 254,
                      height: 113,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              child: Image.asset(
                                "assets/images/PerfilT.png",
                                height: 83,
                                width: 80,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Turista",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Palette.branco,
                                  fontSize: 26,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
