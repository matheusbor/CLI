import 'dart:async';
import 'dart:io';

import 'package:admin_cli/repositories/product_repository.dart';
import 'package:admin_cli/repositories/student_repository.dart';
import 'package:admin_cli/src/models/address.dart';
import 'package:admin_cli/src/models/city.dart';
import 'package:admin_cli/src/models/phone.dart';
import 'package:admin_cli/src/models/student.dart';
import 'package:args/command_runner.dart';

  class UpdateCommandPath extends Command{
    final StudentRepository studentRepository;
  final ProductRepository productRepository;

  @override
  String get description => "Update Student By Path";

  @override
  String get name => "updateByPath";

  UpdateCommandPath(this.studentRepository): productRepository = ProductRepository(){

    argParser.addOption('file', help: "File if the csv file", abbr: 'f');
    argParser.addOption("id", help: "Id of the student to be updated", abbr: "i");
  }

  @override
  void run() async{
    print("aguarde...");

    final filePath = argResults?["file"];
    final id = argResults?["id"];
    
    
    if(id == null){
      print("Por favor envie o id com --id='number' ou -i 'number'");
      return;
    }
    final students = File(filePath).readAsLinesSync();//ler todas as linhas

    if(students.length > 1){
      print("Por favor informe apenas um aluno no arquivo $filePath");
      return;
    } else if(students.isEmpty){
      print("Por favor informe um aluno para atualizar $filePath");
      return;
    }
    print("");

    var student = students.first;
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
        id: int.parse(id),
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

      await studentRepository.update(StudentModel);
      
    

    print("");
    print("aluno atualizado");
  }

  
  }