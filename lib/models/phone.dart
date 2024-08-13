// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Phone {
  int ddd;
  String phone;
  Phone({
    required this.ddd,
    required this.phone,
  });
  

  Map<String, dynamic> toMap(){
    return{
      "ddd": ddd,
      "phone": phone
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Phone.fromMap(Map<String, dynamic> mapa){
    return Phone(
      ddd: mapa["ddd"] ?? 0, 
      phone: mapa["phone"] ?? "0");
  }

  factory Phone.fromJson(String json) => Phone.fromMap(jsonDecode(json));
}
