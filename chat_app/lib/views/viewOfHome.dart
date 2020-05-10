import 'package:chatapp/homePage.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/views/settingsView.dart';

class homeView extends StatefulWidget {

  String name;
  String profilAvatar;
  homeView({Key key,
    this.name = "Marko Vicentijevic",
    this.profilAvatar = "assets/images/avatarMe.jpg"}) : super(key: key);

  @override
  _homeViewState createState() => _homeViewState(name);

}

class _homeViewState extends State<homeView> {

  String name;
  _homeViewState(this.name);

  @override
  Widget build(BuildContext context) {
//    settingsView settingsPar = settingsView();
//    if(settingsPar.profilName.length > 0)
//      widget.name = settingsPar.profilName;
    return Container(
      child:  HomePage(
        name: widget.name,
        profilAvatar: widget.profilAvatar,
        ),
    );
  }
}
