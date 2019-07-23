import 'package:flutter/material.dart';


import 'package:demo_solitare_app/game_screen.dart';
/**
 * https://github.com/deven98/FlutterSolitaire
 */
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
      home: GameScreen(),
    );
  }
}

