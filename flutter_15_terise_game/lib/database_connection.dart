import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection{
  static Database? _db;

  Future<Database> get database async{
    if(_db!=null)return _db!;
    _db=await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase()async{
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(join(await getDatabasesPath(), 'terise_game_database.db'),version: 1,onCreate:_onCreateDatabase );
    return database;
    
  }
  _onCreateDatabase(Database db,int ver)async{
    await db.execute('CREATE TABLE scores(id INTEGER PRIMARY KEY, score INTEGER)');
  }


  insert(int score)async{
    Database db=await database;

    var res=await db.insert(
    'scores',
    {'score':score},
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return res;
  }
  getAll()async{
    Database db=await database;
    List<Map<String, dynamic>> maps = await db.query('scores');
    List data=[];
    print(maps);
    maps.forEach((ele) {
      data.add(ele);
     });
    return data;
  }
  deleteAll()async{
    Database db=await database;
    db.delete('scores');
  }
  updateScore(int score,int id)async{
    Database db=await database;
    return await db.update('scores', {'score':score},where: 'id=?',whereArgs: [id]);
  }
  // Future<int> deleteNote(Note note)async{
  //   Database db=await database;
  //   int res=await db.delete('notes',where: 'id=?',whereArgs: [note.id]);
  //   return res;
  // }

  // insertTest() async{
  //   print('reach');
  //   Database db=await database;
  //   Map<String,dynamic> dd={'title':'HIHI'};
  //   db.delete('notes');
  //   await db.insert(
  //   'notes',
  //   dd,
  //   conflictAlgorithm: ConflictAlgorithm.replace,
  // );
  
  // List<Map<String, dynamic>> maps = await db.query('notes');
  // print(maps);
  // }

}