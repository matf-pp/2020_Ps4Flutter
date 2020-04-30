import 'package:flutter/material.dart';

class chatMessages extends StatefulWidget {
  const chatMessages({Key key, this.isFriend : false, this.isNotPrevious: false}) : super(key: key);

  @override
  _chatMessagesState createState() => _chatMessagesState();

  final bool isFriend;
  final bool isNotPrevious;
}

class _chatMessagesState extends State<chatMessages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 100.0,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          widget.isFriend && widget.isNotPrevious ?
          CircleAvatar(
            child: Text("F"),
            radius: 34,
            backgroundColor: Colors.white,
          ) : Container(),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Chat here"),
            ),
          ),
          !widget.isFriend && widget.isNotPrevious  ?
          CircleAvatar(
            child: Text("M"),
            radius: 34,
            backgroundColor: Colors.white,
          ) : Container(),
        ],
      ),
    );
  }
}
