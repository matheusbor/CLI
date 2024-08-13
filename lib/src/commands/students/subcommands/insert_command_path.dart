import 'dart:async';
import 'dart:io';

import 'package:admin_cli/repositories/product_repository.dart';
import 'package:admin_cli/repositories/student_repository.dart';
import 'package:admin_cli/src/models/address.dart';
import 'package:admin_cli/src/models/city.dart';
import 'package:admin_cli/src/models/phone.dart';
import 'package:admin_cli/src/models/student.dart';
import 'package:args/command_runner.dart';

class InsertCommandPath extends Command{
  final StudentRepository studentRepository;
  final ProductRepository productRepository;

  @override
  String get description => "Insert Student By Path";

  @override
  String get name => "insertByPath";

  InsertCommandPath(this.studentRepository)
  : productRepository = ProductRepository(){
    argParser.addOption('file', help: "File if the csv file", abbr: 'f');
  }

  @override
  void run() async{
    print("aguarde...");

    final filePath = argResults?["file"];
    final students = File(filePath).readAsLinesSync();//ler todas as linhas
    print("");

    for(var student in students){
      final studentData = student.split(";");
      final coursesCsv = studentData[2].split(",").map((toElement) => toElement.trim()).toList();
      //studentData[2] = courses;

      final coursesFuture = coursesCsv.map((c) async{ 
        final course = await productRepository.findByName(c);
        course.isStudent = true;
        return course;
      }).toList();

      final courses = await Future.wait(coursesFuture);//Future for each era mais facil

      final StudentModel = Student(
        name: studentData[0],
         age: int.tryParse(studentData[1] ?? "Não informado"),
          nameCourses: coursesCsv,
           courses: courses,
            address: Address(
              street: studentData[3],
               number: int.parse(studentData[4] ),
                zipCode: studentData[5],
                 city: City(
                  id: 1,  
                   name: studentData[6]),
                  phone: Phone(
                    ddd: int.parse(studentData[7]),
                     phone: studentData[8])));

      await studentRepository.insert(StudentModel);
      
    }

    print("");
      print("alunos adicionados");

  }

}

