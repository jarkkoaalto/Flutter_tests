import 'package:flutter/material.dart';
import 'package:sqlflite_database_app/dbhelper.dart';
import 'package:sqlflite_database_app/employee.dart';
import 'package:sqlflite_database_app/employeelist.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SQFLite Databsse demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: "Fluter Demo Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key:key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  Employee employee = new Employee("","","","");

  String firstname;
  String lastname;
  String emailId;
  String mobileno;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: new Text("Saving Employee"),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.view_list),
              tooltip: 'Next choice',
              onPressed: (){
                navigateToEmployeeList();
              })
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
                validator: (val) =>
                val.length == 0 ? "Enter Firstname" : null,
                onSaved: (val) => this.firstname = val,
              ),
              new TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(labelText: 'Last Name'),
                validator: (val) =>
                val.length == 0 ? "Enter Lastname" : null,
                onSaved: (val) => this.lastname = val,
              ),
              new TextFormField(
                keyboardType: TextInputType.phone,
                decoration: new InputDecoration(labelText: 'Mobile No'),
                validator: (val) =>
                val.length == 0 ? "Enter Mobile No" : null,
                onSaved: (val) => this.mobileno = val,
              ),
              new TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(labelText: 'Emial id'),
                validator: (val) =>
                val.length == 0 ? "Enter Email Id" : null,
                onSaved: (val) => this.emailId = val,
              ),
              new Container(margin: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                    onPressed: _submit,
                child: new Text('Login'),),)
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if(this.formKey.currentState.validate()){
      formKey.currentState.save();
    }else{
      return null;
    }
    var employee = Employee(firstname,lastname, mobileno, emailId);
    var dbHelper = DBHelper();
    dbHelper.saveRmplyee(employee);
    _showSnackBar("Data saved successfully");
  }

  void _showSnackBar(String text){
    scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(text)));
  }

  void navigateToEmployeeList() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MyEmployeeList()),
    );
  }
}
