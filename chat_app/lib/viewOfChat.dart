import 'package:chatapp/messageOfChat.dart';
import 'package:flutter/material.dart';

class chatView extends StatefulWidget {
  @override
  _chatViewState createState() => _chatViewState();
}

class _chatViewState extends State<chatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friend's name here"),
      ),
      body: ListView(
        children: <Widget>[
          chatMessages(isFriend: true, isNotPrevious: true,),
          chatMessages(isFriend: false),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(child:Text("text here")),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: (){
                print('Send message');
              },
            )
          ],
        ),
      ),
    );
  }
}
