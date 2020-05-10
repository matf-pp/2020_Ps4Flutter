import 'package:chatapp/helper.dart';
import 'package:chatapp/messageOfChat.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class chatView extends StatefulWidget {
  @override
  _chatViewState createState() => _chatViewState();

  chatView({Key key,
    this.friendName:"" ,
    this.lastMessage: "",
    this.friendId,})
      :super(key:key);

  final String friendName;
  final String lastMessage;
  final String friendId;

}

class _chatViewState extends State<chatView> {
  String _friendInital;
  TextEditingController controller = TextEditingController();
  List<dynamic> listOfMessages;
  String avatarUrl;
  Map<String,dynamic> tmpMessages;
  FocusNode focusChatMessage;

  @override
  void initState() {
    focusChatMessage = FocusNode();
    listOfMessages = List();
    // TODO: implement initState
    setState(() {
      _friendInital = widget.friendName.substring(0,1);
    });
    super.initState();

    loadMessages(context);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusChatMessage.dispose();
    controller.dispose();
    super.dispose();
  }

  void loadMessages(BuildContext context) async{
    Map<String,dynamic> tmpObj =  await loadJsonFile(context, "assets/messageDetails.json");
    setState(() {
      listOfMessages = tmpObj[widget.friendId]["messages"];
      avatarUrl = tmpObj[widget.friendId]["avatar"];
    });
  }

  //Izgled widget-a pri ulasku u chat
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(widget.friendName),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                itemCount: listOfMessages.length,
                itemBuilder: (BuildContext context, int index){
                  loadMessages(context);

                  tmpMessages = listOfMessages[index];

//                  Map<String,dynamic> tmpMessages;

                  return chatMessages(
                    isFriend: true,
                    isNotPrevious: listOfMessages.length - 1 == index,
                    friendsInit: tmpMessages["display_name"].toString().substring(0,1),
                    message: tmpMessages["content"],
                    avatarUrl: avatarUrl,
                  );
                })
//            FutureBuilder(
//              future: loadJsonFile(context, 'assets/messageDetails.json'),
//              builder: (BuildContext context, AsyncSnapshot snapshot){
//                if(snapshot.connectionState == ConnectionState.done){
//                  if(snapshot.hasData){
//                      List<chatMessages> messagesOfChat = List();
//                      Map<String,dynamic> mapTemp = snapshot.data;
//                      int _index = 0;
//                      mapTemp.forEach((_key,_value){
//                        List<dynamic> _messageList = _value['messages'];
//                        _messageList.forEach((_message){
//                          messagesOfChat.add(chatMessages(
//                            isFriend: true,
//                            isNotPrevious: _messageList.length - 1 == _index,
//                            friendsInit: "D",
//                            message: _message["content"],
//                            avatarUrl: _value["avatar"],
//                          ));
//                          _index++;
//                        });
////                        if(_value["messages"]["from"] == "me") {
////                          messagesOfChat.add(chatMessages(isFriend: false,
////                            isNotPrevious: true,
////                            message: _value["messages"]['content'],
////                            friendsInit: "",
////                          ));
////                        }
////                        else{
////                          messagesOfChat.add(chatMessages(isFriend: true,
////                            isNotPrevious:true,
////                            message: _value["messages"]['content'],
////                          ));
////                        }
//                      });
//                      return ListView(children: messagesOfChat);
//                  }
//                  //Greska
//                  else if(snapshot.hasError){
//                    return Text('Somethink went wrong!');
//                  }
//                  //Nije uspeo da pronadje poruku
//                  else{
//                    return Center(child:Text("Found messages failed"));
//                  }
//                }
//                else{
//                  return CircularProgressIndicator();
//                }
//              },
//            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(child:
                //Obrade teksta, podesavanje parametra, _controler promenljiva
                //koja se koristi za protok podataka u chat-u
                TextFormField(
                  controller: controller,
                  autocorrect: false,
                  focusNode: focusChatMessage,
//                  autofocus: true,
                  onFieldSubmitted: (String _message){
                    submitText();
                  },
                  decoration: InputDecoration(hintText: "Type your message here",
                    labelText: "Your message",
                    helperText: "Line for message"
                  )
                )),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                          Icons.send,
                          color: Colors.blue,),
                      onPressed: (){
                        submitText();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.blue,),
                      onPressed: (){
//                        FocusScope.of(context).requestFocus(focusChatMessage);
//                        submitText();
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

  void submitText() {
    if (controller.text.length > 0) {
      //Kreiranje nove poruke
      Map<String, dynamic> newMessage = {
        "type": "string",
        "content": controller.value.text,
        "from": "me",
      };

      try {
        listOfMessages.add(newMessage);
        controller.clear();
      }
      catch (e) {
        print("Error: ${e.toString()}");
      }
      print(listOfMessages);
    }
  }
}
