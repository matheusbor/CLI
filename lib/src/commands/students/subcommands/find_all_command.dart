import 'dart:async';
import 'dart:io';

import 'package:admin_cli/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class FindAllCommand extends Command {  

  final StudentRepository repository;

  @override
  String get description => "FindAllStudents";

  @override
  String get name => 'findAll';

  FindAllCommand(this.repository);

  @override
  void run() async{
    print("aguarde buscando...");

    final students = await repository.findAll();

    print("Deseja os cursos também? (S/N)");

    final choice = stdin.readLineSync();
    print("");

    if(choice?.toLowerCase() == 's'){
      for(var student in students){
        print("Aluno: ${student.name}");
        print("Id: ${student.id}");
        print("Idade: ${student.age ?? "Não Informado"}");
        print("Endereço: ${student.address}");
        print("Cursos: ${student.nameCourses}");
        print("");
      }
    } else{
      for(var student in students){
        print("Aluno: ${student.name}");
        print("Id: ${student.id}");
        print("Idade: ${student.age ?? "Não Informado"}");
        print("Endereço: ${student.address}");
        print("");

      }
    }


  }
}
