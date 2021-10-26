
//Classe responsável por definir a estrutura do chat
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/tourist_model.dart';

class ChatUsers {

  //Attributes
  TouristModel touristModel;
  GuideModel guideModel;
  String messageText;
  bool isTouristSender;
  DateTime time;
  
  //Construct
  ChatUsers(
      this.touristModel,
      this.guideModel,
      this.messageText,
      this.isTouristSender,
      this.time,
  );
}