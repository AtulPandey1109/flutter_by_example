import 'dart:async';
import 'package:my_login_app/model/mydb.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialise();
    return _database!;
  }

  Future<String> getFullPath() async {
    const name = 'local.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialise() async {
    final path = await getFullPath();
    var database = await openDatabase(path, version: 1, onCreate: create, singleInstance: true);
    return database;
  }

  Future<void> create(Database database,int version) async => await MyDb().createTable(database);

}