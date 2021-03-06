import 'dart:ui';

import 'package:app/src/Config/images.dart';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/PerfilG/guide_profile.dart';
import 'package:app/src/Pages/chat/view.dart';
import 'package:app/src/Pages/guide_home/view.dart';
import 'package:app/src/Pages/menu/menu.dart';
import 'package:app/src/Pages/tourist_home/view.dart';
import 'package:app/src/Server/guide_server_connection_interface.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class HomeBasePage extends StatefulWidget {
  @override
  _HomeBasePageState createState() => _HomeBasePageState();
}

class _HomeBasePageState extends State<HomeBasePage> {
  final HomeBaseLogic logic = Get.put(HomeBaseLogic(Get.arguments));
  final HomeBaseState state = Get.find<HomeBaseLogic>().state;

  @override
  void initState() {
    super.initState();
    logic.getSchedulesFromInterface();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(
      builder: (controller) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: Stack(fit: StackFit.expand, children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(APP_WALLPAPER), fit: BoxFit.cover)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(20, 20, 20, 100)),
                ),
              ),
            ),
            if (controller.session is GuideServerConnectionInterface)
              IndexedStack(
                index: controller.tabIndex,
                children: [GuideHomePage(), ChatPage(), GuideProfile()],
              ),
            if (controller.session is TouristServerConnectionInterface)
              IndexedStack(
                index: controller.tabIndex,
                children: [TouristHomePage(), ChatPage(), Menu()],
              ),
          ]),
          bottomNavigationBar: FloatingNavbar(
            borderRadius: 20.0,
            elevation: 10,
            backgroundColor: Palette.cinzaTransparente,
            selectedItemColor: Palette.branco,
            selectedBackgroundColor: Palette.cinzaClaroTransparente,
            unselectedItemColor: Palette.cinzaClaro,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            items: [
              FloatingNavbarItem(
                icon: FontAwesomeIcons.home,
                title: 'Home',
              ),
              FloatingNavbarItem(
                icon: FontAwesomeIcons.comments,
                title: 'Chat',
              ),
              FloatingNavbarItem(
                icon: FontAwesomeIcons.user,
                title: 'Perfil',
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    Get.delete<HomeBaseLogic>();
    super.dispose();
  }
}
