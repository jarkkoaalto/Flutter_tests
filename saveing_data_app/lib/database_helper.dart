// need for Directory();
import 'dart:io';

// needed for join()
import 'package:path/path.dart';

// need for SQL database operations
import 'package:sqflite/sqflite.dart';

// need for getApplictionDocumentDirectory()
import 'package:path_provider/path_provider.dart';

// database table and column names
final String tableWords = 'words';
final String columnId = '_id';
final String columnWord = 'word';
final String columnFrequency = 'frequency';

// data model class
class Word {
  int id;
  String word;
  int frequency;

  Word();

  // Convenience constructor to create a word object
  Word.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    word = map[columnWord];
    frequency = map[columnFrequency];
  }

// Convenience method to create a Map from this word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{columnWord: word, columnFrequency: frequency};
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

// Singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is the docss directory
  static final _databaseName = "MyDatabase.db";

  // Increment theis wgersion when you beed to change the schema
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

// Only allow a single open connection to the datatbase.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // Open the database
_initDatabase() async {
    // The bath_provider plugin gets the right directory for Android and iOS.
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, _databaseName);
  // Open the database, can also add an onUpdate callback parameter
  return await openDatabase(path,
  version: _databaseVersion,
  onCreate: _onCreate);
}

 //SQL string to create the database
Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableWords(
    $columnId INTEGER PRIMARY KEY,
    $columnWord TEXT NOT NULL,
    $columnFrequency INTEGER NOT NULL
    )
    ''');
}

// Databasee helper methods:
  Future<int> insert(Word word) async {
    Database db = await database;
    int id = await db.insert(tableWords, word.toMap());
    return id;
  }

  Future<Word> queryWord(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableWords,
    columns: [columnId, columnWord, columnFrequency],
    where: '$columnId = ?',
    whereArgs: [id]);
    if(maps.length > 0){
      return Word.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Word>> queryAllWords() async {
    Database db = await database;
    List<Map> maps = await db.query(tableWords);
    if(maps.length > 0){
      List<Word> words = [];
      maps.forEach((map) => words.add(Word.fromMap(map)));
      return words;
    }
    return null;
  }

  Future<int> deleteWord(int id) async {
    Database db = await database;
    return await db.delete(tableWords, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Word word) async {
    Database db = await database;
    return await db.update(tableWords, word.toMap(),
    where: '$columnId = ?', whereArgs: [word.id]);
  }
}

