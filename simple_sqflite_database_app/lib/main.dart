import 'package:flutter/material.dart';

import 'package:simple_sqflite_database_app/database_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),

      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {

  final dbHelper = DatabaseHelper.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQfLite"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('insert',style: TextStyle(fontSize: 20.0),),
              onPressed: () {_insert();},
            ),
            RaisedButton(
              child: Text('query',style: TextStyle(fontSize: 20.0),),
              onPressed: () {_query();},
            ),
            RaisedButton(
              child: Text('update',style: TextStyle(fontSize: 20.0),),
              onPressed: () {_update();},
            ),
            RaisedButton(
              child: Text('delete',style: TextStyle(fontSize: 20.0),),
              onPressed: () {_delete();},
            ),

          ],
        ),
      ),
    );
  }


  // Button onPressed methods
void _insert() async {
  // row to insert
  Map<String, dynamic> row = {
    DatabaseHelper.columnName: 'Bob',
    DatabaseHelper.columnAge: 23
  };
  final id = await dbHelper.inster(row);
  print('inserted row id: $id');
}

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnID : 1,
      DatabaseHelper.columnName : 'Mary',
      DatabaseHelper.columnAge : 32
    };
    final rowAffected = await dbHelper.update(row);
    print('updated $rowAffected row(s)');
  }

  void _delete() async {
    //Assuming that the number of rows is the id for the last row
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }



}
