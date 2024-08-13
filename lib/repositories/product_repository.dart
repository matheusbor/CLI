import 'dart:convert';

import 'package:admin_cli/src/models/course.dart' ;
import 'package:http/http.dart'as http;

class ProductRepository{
  Future<Course> findByName(String name) async{//para so passar o nome no terminal e buscar o id
  final response = await http.get(Uri.parse('http://localhost:8080/products?name=$name'));

  if(response.statusCode != 200){

    throw Exception();
  }

  final responseCurso = jsonDecode(response.body);

  if (responseCurso.isEmpty){
    throw Exception("Produto não encontrado");
  }

  return Course.fromMap(responseCurso.first);
  }
}