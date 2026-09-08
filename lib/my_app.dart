
import 'package:credify/export_barrel.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
        theme: BAppTheme.light,
        darkTheme: BAppTheme.dark,
        initialRoute: Routes.signUp,
      onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
    );
  }
}
