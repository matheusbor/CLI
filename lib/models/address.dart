// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_cli/models/city.dart';
import 'package:admin_cli/models/phone.dart';

class Address {
  String street;
  int number;
  String zipCode;
  City city;
  Phone phone;
  Address({
    required this.street,
    required this.number,
    required this.zipCode,
    required this.city,
    required this.phone,
  });
  
}
