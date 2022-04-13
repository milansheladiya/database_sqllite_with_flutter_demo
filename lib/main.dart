import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQLLITE DEMO"),),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context){
                return _AddStudent();
              }));
            }, child: Text("Add Student")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext contect){
                    return _ListStudents();
                  }));
            }, child: Text("List the Student Record"))
          ],
        ),
      ),
    );
  }
}

