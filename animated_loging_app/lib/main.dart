import 'package:flutter/material.dart';

import './loginpage.dart';
import './home_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes  = <String, WidgetBuilder>{
    LoginPage.tag:(context) => LoginPage(),
    HomePage.tag:(context) => HomePage(),
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestAsnsimated App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      
      ), // ThemeData
      home: LoginPage(),
      routes: routes,

    ); // MaterialApp
  }
}
