import 'package:app/src/Config/Palette.dart';
import 'package:app/src/Pages/teste/view.dart';
import 'package:app/src/Pages/turista_home/view.dart';
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
  final HomeBaseLogic logic = Get.put(HomeBaseLogic());
  final HomeBaseState state = Get.find<HomeBaseLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(
      builder: (controller) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0x44000000),
            title: Text('PageName'),
          ),
          body: Stack(fit: StackFit.expand, children: [
            IndexedStack(
              index: controller.tabIndex,
              children: [TestePage(), TuristaHomePage()],
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
                  icon: FontAwesomeIcons.newspaper, title: 'News'),
              FloatingNavbarItem(
                icon: FontAwesomeIcons.spotify,
                title: 'Home',
              ),
              FloatingNavbarItem(
                icon: FontAwesomeIcons.galacticRepublic,
                title: 'Home',
              )
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
