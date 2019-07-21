import 'package:sqlflite_database_app/dbhelper.dart';
import 'package:sqlflite_database_app/employee.dart';
import 'package:sqlflite_database_app/myhomepage.dart';

void _submit(){
  if(this.fromKey.currentState.validate()){
    formKey.currentState.save();
  }
  var employee = Employee(firstname,lastname,mobileno, emailId);
  var dbHelper = DBHelper();
  dbHelper.saveEmployee(employee);
  _showSnackBar("Data saved successfully");
}

void _showSnackBar(String text) {
  scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text()));
}