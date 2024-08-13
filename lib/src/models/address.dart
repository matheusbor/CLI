// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin_cli/src/models/city.dart';
import 'package:admin_cli/src/models/phone.dart';

class Address {
  final String street;
  final int number;
  final String zipCode;
  final City city;
  final Phone phone;
  Address({
    required this.street,
    required this.number,
    required this.zipCode,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> toMap(){
    return {
      "street": street,
      "number": number,
      "zipCode": zipCode,
      "city": city.toMap(),
      "phone": phone.toMap()
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Address.fromMap(Map<String, dynamic> mapa) {
    return Address(
      street: mapa["street"] ?? "",
       number: mapa["number"]?? 0,
        zipCode: mapa["zipCode"] ?? "",
         city: City.fromMap(mapa["city"] ?? <String, dynamic>{}),
          phone: Phone.fromMap(mapa["phone"] ?? <String, dynamic> {}));
  }

  factory Address.fromJson (String json)=> Address.fromMap(jsonDecode(json));
  
}
