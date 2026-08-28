import 'package:credify/config/AppRoutes/page_slider.dart';
import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/view/onboardViews/splash_screen.dart';
import 'package:credify/view/savings/data/save_model.dart';
import 'package:credify/view/savings/presentation/available_savings.dart';
import 'package:credify/view/savings/presentation/create_new_saving.dart';
import 'package:credify/view/view_export.dart';
import 'package:flutter/material.dart';

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
