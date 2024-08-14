import 'package:admin_cli/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class FindByIdCommand extends Command{

  final StudentRepository studentRepository;

  @override
  String get description => "Find Student By Id";

  @override
  String get name => "findById";

FindByIdCommand(this.studentRepository){
  argParser.addOption("id", help: "Student Id", abbr: "i");
}

  @override
  void run() async{
    
    if(argResults?["id"] == null){//ordem errada
      print("Por favor envie o id com --id='number' ou -i 'number'");
      return;
    }
   

    final id = int.tryParse(argResults?["id"]);
     print("Id digitado para busca: $id");

     final responseStudent = await studentRepository.findById(id!);
    print("");
     print("Aluno: ${responseStudent.name}");
     print("Id: ${responseStudent.id}");
     print("Idade: ${responseStudent.age ?? "Não informado"}");
     print("Endereço: ${responseStudent.address}");
     print("Cursos: ${responseStudent.nameCourses}");
     print("");
  

  }

}