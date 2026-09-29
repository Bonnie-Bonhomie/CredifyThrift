import 'package:credify/export_barrel.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credify',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: BAppTheme.light,
      darkTheme: BAppTheme.dark,
      initialRoute: Routes.initRoutes,
      onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
    );
  }
}
