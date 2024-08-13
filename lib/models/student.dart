// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_cli/models/address.dart';
import 'package:admin_cli/models/course.dart';

class Student {
    int id;
    String name;
    List<String> nameCourses;
    List<Course> courses;
    Address address;
  Student({
    required this.id,
    required this.name,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });
    

}
