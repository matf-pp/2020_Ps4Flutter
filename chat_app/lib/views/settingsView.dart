import 'package:chatapp/homePage.dart';
import 'package:chatapp/views/viewOfHome.dart';
import 'package:flutter/material.dart';

class settingsView extends StatefulWidget {
  @override
  _settingsViewState createState() => _settingsViewState();
}

class _settingsViewState extends State<settingsView> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerImage = TextEditingController();

  String valueName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child:
                       TextFormField(
                          controller: controllerName,
                          autocorrect: false,
                          decoration: InputDecoration(hintText: "Type your username here",
                              labelText: "Change username",
                          )
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                    child: RaisedButton(
                        color: Colors.blue,
                        child:Text(
                          "Confirm",
                        ),
                        onPressed: (){
                          print('Confim');
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) {
                              return homeView(
                                  name: controllerName.text,
                              );
                            }, fullscreenDialog: true
                          ));
                          controllerName.clear();
                        },
                    ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child:
                    TextFormField(
                        controller: controllerImage,
                        autocorrect: false,
                        onFieldSubmitted: (String _message){
                        },
                        decoration: InputDecoration(hintText: "Type image location here",
                          labelText: "Change image",
                        )
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  //Dugme za promenu slike
                  child: RaisedButton(
                    color: Colors.blue,
                    child:Text(
                      "Confirm",
                    ),
                    onPressed: (){
                      print('Confim');
                      controllerImage.clear();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

//  String newValueAvatar(){
//
//    if(_controllerImage.text.length > 0){
//      return _controllerImage.value.toString();
//    }
//
//  }

}
