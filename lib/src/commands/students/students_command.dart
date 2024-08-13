import 'package:admin_cli/repositories/student_repository.dart';
import 'package:admin_cli/src/commands/students/subcommands/find_all_command.dart';
import 'package:admin_cli/src/commands/students/subcommands/find_by_id_command.dart';
import 'package:admin_cli/src/commands/students/subcommands/insert_command_path.dart';
import 'package:args/command_runner.dart';

class StudentsCommand extends Command{
  @override
  
  String get description => "Students operation";

  @override
  String get name => 'students';


  StudentsCommand(){
    final studentRepository = StudentRepository();
    addSubcommand(FindAllCommand(studentRepository));
    addSubcommand(FindByIdCommand(studentRepository));
    addSubcommand(InsertCommandPath(studentRepository));
  }
}