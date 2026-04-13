import 'package:credify/viewModel/auth_view_model/create_pwd_v_model.dart';
import 'package:credify/viewModel/auth_view_model/details_view_model.dart';
import 'package:credify/viewModel/auth_view_model/sign_in_v_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AuthDependencies{

  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => SignUpViewM()),
    ChangeNotifierProvider(create: (_) => CreatePwdVModel()),
    ChangeNotifierProvider(create: (_) => DetailsViewModel()),
  ];

}