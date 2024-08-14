import 'dart:io';

import 'package:admin_cli/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class DeleteCommand extends Command{
  final StudentRepository studentRepository;

  @override
  String get description => "Delete Student By Id";

  @override
  String get name => "delete";

  DeleteCommand(this.studentRepository){
    argParser.addOption("id", help: "Student Id", abbr: "i");
  }

  @override  
  void run() async{
    
   
    final id = int.tryParse(argResults?["id"]);

    if(id == null){
      print("Por favor envie o id com --id='number' ou -i 'number'");
      return;
    }
    final studentSearch = await studentRepository.findById(id);
     print("Deseja deletar o aluno ${studentSearch.name} com o id: $id ?");

     final choice = stdin.readLineSync();
     if(choice?.toLowerCase() == "s"){
      await studentRepository.delete(id);
     }

     print("");
     print("aluno deletado");
  }

}