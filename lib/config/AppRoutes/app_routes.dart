import 'package:credify/export_barrel.dart';
import 'package:credify/view/authentication/presentation/auth_views/login_screen.dart';
import 'package:credify/view/onboarding/onboard_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> appRoutes = {
    Routes.initRoutes: (context) => const SplashScreen(),
    Routes.onboard: (context) => const OnboardScreen(),
    Routes.signUp: (context) => const SignUpView(),
    Routes.home: (context) => const HomePageView(),
  };

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initRoutes:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onboard:
        return slidePage(const OnboardScreen());

      case Routes.signUp:
        return slidePage(const SignUpView());

      case Routes.login:
        return slidePage( LoginScreen());

      case Routes.home:
        return slidePage(const HomePageView());

      case Routes.createPwd:
        return slidePage(CreatePasswordView());

      case Routes.personalInfo:
        return slidePage(const PersonalInfoView());

      case Routes.address:
        return slidePage(AddressDetailsView());

      case Routes.verifyDet:
        return slidePage(VerifyDetailsView());

      case Routes.verifyID:
        return slidePage(const VerifyMethod());

      case Routes.camera:
        return slidePage(const CameraPage());

      case Routes.dashboard:
        return slidePage(const MainScreen());

      case Routes.availableSaving:
        return slidePage(AvailableSavings());

      case Routes.createSaving:
        final saveMode = settings.arguments as SaveModeModel;
        return slidePage(CreateNewSaving(saveMode: saveMode));


      case Routes.availableInvest:
        return slidePage(AvailableInvest());


      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
