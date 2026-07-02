import 'package:credify/core/constants/app_color.dart';
import 'package:credify/viewModel/loader_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<LoaderModel>().isLoading;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 270,
                  margin: const EdgeInsets.only(bottom: 30),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.gradientBtn],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Credify.',
                            style: TextStyle(
                              color: AppColors.lightBackground,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_down_sharp),
                            iconAlignment: IconAlignment.end,
                            label: Text('*234'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.withAlpha(5),
                              foregroundColor: AppColors.onSurface,
                            ),
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notification_important_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        'Save-to-Spend',
                        style: TextStyle(
                          color: AppColors.onSurface,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '# amount',
                            style: TextStyle(
                              color: AppColors.onSurface,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(width: 30),
                          customIcon(),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Updated 2 min ago',
                        style: TextStyle(
                          color: AppColors.onSurface,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 1, offset: Offset(0, 1))]
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 9,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildService('Top up'),
                          SizedBox(
                            height: 65,
                            child: VerticalDivider(endIndent: 20),
                          ),
                          buildService('Transfer'),
                          SizedBox(
                            height: 65,
                            child: VerticalDivider(endIndent: 20),
                          ),
                          buildService('History'),
                          SizedBox(
                            height: 65,
                            child: VerticalDivider(endIndent: 20),
                          ),
                          buildService('Saving'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeadingText(title: 'Upcoming',),
                  Text('You have an upcoming thrift'),

                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      title: Text('data'),
                      subtitle: Text('textsheh'),
                      leading: CircleAvatar(),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeadingText(title: 'This Month'),
                  Text('You have spent £3.90 more than last month'),
                  Card()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildService(String name) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: const Icon(Icons.atm, size: 20),
        ),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class HeadingText extends StatelessWidget {
  final String title;
  const HeadingText({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

Widget customIcon() {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      const Icon(Icons.circle_outlined, color: AppColors.onSurface),
      Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: const Text(
          '¡',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: AppColors.onSurface,
          ),
        ),
      ),
    ],
  );
}
