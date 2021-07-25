import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chatController.dart';

class ChatGuia extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Chat",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
