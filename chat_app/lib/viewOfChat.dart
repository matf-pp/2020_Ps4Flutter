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
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _friendInital = widget.friendName.substring(0,1);
    });
    super.initState();
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
            child: FutureBuilder(
              future: loadJsonFile(context, 'assets/messageDetails.json'),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.hasData){
                      List<chatMessages> messagesOfChat = List();
                      Map<String,dynamic> mapTemp = snapshot.data;
                      int _index = 0;
                      mapTemp.forEach((_key,_value){
                        List<dynamic> _messageList = _value['messages'];
                        _messageList.forEach((_message){
                          messagesOfChat.add(chatMessages(
                            isFriend: true,
                            isNotPrevious: _messageList.length - 1 == _index,
                            friendsInit: "D",
                            message: _message["content"],
                            avatarUrl: _value["avatar"],
                          ));
                          _index++;
                        });
//                        if(_value["messages"]["from"] == "me") {
//                          messagesOfChat.add(chatMessages(isFriend: false,
//                            isNotPrevious: true,
//                            message: _value["messages"]['content'],
//                            friendsInit: "",
//                          ));
//                        }
//                        else{
//                          messagesOfChat.add(chatMessages(isFriend: true,
//                            isNotPrevious:true,
//                            message: _value["messages"]['content'],
//                          ));
//                        }
                      });
                      return ListView(children: messagesOfChat);
                  }
                  //Greska
                  else if(snapshot.hasError){
                    return Text('Somethink went wrong!');
                  }
                  //Nije uspeo da pronadje poruku
                  else{
                    return Center(child:Text("Found messages failed"));
                  }
                }
                else{
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(child:
                //Obrade teksta, podesavanje parametra, _controler promenljiva
                //koja se koristi za protok podataka u chat-u
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
  //Obrada podataka json format
  //Koriscenje async i await zbog sinhronizacije
  Future<List> loadMessageDetails()async{
    String messageDetailsString = await DefaultAssetBundle.of(context)
        .loadString('assets/messageDetails.json');
    Map<String, dynamic> mappedMessages = json.decode(messageDetailsString);
    List<dynamic> messages = mappedMessages['12345']['messages'];
    return messages;
  }

//  List<Widget> getMessages(){
//    List<Widget> retList = List();
//    retList.add(Text('No messages'));
//    loadMessageDetails().then((_value){
//      //provera podataka
//      if(_value != null){
//
//      }
//      else{
//
//      }
//    });
//    return retList;
//  }
}
