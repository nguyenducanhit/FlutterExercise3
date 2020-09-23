import 'package:flutter/material.dart';
import 'package:flutter_app_3/add_student.dart';

import 'edit_student.dart';
import 'list_student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ListStudent.rootName,
      routes: {
        ListStudent.rootName: (context) => ListStudent(),
        EditStudent.rootName: (context) => EditStudent(),
        AddStudent.rootName: (context) => AddStudent(),
      },
    );
  }
}
