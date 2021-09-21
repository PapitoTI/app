import 'package:app/src/Config/palette.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/desc_guide_widget.dart';
import 'package:app/src/Widget/guide_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerfilGuiaPage extends GetView<PerfilGuiaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [BackButtonWidget(title: "Perfil")],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            infoGuiaWidget(),
            SizedBox(
              height: 10,
            ),
            descGuiaWidget(),
            SizedBox(height: 10),
            Text(
              "Roteiros deste guia",
              style: TextStyle(color: Palette.branco),
            ),
            SizedBox(height: 10),
          ],
        )),
      ),
    );
  }
}

class PerfilGuiaController {}
