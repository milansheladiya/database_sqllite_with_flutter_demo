import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'db.dart';
import 'package:sqflite/sqflite.dart';

class EditStudent extends StatefulWidget {
    int rollno;
   EditStudent({required this.rollno});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController address = TextEditingController();

  MyDB myDb = new MyDB();

  @override
  void initState() {
    // TODO: implement initState
    myDb.open();
    Future.delayed(Duration(microseconds: 500), () async {
      var data = await myDb.getStudent(widget.rollno);
      if(data != null) {
        name.text = data["name"];
        rollno.text = data["roll_no"].toString();
        address.text = data["address"];
        setState(() {});
      }
      else {
        print ("No data with this roll no : " + widget.rollno.toString());
      }

    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Student"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
              hintText:'Student Name',
            ),
          ),

          TextField(
            controller: rollno,
            decoration: InputDecoration(
              hintText:'Roll No',
            ),
          ),
          TextField(
            controller: address,
            decoration: InputDecoration(
              hintText:'Address',
            ), ),

          ElevatedButton(onPressed: () {
            myDb.db.rawUpdate("Update students set name = ?, roll_no = ?, "
                "address = ? where roll_no = ?", [name.text, address.text, widget.rollno]);

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content:
                Text('Student data updated')));

          }, child: Text("update student data"),
          )

        ],),
      ),
    );
  }
}
