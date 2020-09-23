

import 'dart:math';

import 'package:flutter_app_3/student.dart';

class Data {
  static List<Student> generate(int size) {
      var names = ["Nguyen Duc Anh", "Duc Anh Nguyen", "Anh Nguyen Duc"];
      var subjects = ["Mon 1", "Mon 2", "Mon 3"];
      List<Student> list = new List();
      for (int i = 0; i < size; i++) {
        Random random = new Random();
        String name = names.elementAt(random.nextInt(2));
        String subject = subjects.elementAt(random.nextInt(2));
        double score = random.nextInt(10).roundToDouble();
        list.add(new Student(name, subject, score));
      }
      return list;
  }
}