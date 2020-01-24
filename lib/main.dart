import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:api/main.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "API",
      debugShowCheckedModeBanner: true,
      home: MainPage(),
      theme: ThemeData(
        accentColor: Colors.white,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //Url Api Dipanggil
  final String Url = "https://reqres.in/api/unknown";
  List data;
  @override
  void initState(){
    this.getDataJson();
  }

  Future<String> getDataJson() async {
    var response = await http.get(
      Uri.encodeFull(Url),
        headers: {"Accept": "application/json"}
    );
    print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['data'];
    });
    return "Succes";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("API"),
      ),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add,color: Colors.teal),
          onPressed: (){
        }),
      body: new ListView.builder(
          itemBuilder: null),
    );
  }
}

