import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();

  Future<List> getData() async {
    String myUrl = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(myUrl);
    return json.decode(response.body);
  }
}

class _MainHomeState extends State<MainHome> {
  @override
  var mainhome = new MainHome();
  List data = [
    {'userId': 1,
      'id': 1,
      'title': "testi",
      'body': "testausta",
    },
  ];

  int mytextData1 = 0;
  String mytextData2 = '';
  String mytextData3 = '';

  void getMyData() async {
    data = await (mainhome.getData());
    print(data);
    setState(() {
      mytextData1 = data[0]['id'];
      mytextData2 = data[0]['title'];
      mytextData3 = data[0]['body'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("SQLite api"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: new Container(
          child: new Column(
        children: <Widget>[
          new Center(
            child: new RaisedButton(
              onPressed: getMyData,
              child: new Text('click me'),
            ),
          ),

          new Center(
            child: new ListView.builder(
                padding: EdgeInsets.all(12.0),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int position) {
                  return new ListTile(
                    title: new Text(
                      "${data[position]['title']}",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.pink),
                    ),
                    subtitle: new Text(
                      "${data[position]['body']}",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.pink,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                    leading: new CircleAvatar(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white,
                      child: new Text("P ${data[position]['id']}"),
                    ),
                  );
                },
                ),
          ),
        ],
      ),
      ),
    );
  }
}
