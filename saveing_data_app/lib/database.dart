import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:saveing_data_app/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saving Data"),
      ),

      body: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Read'),
              onPressed: () {
                _read();
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Save'),
              onPressed: () {
                _save();
              },
            ),
          ),
        ],
      ),
    );
  }

  _read() async {
    // query one world
    DatabaseHelper helper = DatabaseHelper.instance;
    int rowId = 1;
    Word word = await helper.queryWord(rowId);
    if (word == null) {
      print('read row $rowId : empty');
    } else {
      print('read row $rowId: ${word.word} ${word.frequency}');
    }

    // Query all

    helper = DatabaseHelper.instance;
    final words = await helper.queryAllWords();
    if (words != null) {
      words.forEach((word) {
        print('row ${word.id}: ${word.word} ${word.frequency}');
      });
    }
  }

  _save() async {
    //Insert
    Word word = Word();
    word.word = 'hello';
    word.frequency = 15;
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insert(word);
    print('inserted row: $id');

    // update

    word = Word();
    word.id = 1;
    word.word = 'goodbye';
    word.frequency = 594;
    helper = DatabaseHelper.instance;
    int count = await helper.update(word);
    print('updated $count row(s)');

    //  delete
    helper = DatabaseHelper.instance;
    id  = 1;
    count = await helper.deleteWord(id);
    print('deleted $count row(s)');

  }
}
