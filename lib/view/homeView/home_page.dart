import 'package:credify/export_barrel.dart';
import 'package:credify/view/savings/notifier/saving_notifier.dart';
import 'package:credify/viewModel/app_model.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final AppModel appModel = AppModel();

  List<String> quickLinkText = ['Top up', 'Transfer', 'Activity', 'savings'];

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
                GradientContainer(
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          Icon(Icons.layers, color: Colors.white,),
                          const SizedBox(width: 8,),
                          Text(
                            'Credify.',
                            style: TextStyle(
                              color: AppColors.lightBackground,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 90,
                            child: GradientButton(title: '234', onTap: (){},),
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
                            appModel.formatCurrency(123456),
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
                        children: List.generate(quickLinkText.length, (index) {
                          final title = quickLinkText[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildService(title),
                              index == quickLinkText.length - 1 ?const SizedBox.shrink():  const SizedBox(width: 20,),
                              index == quickLinkText.length - 1 ? SizedBox.shrink(): SizedBox(
                                height: 65,
                                child: VerticalDivider(
                                  endIndent: 20,
                                  color: AppColors.lightBlue.withAlpha(100),
                                ),
                              ),
                            ],
                          );
                        }),
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
                    'Your next investment',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 5.0),

                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 150,
                          height: 100,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(backgroundColor: AppColors.complete,child: Icon(Icons.account_balance_wallet_sharp),),
                                  Text('Title', style: CredTextStyle.h3,),
                                  Text('description', style: CredTextStyle.bs4,),
                                  Text(appModel.formatCurrNoKobo(1345), style: CredTextStyle.h5,)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Consumer<SavingNotifier>(
              builder: (key, s, child) {
                final save = s.savings;
                if(save.isEmpty){
                  return SizedBox.shrink();
                }
                int len = save.length >= 3? 3: save.length;
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HeadingText(title: 'My Savings'),
                      Text(
                        'All available savings',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 5.0),

                      SizedBox(
                        height: 190,
                        child: ListView.builder(
                          itemCount: len,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final saving = save[index];
                            return SavingBox(appModel: appModel, saving: saving);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
            Divider(thickness: 8, color: Colors.grey[300],),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeadingText(title: 'This Month'),
                  Text(
                    'You have spent £3.90 more than last month',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 30),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        TransactionLists(appModel: appModel,),
                        // ElevatedButton(
                        //   onPressed: () {},
                        //   style: ElevatedButton.styleFrom(
                        //     elevation: 0,
                        //     backgroundColor: AppColors.progressColor,
                        //     padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                        //     textStyle: Theme.of(context).textTheme.bodyLarge,
                        //     foregroundColor: AppColors.onSurface
                        //   ),
                        //   child: Text('See all transactions'),
                        // ),
                        SizedBox(
                          width: 200,
                          height: 30,
                          child: GradientButton(title: 'See all transactions', onTap: (){},needIcon: false,),
                        ),
                        const SizedBox(height: 10),
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
          height: 45,
          width: 45,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: const Icon(
            Icons.now_widgets_rounded,
            size: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ],
    );
  }
}

class TransactionLists extends StatelessWidget {
  final AppModel appModel;
  const TransactionLists({super.key, required this.appModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
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
              leading: CircleAvatar(child: Icon(Icons.real_estate_agent)),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '-${appModel.formatCurrency(1234)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('Nov 23', style: TextStyle(fontWeight: FontWeight.w200)),
                ],
              ),
            ),

            Divider(
              color: AppColors.lightBlue.withAlpha(100),
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
