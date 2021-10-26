import 'package:app/src/Models/chat_users_model.dart';
import 'package:app/src/Server/local/guide_server_connection.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

class ChatLogic extends GetxController {

  final GuideServerConnection _builder;

  ChatLogic(this._builder);

  Future<List<ChatUsers>> getListMessagesTourist(String email) async{    

    List<ChatUsers> listMessages = await _builder.getListMessagesGuide(email);    

    await Future.delayed(Duration(seconds: 1));

    return groupBy(listMessages, (ChatUsers e) => e.touristModel.name).entries
      .map((p) => p.value.sortedByCompare((element) => element.time, (DateTime a, DateTime b) => a.compareTo(b)).last).toList();

  }

}
