import 'package:chatapp/messageOfChat.dart';
import 'package:flutter/material.dart';

class chatView extends StatefulWidget {
  @override
  _chatViewState createState() => _chatViewState();

  chatView({Key key,
    this.friendName:"" ,
    this.lastMessage: ""})
      :super(key:key);

  final String friendName;
  final String lastMessage;

}

class _chatViewState extends State<chatView> {
  String _friendInital;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _friendInital = widget.friendName.substring(0,1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friendName),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView(
              children: <Widget>[
                chatMessages(isFriend: true,
                  isNotPrevious: true,
                  friendsInit: _friendInital,
                  message: "Gde mi je prase??",),
//          chatMessages(isFriend: false,
//            isNotPrevious: true,
//            friendsInit: _friendInital,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(child:
                TextFormField(
                  controller: _controller,
                  onFieldSubmitted: (String _message){
                    print("on field submited >>" + _message);
                  },
                  decoration: InputDecoration(hintText: "Type your message here",
                    labelText: "Your message",
                    helperText: "Line for message"
                  )
                )),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                          Icons.send,
                          color: Colors.blue,),
                      onPressed: (){

                        print('Send message tapped >> ' + _controller.text);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
