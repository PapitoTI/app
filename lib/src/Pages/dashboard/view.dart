import 'package:app/src/Pages/chat/view.dart';
import 'package:app/src/Pages/guide_home/view.dart';
import 'package:app/src/Pages/profile_g/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final logic = Get.find<DashboardLogic>();
  final DashboardState state = Get.find<DashboardLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardLogic>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: logic.tabIndex,
            children: [
              GuideHomePage(),
              ChatPage(),
              ProfileGPage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.amberAccent,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            _bottomNavigationBarItem(
              icon: Icons.chat,
              label: 'Chat',
            ),
            _bottomNavigationBarItem(
              icon: Icons.home,
              label: 'Home',
            ),
            _bottomNavigationBarItem(
              icon: Icons.person,
              label: 'Perfil',
            )
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  @override
  void dispose() {
    Get.delete<DashboardLogic>();
    super.dispose();
  }
}
