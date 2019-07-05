import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 70.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('images/zebra.png'),
        ), // CircleAvatar
      ), //Padding
    ); // Hero

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome to the Otherside',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ), // Text
    ); //Padding

    final insidetext = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        " Welcome to the new era in spaceflight, an astronaut said from inside SpaceX's ship ... ",
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ), // Text
    ); // Padding

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(children: <Widget>[
        alucard,
        welcome,
        insidetext,
      ],),
    );
    return Scaffold(
      body:body,
    );
  }
}
