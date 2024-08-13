// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class City {
  int id;
  String name;
  City({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name
    };
  }

  String toJson() => jsonEncode(toMap());

  factory City.fromMap(Map<String, dynamic> mapa){
    return City(
      id: mapa["id"] ?? 0,
       name: mapa["name"] ?? "");
  }

}
