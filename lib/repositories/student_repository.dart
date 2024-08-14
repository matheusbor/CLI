import 'dart:convert';

import 'package:admin_cli/src/models/student.dart';
import 'package:http/http.dart' as http;

class StudentRepository{
  Future<List<Student>> findAll() async{
    final alunos = await http.get(Uri.parse("http://192.168.10.103:8080/students"));
  
  if(alunos.statusCode != 200){
    throw Exception();
  }

  final alunosDados = jsonDecode(alunos.body);// as List; para o autocomplete funcionar - tirar depois para evitar comportamentos inesperados
  //decode necessário porque é mais de um?

  return alunosDados.map<Student>((student) => Student.fromMap(student)).toList(); 
  
  }

  Future<Student> findById(int id) async{
    final alunos = await http.get(Uri.parse("http://192.168.10.103:8080/students/$id"));

    if(alunos.statusCode != 200){
    throw Exception();
  }

    if(alunos.body == "{}"){//alunos.body.isEmpty json rest server não permite que body seja realmente vazio
      print("Id não existe");
      throw Exception();
    }

  return Student.fromJson(alunos.body);
  }

  Future<void> insert(Student student) async{
    final response = await http.post(Uri.parse("http://192.168.10.103:8080/students"), 
    body: student.toJson(), 
    headers: {
      "Content-Type": "application/json"
    });//como eniamos um corpo temos que enviar algo informando que é um content type json, se não vai enviar como texto
  
    if(response.statusCode != 200){
    throw Exception();
  }

  }

  Future<void> update(Student student) async{
    final response = await http.put(Uri.parse("http://192.168.10.103:8080/students/${student.id}"), 
    body: student.toJson(), 
    headers: {
      "Content-Type": "application/json"
    });//como eniamos um corpo temos que enviar algo informando que é um content type json, se não vai enviar como texto
  
    if(response.statusCode != 200){
    throw Exception();
  }
  }

  Future<void> delete(int id) async{
    final response = await http.delete(Uri.parse("http://192.168.10.103:8080/students/$id"));
  
    if(response.statusCode != 200){
    throw Exception();
  }
  }

  
  }


  
