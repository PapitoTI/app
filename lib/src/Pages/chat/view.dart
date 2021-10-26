//import 'package:app/src/Pages/chat/listChat.dart';
import 'package:app/src/Pages/chat/chatList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatList(),
    );
  }

  @override
  void dispose() {
    Get.delete<ChatLogic>();
    super.dispose();
  }
}
