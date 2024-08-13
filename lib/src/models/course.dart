// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Course {
  int id;
  String name;
  bool isStudent;
  Course({
    required this.id,
    required this.name,
    required this.isStudent,
  });

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "isStudent": isStudent
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Course.fromMap(Map<String, dynamic> mapa){
    return Course(
      id: mapa['id'] ?? 0, 
      name: mapa['name'] ?? "", 
      isStudent: mapa['isStudent'] ?? false);
  }

  factory Course.fromJson(String json) => Course.fromMap(jsonDecode(json));
  
}
