import 'package:flutter/material.dart';

Widget hPerfilWidget() => Container(
    height: 46,
    width: 46,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.grey,
    ),
    child: Icon(Icons.add_alert));
