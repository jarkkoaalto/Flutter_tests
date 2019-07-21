import 'dart:io';

import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'my_table';

  static final columnID = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  // Make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

// only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (database != null) return _database;
    // lazily instantiate the db the first time it is accessed

    _database = await _initDatabase();
    return _database;
  }

// this opent the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

//SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
  Create TABLE $table(
   $columnID INTEGER PRIMARY KEY,
   $columnName TEXT NOT NULL,
   $columnAge INTEGER NOT NULL
  )
  ''');
  }

  // Helper methods

// Inserts a row in the database where each key in the Map a column name and
// the value is the column value. The return value is the id of the instert row

  Future<int> inster(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

// All of the rows are returned as a list of maps, where each map is a key-value
// list of columns.

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // All of the method (insert, query, update, delete= can also be done using
  // raw SQL commads. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT Count(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnID];
    return await db.update(table, row, where: '$columnID = ?', whereArgs: [id]);
  }

// Deletes the row specified by the id. The number of affectend rows is
// returned, This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnID = ?', whereArgs: [id]);
  }
}
