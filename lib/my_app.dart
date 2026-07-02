import 'package:credify/config/AppRoutes/app_routes.dart';
import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/core/Theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
        theme: BAppTheme.light,
        darkTheme: BAppTheme.dark,
        initialRoute: Routes.verifyID,
      onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
    );
  }
}
