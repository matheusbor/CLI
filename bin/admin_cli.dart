import 'dart:async';

import 'package:admin_cli/admin_cli.dart' as admin_cli;
import 'package:args/args.dart';
import 'package:args/command_runner.dart';

void main(List<String> arguments) {
  // //print(arguments);
  // final parser = ArgParser();
  // //print(parser);

  // parser.addFlag("data", abbr: "d");
  // //parser.parse(arguments);
  // parser.addOption("name", abbr:"n");
  // parser.addOption("template", abbr: "t");

  // final resultado = parser.parse(arguments);
  // print(resultado["data"]);
  // print(resultado["name"]);
  // print(resultado['template']);

  CommandRunner("nome executavel", "descricao")
    ..addCommand(ExemploCommand())
    ..run(arguments);


}
class ExemploCommand extends Command{
  @override
  String get description => "classe de comandos de exemplo";

  @override
  String get name => "exemplo";

  ExemploCommand(){
    argParser.addOption("template", abbr: "t", help: "descricao da option");
  }

  @override
  void run() {
    print("Podemos executar algo");
    print(argResults?["template"]);
  }

}
