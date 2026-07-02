import 'dart:io';

import 'package:camera/camera.dart';
import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/widgets/app_button.dart';
import 'package:credify/main.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> initCamera() async {
    print('Hello');
    controller = CameraController(cameraRoles.first, ResolutionPreset.high);
    await controller!.initialize();
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.request();

    if (status.isGranted) {
      // Initialize camera here
      initCamera();
    } else if (status.isDenied) {
      // User denied permission
      if (mounted) {
        Navigator.pop(context);
      }
    } else if (status.isPermanentlyDenied) {
      if (mounted) {
        Navigator.pop(context);

        Future.delayed(const Duration(milliseconds: 300), () {
          openAppSettings();
        });
      }
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Starting camera');
    // if(!controller!.value.isInitialized){
    //   Navigator.pop(context);
    // }
    if (controller == null || !controller!.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: [
          Center(child: CameraPreview(controller!)),

          /// Overlay
          Center(
            child: Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.cyan, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          /// Top Text
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Text("Passport", style: TextStyle(fontSize: 18)),
                SizedBox(height: 6.0),
                Text("Front of card"),
                SizedBox(height: 5),
                Text(
                  "Position all 4 corners clearly in the frame.",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),

          /// Bottom Controls
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.flash_off, color: Colors.grey),
                GestureDetector(
                  onTap: () async {
                    final path = await controller!.takePicture();
                    Navigator.pop(context, path);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckQuality(path: path),
                      ),
                    );
                    // print('Take picture ${path.path}');
                  },
                  child: const Icon(Icons.radio_button_checked, size: 80,)
                ),
                const Icon(Icons.done, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckQuality extends StatelessWidget {
  final XFile path;

  const CheckQuality({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    final File imageFile = File(path.path);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              const SizedBox(),

              Center(
                child: Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.blueGrey),
                    image: DecorationImage(image: FileImage(imageFile), fit: BoxFit.cover, onError: (_, __){Icon(Icons.photo, size: 50,);}),

                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.gradientBtn],
                    begin: Alignment.topLeft,end: Alignment.bottomRight
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.lens),
              ),
              const Text('Check Quality', textAlign: TextAlign.center),
              SizedBox(
                width: 250,
                child: const Text(
                  'Please make sure your card details or passport is clear to read with no blur or glare',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
              ),
              const SizedBox(height: 20),
              AppButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: 'All clear, continue',
              ),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.camera);
                },
                child: const Text('Take a new photo'),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
