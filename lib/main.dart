import 'package:camera/camera.dart';
import 'package:credify/core/utils/Helpers/dismiss_key_board.dart';
import 'package:credify/dependencies/dependencie_injection.dart';
import 'package:credify/my_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late List<CameraDescription> cameraRoles;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameraRoles = await availableCameras();

  runApp(
    MultiProvider(
      providers: AppDependencies.providers,
      child: DismissKeyboard(child: const MyApp()),
    ),
  );
}
