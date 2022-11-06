import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  static final _databasename = "persons.db";
  static final _databaseversion = 1;
  static final table = "my_table";
  static final table2 = "my_table2";
  static final columnID = "id";
  static final columngift = "name";
  static final columnpoint = "mobile";
  static final columndisc1 = "sms";
  static final columndisc = "date";

  static final id = "id";
  static final year = "year";
  static final month = "month";
  static final date = "date";
  static final hour = "hour";
  static final minust = "minust";
  static final status = "status";

  static Database? _database;

  Databasehelper._privateConstructor();
  static final Databasehelper instance = Databasehelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    _database = await _initDatabase1();
    return _database!;
  }

  _initDatabase1() async{
    Directory documentdirectory = await getApplicationDocumentsDirectory();
    String path = join(documentdirectory.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate1);
  }
  Future _onCreate1(Database db, int versoion) async {
    await db.execute('''
CREATE TABLE $table2(
  $id INTEGER PRIMARY KEY AUTOINCREMENT,
  $year TEXT NOT NULL,
  $month TEXT NOT NULL,
  $date TEXT NOT NULL,
  $hour TEXT NOT NULL,
  $minust TEXT NOT NULL,
  $status TEXT NOT NULL
  
)
 ''');


  }

  _initDatabase() async {
    Directory documentdirectory = await getApplicationDocumentsDirectory();
    String path = join(documentdirectory.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int versoion) async {
    await db.execute('''
CREATE TABLE $table(
  $columnID INTEGER PRIMARY KEY AUTOINCREMENT,
  $columngift TEXT NOT NULL,
  $columnpoint TEXT NOT NULL,
  $columndisc1 TEXT NOT NULL,
  $columndisc TEXT NOT NULL
   
  
)
 ''');

   
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // final dbhelper = Databasehelper.instance;
  //
  // void insertdata() async{
  //   Map<String,dynamic> row={
  //     Databasehelper.columnName:"Amarjeet",
  //     Databasehelper.columnage:20,
  //   };
  //   final id =await dbhelper.insert(row);
  //
  // }





}
