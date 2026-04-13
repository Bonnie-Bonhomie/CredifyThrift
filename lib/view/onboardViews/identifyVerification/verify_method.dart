import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class VerifyMethod extends StatelessWidget {
  const VerifyMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            child: Icon(Icons.headset_mic),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            idContainer(
              context,
              "Government ID",
              "Take a driver`s license, national Identity card or passport photo",
              '',
              () {
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  backgroundColor: Colors.transparent,
                  requestFocus: true,
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Let`s get you verified!',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 20,),
                          Text(
                            'Which photo ID would you like to use?',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 30,),
                          idTile(
                            context: context,
                            type: 'Driver`s license',
                            onTap: () {
                              Navigator.pushNamed(context, Routes.camera);
                            },
                          ),
                          const Divider(indent: 10, endIndent: 10,),
                          idTile(
                            context: context,
                            type: 'National Identity Card',
                            onTap: () {},
                          ),
                          const Divider(indent: 10, endIndent: 10,),
                          idTile(
                            context: context,
                            type: 'Passport',
                            onTap: () {},
                            recommend: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            idContainer(
              context,
              "Selfie Photo",
              "It`s required by law to verify your identity as new user.",
              '',
              () {},
            ),
            const SizedBox(height: 20),
            DisabledButton(label: 'Verify my identity'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget idTile({
    required BuildContext context,
    required String type,
    required VoidCallback onTap,
    bool recommend = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        titleTextStyle: Theme.of(context).textTheme.bodySmall,
        leading: const Icon(Icons.local_police),
        onTap: (){
          showDialog(context: context, builder: (context) => AlertDialog());
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(type),
            recommend ? Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('Recommended'),
                  ) : SizedBox(),
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right_sharp),
      ),
    );
  }

  Widget idContainer(
    BuildContext context,
    String title,
    String subtitle,
    String imgPath,
    VoidCallback onPressed,
  ) {
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
          TextButton.icon(
            onPressed: onPressed,
            label: Text('Take a photo'),
            icon: Icon(Icons.camera_alt_outlined),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
              iconSize: 25,
              textStyle: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
