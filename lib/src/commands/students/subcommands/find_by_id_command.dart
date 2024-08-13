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
  void run(){
    print("rodando findById");
  }

}