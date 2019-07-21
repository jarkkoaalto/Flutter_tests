import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'myhomepage.dart';

class NextPage extends StatefulWidget {
  static String routeName = "/nextPage";

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String _name = "";

  void initState(){
    getNamePreference().then(_updateName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text("Next Page"),
        ),
        body: new ListTile(
          title: new Text(_name),
        ));
  }

  void _updateName(String name){
    setState(() {
      this._name = name;
    });

  }
}
