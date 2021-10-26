import 'package:app/src/Models/chat_users_model.dart';
import 'package:app/src/Pages/chat/logic.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Server/local/tourist_server_connection.dart';
import 'package:flutter/material.dart';
import 'package:app/src/Models/chat_message_model.dart';
import 'package:get/get.dart';

class ChatMessageDetail extends StatefulWidget {
  String name;
  String imageUrl;
  String sessionEmail;
  String email;
  ChatMessageDetail(this.name, this.imageUrl, this.sessionEmail, this.email);

  @override
  _ChatMessageDetailState createState() => _ChatMessageDetailState();
}

class _ChatMessageDetailState extends State<ChatMessageDetail> {
  final controllerMessage = TextEditingController();

  List<ChatMessage> messages = [
    ChatMessage("Olá!", "receiver"),
    ChatMessage("Tudo bem?", "receiver"),
    ChatMessage("Olá Lucas", "sender"),
    ChatMessage("Tudo ótimo e com você?!", "receiver"),
  ];

  @override
  void dispose() {
    //Limpa o controller quando for liberado
    controllerMessage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.name,
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Online",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.settings,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType == "receiver"
                            ? Colors.grey.shade200
                            : Colors.blue[200]),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        messages[index].messageContent,
                        style: TextStyle(
                          fontSize: 15,
                          color: messages[index].messageType == "receiver"
                              ? Colors.grey.shade600
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Digite uma mensagem...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () async {},
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Colors.blue,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
