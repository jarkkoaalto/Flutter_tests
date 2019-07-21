import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'nextpage.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<bool> savedPreferensce(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
  return prefs.commit();
}

Future<String> getNamePreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String name = prefs.getString("name");
  return name;
}


class _MyHomePageState extends State<MyHomePage> {
  var _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Home Page"),
        ),
        body: new ListView(
          children: <Widget>[
            new ListTile(
              title: new TextField(
                controller: _controller,
              ),
            ),
            new ListTile(
              title: new RaisedButton(
                  child: new Text('Next Page'),
                  onPressed: () {
                    saveName();
                  }),
            )
          ],
        ));
  }
  void saveName() {
    String name = _controller.text;
    savedPreferensce(name).then((bool committed) {
      Navigator.of(context).pushNamed(NextPage.routeName);
    });
  }
}
