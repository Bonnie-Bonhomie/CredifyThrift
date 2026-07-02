import 'package:camera/camera.dart';
import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class VerifyMethod extends StatefulWidget {
  const VerifyMethod({super.key});

  @override
  State<VerifyMethod> createState() => _VerifyMethodState();
}

class _VerifyMethodState extends State<VerifyMethod> {
  String imgPath = '';
  String photoPath = '';
  int selectIndex = 0;
  bool submitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Identity'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.keyboard_arrow_left),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              shape: BoxShape.circle,
            ),
            child: const  Icon(Icons.headset_mic),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IdContainer(
              context,
              title: "Government ID",
              subtitle:
                  "Take a driver`s license, national Identity card or passport photo",
              imgPath: imgPath,
              onPressed: () {
                showIDSheet(context);
              },
            ),
            const SizedBox(height: 20),
            IdContainer(
              context,
              title: "Selfie Photo",
              subtitle:
                  "It`s required by law to verify your identity as new user.",
              imgPath: photoPath,
              onPressed: () async {
                final response = await Navigator.pushNamed(
                  context,
                  Routes.camera,
                );
                XFile file = response as XFile;
                print(response);
                setState(() {
                  photoPath = file.path;
                });
                print(photoPath);
              },
            ),
            const SizedBox(height: 30),
            imgPath.isEmpty && photoPath.isEmpty
                ? DisabledButton(label: 'Verify my identity')
                : submitting
                ? DisabledButton(label: 'Submitting...')
                : AppButton(
                    onPressed: () {
                      setState(() => submitting = true);
                      showContinueDialog();
                    },
                    label: 'Verify my Identity',
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget idTile({
    required BuildContext context,
    required String type,
    bool recommend = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        titleTextStyle: Theme.of(context).textTheme.bodySmall,
        leading: const Icon(Icons.local_police),
        onTap: () async {
          Navigator.pop(context);
          final response = await Navigator.pushNamed(context, Routes.camera);
          XFile file = response as XFile;
          // print(response);
          setState(() {
            imgPath = file.path;
          });
          print(imgPath);
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(type),
            recommend
                ? Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('Recommended'),
                  )
                : SizedBox(),
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right_sharp),
      ),
    );
  }

  Widget IdContainer(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String imgPath,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 250,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.hearing_sharp, size: 50),
          SizedBox(height: 15),
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          imgPath.isEmpty
              ? TextButton.icon(
                  onPressed: onPressed,
                  label: Text('Take a photo'),
                  icon: Icon(Icons.camera_alt_outlined),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    iconSize: 25,
                    textStyle: TextStyle(fontSize: 20),
                  ),
                )
              : Text('pending', style: TextStyle(color: AppColors.pending)),
        ],
      ),
    );
  }

  showIDSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.transparent,
      requestFocus: true,
      builder: (context) => Container(
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let`s get you verified!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              Text(
                'Which photo ID would you like to use?',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 30),
              idTile(context: context, type: 'Driver`s license'),
              const Divider(indent: 10, endIndent: 10),
              idTile(context: context, type: 'National Identity Card'),
              const Divider(indent: 10, endIndent: 10),
              idTile(context: context, type: 'Passport', recommend: true),
            ],
          ),
        ),
      ),
    );
  }

  showContinueDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            height: 400,
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey,
                  ),
                ),
                const Text(
                  'Thanks! We will review your document within 10 minutes',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  'get ready to start using credify for your daily financial app',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),

                SizedBox(
                  width: 150,
                  child: AppButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.home);
                    },
                    label: 'Got it',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
