import 'package:credify/viewModel/loader_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CoreDependencies{
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => LoaderModel()),
  ];

}