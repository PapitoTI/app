import 'package:flutter/material.dart';
import 'package:get/get.dart';

_onPressed() {
  Get.snackbar("Clicou", "Clicou na agenda");
}

Widget botaoAgendaWidget() => Container(
      height: 46,
      width: 159,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(0.3)),
      child: ListTile(
        leading: Icon(
          Icons.calendar_today,
          color: Colors.white,
          size: 20,
        ),
        title: Text(
          "Minha agenda",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        onTap: () {
          _onPressed();
        },
      ),
    );
