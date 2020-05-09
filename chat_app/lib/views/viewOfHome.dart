import 'package:flutter/material.dart';

class homeView extends StatefulWidget {
  @override
  _homeViewState createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget>[
           Center(
             child:
             CircleAvatar(
               radius: 70,
               backgroundColor: Colors.grey,
               backgroundImage: Image.asset("assets/images/avatarMe.jpg").image,
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(
               "Marko Vicentijevic",
               style: Theme.of(context).textTheme.title,
             ),
           ),
         ],
        ),
      )
    );
  }
}
