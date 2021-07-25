import 'package:app/src/Pages/Chat/chat.dart';
import 'package:app/src/Pages/Home/homeG.dart';
import 'package:app/src/Pages/Perfil/perfilG.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dashboardController.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeGuia(),
              ChatGuia(),
              PerfilGuia(),
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

  _bottomNavigationBarItem({IconData icon, String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
