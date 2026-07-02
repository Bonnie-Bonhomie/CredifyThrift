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
    print('Hi');
    // if(!controller!.value.isInitialized){
    //   Navigator.pop(context);
    // }
    if (controller == null || !controller!.value.isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios))),
      body: Stack(
        children: [
          CameraPreview(controller!),

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
                Text(
                  "Passport",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  "Front of card",
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 5),
                Text(
                  "Position all 4 corners clearly in the frame.",
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
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
                Icon(Icons.flash_off, color: Colors.grey),
                GestureDetector(
                  onTap: () async {
                    await controller!.takePicture();
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 4),
                      shape: BoxShape.circle,
                      color: AppColors.primary
                    ),
                  ),
                ),
                Icon(Icons.done, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CheckQuality extends StatelessWidget {
  const CheckQuality({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
          const SizedBox(),
          
          Container(),
          
          Text('Chaek Quality'),
          Text('Please make sure your card is clear to read with no blur or glare', textAlign: TextAlign.center,),

          Icon(Icons.lens),
          AppButton(onPressed: (){}, label: 'All clear, continue'),

          TextButton(onPressed: (){Navigator.pushNamed(context, Routes.camera);}, child: Text('Take a new photo')),
        ],
      )),
    );
  }
}

