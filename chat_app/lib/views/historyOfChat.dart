import 'package:chatapp/helper.dart';
import 'package:flutter/material.dart';
import '../HeadOfCheat.dart';

class ChatHistory extends StatefulWidget {
  @override
  _ChatHistoryState createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  @override
  Widget build(BuildContext context) {
//    Map<String,dynamic> mapOfChat = loadJsonFile(context,'assets/recentChats.json')

    return Container(
      child: Center(
        child:
          FutureBuilder(
            future: loadJsonFile(context,'assets/recentChats.json'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List<HeadOfChat> listTemp = List();
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData) {
                  Map<String,dynamic> mapTemp = snapshot.data;
                  mapTemp.forEach((_key,_value){
                    DateTime _messageTime = DateTime.fromMillisecondsSinceEpoch( _value["messages"]["timestamp"]);
                    listTemp.add(HeadOfChat(friendName: _value["display_name"],
                      messageTime: _messageTime ,
                      lastMessage: _value["messages"]["content"],
                      friendId: _key,
                      avatarUrl: _value["avatar"],
                    ));
                  });
                  return ListView(children: listTemp,);
                }
                else if(snapshot.hasError){
                  return Text('Something went wrong!');
                }
                else{
                  return Text('No chats founded!');
                }
              }
              else{
                return CircularProgressIndicator();
              }
              },
          )

//        ListView(
//          children: <Widget>[
//            HeadOfChat(friendName: "Dragan",
//              lastMessage: "Gde su prasici?",
//              messageTime: DateTime.now(),),
//          ],
//        ),
      ),
    );
  }
}
