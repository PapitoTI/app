import 'package:app/src/Pages/chat/chatMessage.dart';
import 'package:flutter/material.dart';

class ConversationList extends StatefulWidget{
  String name;
  String email;
  String sessionEmail;
  String messageText;
  String imageUrl;
  DateTime time;
  bool isMessageRead;
  ConversationList(this.name, this.email, this.sessionEmail, this.messageText, this.imageUrl, this.time, this.isMessageRead);
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatMessageDetail(widget.name, widget.imageUrl, widget.sessionEmail, widget.email);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),                      
                    maxRadius: 30,                    
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.name, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(widget.messageText,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),            
          ],
        ),
      ),
    );
  }
}