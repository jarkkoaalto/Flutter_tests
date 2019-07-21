import 'package:flutter/material.dart';

import 'dart:async';

import 'package:sqlflite_database_app/employee.dart';
import 'package:sqlflite_database_app/dbhelper.dart';


Future<List<Employee>> fetchEmplyeesFromDatabase() async {
  var dbHelper = DBHelper();
  Future<List<Employee>> employees = dbHelper.getEmployees();
  return employees;
}

class MyEmployeeList extends StatefulWidget {
  @override
  _MyEmployeeListState createState() => _MyEmployeeListState();
}

class _MyEmployeeListState extends State<MyEmployeeList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Employee List'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new FutureBuilder<List<Employee>>(
            future: fetchEmplyeesFromDatabase(),
            builder: (context, snapshot){
              if(snapshot.hasData) {
                return new ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(snapshot.data[index].firstName,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                            new Text(snapshot.data[index].lastName,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0)),
                            new Divider()
                          ]);
                    });
              }else if(snapshot.hasError) {
                  return new Text("${snapshot.error}");
              }
                return new Container(alignment: AlignmentDirectional.center,child: new CircularProgressIndicator(),);
              },

            ),
      ),
    );
  }
}
