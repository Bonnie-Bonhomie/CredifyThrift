
import 'package:credify/export_barrel.dart';
import 'package:credify/view/authentication/data/user_model.dart';
import 'package:credify/view/authentication/personal_details/verify_details.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> appRoutes = {
    Routes.signUp: (context) => SignUpView(),
    Routes.home: (context) => HomePageView(),
  };

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signUp:
        return slidePage(const SignUpView());
      case Routes.home:
        return slidePage(const HomePageView());
      // case Routes.verify:
      //   return slidePage(VerifyAccView());
      case Routes.createPwd:
        return slidePage(CreatePasswordView());
      case Routes.personalInfo:
        return slidePage(const PersonalInfoView());
      case Routes.address:
        return slidePage(AddressDetailsView());

      case Routes.verifyDet:
        final userDetails = settings.arguments as UserModel;
        return slidePage(VerifyDetailsView(userDetails: userDetails));

      case Routes.verifyID:
        return slidePage(const VerifyMethod());
      case Routes.camera:
        return slidePage(CameraPage());

      case Routes.mainS:
        return slidePage(const MainScreen());

      case Routes.availableSaving:
        return slidePage(AvailableSavings());

      case Routes.createSaving:
        final saveMode = settings.arguments as SaveModeModel;
        return slidePage(CreateNewSaving(saveMode: saveMode,));

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
