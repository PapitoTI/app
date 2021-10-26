import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/chat_users_model.dart';
import 'package:app/src/Pages/chat/logic.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Server/guide_server_connection_interface.dart';
import 'package:app/src/Widget/chat_widget/chatList_widget.dart';
import 'package:app/src/Server/local/guide_server_connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final ChatLogic logic = Get.put(ChatLogic(_builder));

  static GuideServerConnection _builder = Get.arguments;

  final session = Get.find<HomeBaseLogic>();

  Future<String> getEmail() async {
    if (session.session is GuideServerConnectionInterface) {
      return (await session.session.getGuideData()).email;
    }

    return (await session.session.getTouristData()).email;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getEmail(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text("Carregando"),
          );
        }
        return FutureBuilder<List<ChatUsers>>(
          future: logic.getListMessagesTourist(snapshot.data as String),
          builder: (context, AsyncSnapshot<List<ChatUsers>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Carregando...'),
                  )
                ],
              ));
            if (!snapshot.hasData)
              return Center(
                child: Text("Não existe esse e-mail"),
              );
            var messagesList = snapshot.data!;
            if (messagesList.isEmpty)
              return Center(
                child: Text("Nenhuma mensagem!"),
              );
            return GetBuilder<HomeBaseLogic>(builder: (controller) {
              return Scaffold(
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: Text(
                              "Chat",
                              style: TextStyle(
                                fontSize: 40,
                                color: Palette.branco
                              ),
                            ),
                          ),
                        ),                     
                        ListView.builder(
                          itemCount: messagesList.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 10),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ConversationList(
                              messagesList[index].touristModel.name,
                              messagesList[index].guideModel.email,
                              messagesList[index].touristModel.email,
                              messagesList[index].messageText,
                              messagesList[index].touristModel.imageUrl,
                              messagesList[index].time,
                              (index == 0 || index == 3) ? true : false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          },
        );
      },
    );
  }
}
