import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_10_sqlite/databases/notes_model.dart';

class DatabaseConnection{
  static Database? _db;

  Future<Database> get database async{
    if(_db!=null)return _db!;
    _db=await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase()async{
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(join(await getDatabasesPath(), 'doggie_database.db'),version: 1,onCreate:_onCreateDatabase );
    return database;
    
  }
  _onCreateDatabase(Database db,int ver)async{
    await db.execute('CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, priority INTEGER, description TEXT)');
  }


  insertNote(Note note)async{
    Database db=await database;

    var res=await db.insert(
    'notes',
    note.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return res;
  }
  getAllNote()async{
    Database db=await database;
    List<Map<String, dynamic>> maps = await db.query('notes',orderBy: 'priority');
    List data=[];
    print(maps);
    maps.forEach((ele) {
      data.add(Note(ele['title'], ele['priority'],ele['id'],ele['description']));
     });
    return data;
  }
  deleteAll()async{
    Database db=await database;
    db.delete('notes');
  }
   updateNote(Note note)async{
    Database db=await database;
    return await db.update('notes', note.toMap(),where: 'id=?',whereArgs: [note.id]);
  }
  Future<int> deleteNote(Note note)async{
    Database db=await database;
    int res=await db.delete('notes',where: 'id=?',whereArgs: [note.id]);
    return res;
  }

  insertTest() async{
    print('reach');
    Database db=await database;
    Map<String,dynamic> dd={'title':'HIHI'};
    db.delete('notes');
    await db.insert(
    'notes',
    dd,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  
  List<Map<String, dynamic>> maps = await db.query('notes');
  print(maps);
  }

}