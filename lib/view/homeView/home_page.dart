import 'package:credify/core/constants/app_color.dart';
import 'package:credify/view/view_export.dart';
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
                      const SizedBox(height: 20),
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
                              padding: const EdgeInsets.all(5),
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
                            '#123.90',
                            style: TextStyle(
                              color: AppColors.onSurface,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
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
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
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
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeadingText(title: 'Upcoming'),
                  Text(
                    'You have an upcoming thrift',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 5.0),
                ],
              ),
            ),
            const Divider(height: 0.1, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeadingText(title: 'This Month'),
                  Text('You have spent £3.90 more than last month', style: Theme.of(context).textTheme.bodySmall,),
                 const SizedBox(height: 30,),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        TransactionLists(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.grey[300],
                            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 18),
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            foregroundColor: Theme.of(context).textTheme.bodyLarge!.color
                          ),
                          child: Text('See all transactions'),
                        ),
                        const SizedBox(height: 10,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
        const SizedBox(height: 2.6),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}

class TransactionLists extends StatelessWidget {
  const TransactionLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        5,
        (index) => Column(
          children: [
            ListTile(
              title: Text(
                'data',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                'textsheh',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              leading: CircleAvatar(),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '-#234.00',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('Nov 23', style: TextStyle(fontWeight: FontWeight.w200)),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).scaffoldBackgroundColor,
              indent: 30,
              endIndent: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String title;

  const HeadingText({super.key, required this.title});

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
