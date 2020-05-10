import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key,
    this.name = "",
    this.profilAvatar = ""}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

  final String name;
  final String profilAvatar;

}

class _HomePageState extends State<HomePage> {
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
                  backgroundImage: Image.asset(widget.profilAvatar).image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.name,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ],
          ),
        )
    );
  }
}
