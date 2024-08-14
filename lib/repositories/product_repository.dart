import 'dart:convert';

import 'package:admin_cli/src/models/course.dart' ;
import 'package:dio/dio.dart';
import 'package:http/http.dart'as http;

class ProductRepository{
  Future<Course> findByName(String name) async{//para so passar o nome no terminal e buscar o id
  
  try{
 
    final response = await Dio().get('http://localhost:8080/products?', queryParameters: {
      "name": name
    });

  if (response.data.isEmpty){
    throw Exception("Produto não encontrado");
  }

  return Course.fromMap(response.data.first);
  }catch(e){
      print(e);
      throw Exception();

  }
  
  }
}