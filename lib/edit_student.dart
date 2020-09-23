import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/student.dart';

class EditStudent extends StatefulWidget {
  static const String rootName = "EditStudent";

  @override
  State<StatefulWidget> createState() => EditStudentState();
}

class EditStudentState extends State<EditStudent> {
  final nameController = TextEditingController();
  final subjectsController = TextEditingController();
  final scoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Student student = ModalRoute.of(context).settings.arguments as Student;
    nameController.text = student.name;
    subjectsController.text = student.subjects;
    scoreController.text = student.score.toString();
    // TODO: implement build
    return Center(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Edit student",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
              )),
              child: TextField(
                decoration: InputDecoration(hintText: "Name"),
                controller: nameController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
              )),
              child: TextField(
                decoration: InputDecoration(hintText: "Subjects"),
                controller: subjectsController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
              )),
              child: TextField(
                decoration: InputDecoration(hintText: "Score"),
                controller: scoreController,
              ),
            ),
            actionButton(context)
          ],
        ),
      ),
    );
  }

  Widget actionButton(BuildContext context) => Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("Save"),
            onPressed: () {
              Navigator.pop(context, new Student(nameController.text, subjectsController.text, double.parse(scoreController.text)));
            },
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: RaisedButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ));
}
