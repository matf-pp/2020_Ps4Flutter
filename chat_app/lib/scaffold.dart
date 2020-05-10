import 'package:chatapp/HeadOfCheat.dart';
import 'package:chatapp/viewOfChat.dart';
import 'package:chatapp/views/historyOfChat.dart';
import 'package:chatapp/views/settingsView.dart';
import 'package:chatapp/views/viewOfHome.dart';
import 'package:flutter/material.dart';

  class myChatApp extends StatefulWidget {
    @override
    _myChatAppState createState() => _myChatAppState();
  }
  // scaffold widget ili main widget osnovni widget na koji gradimo citavu aplikaciju
  class _myChatAppState extends State<myChatApp> {
    int currentIndex = 0;
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Chat application'),
            actions: <Widget>[
              IconButton(icon:
                Icon(Icons.live_help),
                onPressed: (){
                  print("Help button was pressed");
                },)
            ],
          ),
          body:
              selectScreen(currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat),title: Text('Chats')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),title: Text('Settings')),
            ],
            onTap: (int index){
              print("index is " + index.toString());
              setState(() {
                currentIndex = index;
              });
            },
          ),
//          floatingActionButton: FloatingActionButton(
//            onPressed:(){
//              print("Plus was pressed");
//            },
//            child: Icon(Icons.add),
//          ),
        ),
//      home: chatView()
      );
    }
    Widget selectScreen(int index){
      switch(index){
        case 0:
          return homeView();
          break;
        case 1:
          return ChatHistory();
          break;
        case 2:
          return settingsView();
          break;
        default:
          return homeView();
      }
    }
  }
  