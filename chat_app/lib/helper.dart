import 'dart:convert';
import 'package:flutter/material.dart';


//Obrada podataka json format
//Koriscenje async i await zbog sinhronizacije
Future<Map<String,dynamic>> loadJsonFile(BuildContext context, String assetPath)async{
  String messageDetailsString = await DefaultAssetBundle.of(context)
      .loadString(assetPath);
  Map<String, dynamic> mappedMessages = json.decode(messageDetailsString);
  return mappedMessages;
}