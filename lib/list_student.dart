import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/add_student.dart';
import 'package:flutter_app_3/data.dart';
import 'package:flutter_app_3/student.dart';

import 'item_student.dart';

class ListStudent extends StatefulWidget {
  static const String rootName = "ListStudent";

  @override
  State<StatefulWidget> createState() {
    return new ListState();
  }
}

class ListState extends State<ListStudent> {
  List<Student> data = Data.generate(20);

  get listStudent => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {
              showDialogConfirm(context, index);
            },
            child: ItemStudent(data.elementAt(index)),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          listStudent,
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(50),
              child: FloatingActionButton(
                onPressed: () async {
                  final result = await Navigator.of(context)
                      .pushNamed(AddStudent.rootName);
                  _addItem(result as Student);
                },
                child: new Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }

  _addItem(Student student) {
    setState(() {
      data.add(student);
    });
  }

  void showDialogConfirm(BuildContext context, int index) {
    Widget buttonOK = FlatButton(
      child: Text("YES"),
      onPressed: () {
        Navigator.pop(context);
        setState(() {
          data.removeAt(index);
        });
      },
    );

    Widget buttonCancel = FlatButton(
      child: Text("NO"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Are you sure?"),
      actions: [buttonOK, buttonCancel],
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }
}
