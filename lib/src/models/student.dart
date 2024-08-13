// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin_cli/src/models/address.dart';
import 'package:admin_cli/src/models/course.dart';

class Student {
  final  int? id;
  final  String name;
  final  int? age;
  final  List<String> nameCourses;
  final  List<Course> courses;
  final  Address address;
  Student({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "age": age ?? 0,
      "nameCourses": nameCourses,
      "courses": courses.map((entrieCurso) => entrieCurso.toMap()).toList(),
      "address": address.toMap()
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Student.fromMap(Map<String, dynamic> mapa){
    return Student(
      id: mapa["id"] ?? 0,
       name: mapa["name"] ?? "",
       age: mapa["age"],
        nameCourses: List<String>.from(mapa["nameCourses"] ?? <String>[]),
        courses: mapa["course"]?.map<Course>((entrieCurso) => Course.fromMap(entrieCurso)).toList() ?? <Course>[],
        address: Address.fromMap(mapa["address"] ?? <String, dynamic> {}));
  }

  factory Student.fromJson(String json) => Student.fromMap(jsonDecode(json));
    

}
