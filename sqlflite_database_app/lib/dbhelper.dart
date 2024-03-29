import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlflite_database_app/employee.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  // Creatnig database with name test.dn in your directory
  initDb() async {
    io.Directory documentDirectory = await getApplicationSupportDirectory();
    String path = join(documentDirectory.path, "text.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int version) async {
    // When creatting the db, create the table
    await db.execute(
        "CREATE TABLE Employee(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, mobileno TEXT, emailId TEXT)");
    print("Created tables");
  }

  // Retriving employee from Employee Tables
  Future<List<Employee>> getEmployee() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    List<Employee> employees = new List();
    for (int i = 0; i < list.length; i++) {
      employees.add(new Employee(list[i]["firstname"], list[i]["lastname"],
          list[i]['mobileno'], list[i]["emailid"]));
    }
    print(employees.length);

    return employees;
  }

  void saveRmplyee(Employee employee) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async{
      return await txn.rawInsert(
        'INSERT INTO Employee(firstnama, lastaname, mobileno, emailid) VALUES(' +
          '\'' +
          employee.firstName +
          '\'' +
          ',' +
          '\'' +
          employee.lastName +
          '\'' +
          ',' +
          '\'' +
          employee.mobileNo +
            '\'' +
            ',' +
            '\'' +
          employee.emailId +
            '\'' +
            ')');
    });
  }

  Future<List<Employee>>getEmployees() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    List<Employee> employees = new List();
    for(int i=0; i<list.length; i++){
      employees.add(new Employee(list[i]["firstName"],list[i]["lastName"], list[i]["mobileNo"], list[i]["emailId"]));
    }
    print(employees.length);
    return employees;
  }
}
