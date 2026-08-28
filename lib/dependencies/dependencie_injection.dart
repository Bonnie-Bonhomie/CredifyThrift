import 'package:credify/dependencies/auth_dependency.dart';
import 'package:credify/dependencies/core_dependencies.dart';
import 'package:credify/export_barrel.dart';
import 'package:credify/view/savings/notifier/saving_notifier.dart';
import 'package:provider/single_child_widget.dart';

class AppDependencies{

  static final List<SingleChildWidget> providers = [
    ...CoreDependencies.providers,
    ...AuthDependencies.providers,
    ...provider,
  ];
}


  final List<SingleChildWidget> provider =[
      ChangeNotifierProvider<SavingNotifier>(create: (context) => SavingNotifier()),
];