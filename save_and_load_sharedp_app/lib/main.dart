import 'package:flutter/material.dart';
import 'myhomepage.dart';
import 'nextpage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        NextPage.routeName: (context) => new NextPage(),
      },
    );
  }
}

