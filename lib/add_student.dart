import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'db.dart';
import 'package:sqflite/sqflite.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController address = TextEditingController();

  MyDB myDB = new MyDB();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myDB.open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Student"),),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(controller: name,
            decoration: InputDecoration(
              hintText: "Student name",
            ),),

            TextField(controller: rollno,
              decoration: InputDecoration(
                hintText: "Student rollno",
              ),),


            TextField(controller: address,
              decoration: InputDecoration(
                hintText: "Student address",
              ),),

            ElevatedButton(onPressed: (){
              myDB.db.rawQuery("INSERT INTO students(name, roll_no, address) values(?,?,?;",
                  [name.text,rollno.text,address.text]
              );
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("New Student Added")));
              name.text = "";
              rollno.text = "";
              address.text = "";
            }, child: Text("Add Student"))
          ],
        ),
      ),
    );
  }
}
