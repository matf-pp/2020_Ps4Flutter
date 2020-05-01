import 'package:chatapp/viewOfChat.dart';
import 'package:flutter/material.dart';

class HeadOfChat extends StatefulWidget {
  @override
  _HeadOfChatState createState() => _HeadOfChatState();

  HeadOfChat({
    Key key,
    this.friendName : "",
    this.lastMessage : "",
    this.messageTime})
    : super(key:key);

  final String friendName;
  final String lastMessage;
  final DateTime messageTime;
}

class _HeadOfChatState extends State<HeadOfChat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        print(widget.friendName + " has beem tapped!");
        await Navigator.of(context).push(MaterialPageRoute<Null>(
          builder: (BuildContext context){
            return chatView(
              friendName: widget.friendName,
              lastMessage: widget.lastMessage,
            );
          },
          fullscreenDialog: true));
      },
      highlightColor: Colors.blue,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          width: double.infinity,
          height: 100.0,
//          color:Colors.grey[300],
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.friendName,
                        style: Theme.of(context).textTheme.title
                    ),
                    Text(widget.lastMessage,
                        style: Theme.of(context).textTheme.body2
                    ),
                    Text(widget.messageTime.toString(),),
                  ],
                ),
              ),
              Center(
                child: CircleAvatar(
                  radius: 35,
                  child: Text(widget.friendName.substring(0,1),
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .apply(color: Colors.white,fontWeightDelta: 3),
                  ),
                )
              )
            ],
          )
      ),
    );
  }
}
