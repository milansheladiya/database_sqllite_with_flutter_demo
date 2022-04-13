import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDB{

  late Database db; // open a database

  Future open() async {
    // get a location using getDatabasePath

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    // join is from path package
    if (kDebugMode) {
      print(path);
    }

    db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {

          // when creating the db, create the table
          await db.execute('''
          create table if not exist students(
          id primary key,
          name varchar(255) not null,
          roll_no int not null,
          address varchar(255) not null
          );
          ''');
          if (kDebugMode) {
            print('Table created');
          }
        });

    Future<Map<dynamic,dynamic>?> getStudent (int rollno) async{

      List<Map> maps = await db.query('students', whereArgs: [rollno]);

      // getting student data with rollno , return

      if(maps.length > 0){
        return maps.first;
      }

      return null;

    }

  }

}