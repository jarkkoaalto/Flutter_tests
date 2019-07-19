import 'package:flutter/material.dart';
import 'package:sqlite_listview_data_app/GUI/MainHome.dart';

void main() async {
  var mainhome = new MainHome();

  List data = await (mainhome.getData());

  for(int x=0; x<data.length; x++){
    print('id = ${data[x]['id']} title= ${data[x]['title']}');
  }

  runApp(new MaterialApp(
    title: "SQLite API",
    home: MainHome(),
  ));
}
