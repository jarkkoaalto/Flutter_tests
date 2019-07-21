import 'package:flutter/material.dart';
import 'package:sqlflite_database_app/submitform.dart';
import 'package:sqlflite_database_app/dbhelper.dart';
import 'package:sqlflite_database_app/main.dart';
;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  String firstname;
  String lastname;
  String emailid;
  String mobileno;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: new Text('Saving Employee'),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.view_list),
              tooltip: 'Next Choise',
              onPressed: () {
                navigateToEmployeeList();
              },
              ),
        ],
      ),
      body: new Padding(
          padding: const EdgeInsets.all(16.0),
      child: new Form(
        key: formKey,
        child: new Column(
          children: [
            new TextFormField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: 'First Name'),
              validator: (val) => val.length == 0 ? "Enter FirstName" : null,
              onSaved: (val) => this.firstname = val,
            ),
            new TextFormField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: 'Last Name'),
              validator: (val) => val.length == 0 ? "Enter LastName" : null,
              onSaved: (val) => this.lastname = val,
            ),
            new TextFormField(
              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(labelText: 'Mobile No'),
              validator: (val) => val.length == 0 ? "Enter Mobile No" : null,
              onSaved: (val) => this.mobileno = val,
            ),
            new TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(labelText: 'Email Id'),
              validator: (val) => val.length == 0 ? "Enter Email Id" : null,
              onSaved: (val) => this.emailid = val,
            ),
            new Container(
              margin: const EdgeInsets.only(top:10.0),
            child: new RaisedButton(onPressed: _submit,
            child: new Text('Login'),
            ),
            )
          ],
        ),
      ),)
    )
  }
}