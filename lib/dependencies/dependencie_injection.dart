import 'package:credify/dependencies/auth_dependency.dart';
import 'package:credify/dependencies/core_dependencies.dart';
import 'package:provider/single_child_widget.dart';

class AppDependencies{

  static final List<SingleChildWidget> providers = [
    ...CoreDependencies.providers,
    ...AuthDependencies.providers,
  ];
}


  final List<SingleChildWidget> provider =[

];