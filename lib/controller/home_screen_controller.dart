import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreenController with ChangeNotifier {
  static late Database database;
  List<Map> myDatalist = [];
  static Future<void> initDB() async {
    database = await openDatabase(
      'myDb.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE task (id INTEGER PRIMARY KEY, title TEXT, description TEXT, priority TEXT, status TEXT)');
      },
    );
  }

  Future<void> getData() async {
    List<Map> list = await database.rawQuery('SELECT * FROM task');
    myDatalist = list;
    notifyListeners();
  }

  Future<void> addData(
      {required String title,
      required String description,
      required String priority,
      required String status}) async {
    await database.rawInsert(
        'INSERT INTO task(title, priority, description,status) VALUES(?, ?, ?, ? )',
        [title, priority, description, status]);
    await getData();
  }

  Future<void> updateTask({required String status, required var id}) async {
    await database
        .rawUpdate('UPDATE Tasks SET status = ? WHERE id = ?', [status, id]);
    await getData();

    notifyListeners();
  }
}
