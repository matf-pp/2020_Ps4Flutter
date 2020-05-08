import 'package:flutter/material.dart';

class chatMessages extends StatefulWidget {
  const chatMessages({Key key,
    this.isFriend : false,
    this.isNotPrevious: false,
    this.message : "",
    this.friendsInit : "",
    this.avatarUrl : ""})
      : super(key: key);

  @override
  _chatMessagesState createState() => _chatMessagesState();

  final String avatarUrl;
  final bool isFriend;
  final bool isNotPrevious;
  final String message;
  final String friendsInit;
}
//klasa poruke - izgled poruke prilikom prelistavanja poruke
class _chatMessagesState extends State<chatMessages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 40.0,
            child:
              widget.isFriend && widget.isNotPrevious ?
              CircleAvatar(
                backgroundImage: Image.network(widget.avatarUrl).image,
                radius: 20,
                backgroundColor: Colors.white,
              ) : Container(),),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(widget.message),
            ),
          ),
          SizedBox(
            width: 40.0,
            child:
              !widget.isFriend && widget.isNotPrevious  ?
              CircleAvatar(
                backgroundImage: Image.asset('assets/images/avatarMe.jpg').image,
                radius: 20,
                backgroundColor: Colors.white,
              ) : Container(),
          )
        ],
      ),
    );
  }
}
