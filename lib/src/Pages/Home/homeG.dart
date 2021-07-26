import 'package:flutter/material.dart'
    show BuildContext, Center, Container, Scaffold, Text, TextStyle, Widget;
import 'package:get/get.dart';
import 'homeGController.dart';

class HomeGuia extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Home Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
