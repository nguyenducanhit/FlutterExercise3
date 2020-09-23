import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/edit_student.dart';
import 'package:flutter_app_3/student.dart';

class ItemStudent extends StatefulWidget {
  Student student;

  ItemStudent(this.student);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ItemStudentState(student);
  }
}

class ItemStudentState extends State<ItemStudent> {
  Student student;

  ItemStudentState(this.student);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.pushNamed(context, EditStudent.rootName,
            arguments: student);
        setState(() {
          student = result as Student;
        });
      },
      child: Column(
        children: [
          rowView(context),
          Divider(
            color: Colors.grey,
            height: 2,
          )
        ],
      ),
    );
  }

  Widget rowView(BuildContext context) => Row(
        children: [
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            child: Text(
              student.name.substring(0, 1).toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Container(
            height: 50,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: Text(student.name, style: TextStyle(fontSize: 20),)),
                Expanded(flex: 1, child: Text(student.subjects)),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              student.score.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey),
            ),
          ),
          Container(
            child: Divider(
              color: Colors.grey,
            ),
          )
        ],
      );

}
