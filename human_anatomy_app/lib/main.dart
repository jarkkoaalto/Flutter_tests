import 'package:flutter/material.dart';

import 'fullpagehumanbody.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Full Human Anatomy",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,

      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to Flutter"),
        ),
        body: FullPageHumanBody(),
      ),
    );
  }
}
