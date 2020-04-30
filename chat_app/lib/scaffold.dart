  import 'package:chatapp/HeadOfCheat.dart';
import 'package:chatapp/viewOfChat.dart';
import 'package:flutter/material.dart';

  class myChatApp extends StatefulWidget {
    @override
    _myChatAppState createState() => _myChatAppState();
  }
  
  class _myChatAppState extends State<myChatApp> {
    int _currentIndex = 0;
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
                  print("Button was pressed");
                },)
            ],
          ),
          body: ListView(
            children: <Widget>[
              HeadOfChat(),
              HeadOfChat(),
              HeadOfChat()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
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
                _currentIndex = index;
              });
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed:(){
              print("Fab was pressed");
            },
            child: Icon(Icons.add),
          ),
        ),
//      home: chatView()
      );
    }
  }
  