import 'package:credify/config/AppRoutes/page_slider.dart';
import 'package:credify/config/AppRoutes/routes.dart';
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
        return slidePage(SignUpView());
      case Routes.home:
        return slidePage(HomePageView());
      // case Routes.verify:
      //   return slidePage(VerifyAccView());
      case Routes.createPwd:
        return slidePage(CreatePasswordView());
      case Routes.personalInfo:
        return slidePage(PersonalInfoView());
      case Routes.address:
        return slidePage(AddressDetailsView());
      case Routes.verifyID:
        return slidePage(VerifyMethod());
      case Routes.camera:
        return slidePage(CameraPage());

      case Routes.mainS:
        return slidePage(MainScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
