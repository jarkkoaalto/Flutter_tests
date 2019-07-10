import 'package:flutter/material.dart';
import 'dart:async';
import 'package:splash_app/landingscreen.dart';



void main() => runApp(new MaterialApp(
  
  home: new SplashScreen(),
  routes: <String, WidgetBuilder>{
    '/LandingScreen':  (BuildContext context) => new LandingScreen()
  },
));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/LandingScreen');
  }

  @override
  void initState(){
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('images/zebra.png'),
      ),
    );
  }
}
