import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/student.dart';

class AddStudent extends StatefulWidget {
  static const String rootName = "AddStudent";

  @override
  State<StatefulWidget> createState() => AddState();
}

class AddState extends State<AddStudent> {
  final nameController = TextEditingController();
  final subjectsController = TextEditingController();
  final scoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Add student",
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
                controller: nameController,
                decoration: InputDecoration(hintText: "Name"),
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
                controller: subjectsController,
                decoration: InputDecoration(hintText: "Subjects"),
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
                controller: scoreController,
                decoration: InputDecoration(hintText: "Score"),
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
            child: Text("Add"),
            onPressed: () {
              Navigator.pop(
                  context,
                  new Student(nameController.text, subjectsController.text,
                      double.parse(scoreController.text)));
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
