import 'dart:convert';

import 'package:admin_cli/src/models/student.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class StudentRepository{
  Future<List<Student>> findAll() async{

    try{
      final studentsResult = await Dio().get("http://192.168.10.103:8080/students");

    return studentsResult.data.map<Student>((student) => Student.fromMap(student)).toList(); 
  
    } catch(e){
      print(e);
      throw Exception();
    }

  
  }

  Future<Student> findById(int id) async{
    
    try{
    final response = await Dio().get("http://192.168.10.103:8080/students/$id");
   
    if(response.data == null){
      print("Id não existe");
      throw Exception();
    }

  return Student.fromMap(response.data);
    } on DioException catch(e){
      print(e);
      throw Exception();
    }

    
  }

  Future<void> insert(Student student) async{
    
    try {
    await Dio().post("http://192.168.10.103:8080/students", data: student.toMap());
} on DioException catch (e) {
    print(e);
    throw Exception();
}
    

  }

  Future<void> update(Student student) async{
  
  try {
  await Dio().put("http://192.168.10.103:8080/students/${student.id}", data: student.toMap());
} on DioException catch (e) {
  print(e);
  throw Exception();
}
  
  }

  Future<void> delete(int id) async{
    
  try {
  await Dio().delete("http://192.168.10.103:8080/students/$id");
} on DioException catch (e) {
  print(e);
  throw Exception();
}
  }

  
  }


  
