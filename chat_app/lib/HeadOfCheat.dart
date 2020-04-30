import 'package:flutter/material.dart';

class HeadOfChat extends StatefulWidget {
  @override
  _HeadOfChatState createState() => _HeadOfChatState();
}

class _HeadOfChatState extends State<HeadOfChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        width: double.infinity,
        height: 100.0,
        color:Colors.grey[300],
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("<Friend's name>",
                      style: Theme.of(context).textTheme.title
                  ),
                  Text('Last message',
                      style: Theme.of(context).textTheme.body2
                  ),
                  Text('Last message time',),
                ],
              ),
            ),
            Center(
              child: CircleAvatar(
                radius: 35,
                child: Text('T',
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .apply(color: Colors.white,fontWeightDelta: 3),
                ),
              )
            )
          ],
        )
    );
  }
}
