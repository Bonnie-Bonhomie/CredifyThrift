import 'package:credify/view/savings/notifier/saving_notifier.dart';
import 'package:credify/viewModel/app_model.dart';

import '../../../core/utils/gradient_linear_bar.dart';
import '../../../export_barrel.dart';

class SavingPage extends StatefulWidget {
  const SavingPage({super.key});

  @override
  State<SavingPage> createState() => _SavingPageState();
}

class _SavingPageState extends State<SavingPage> {
  final AppModel appModel = AppModel();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SavingNotifier>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                GradientContainer(
                  height: 320,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.layers, color: Colors.white),
                          Text(
                            'Savings Goals',
                            style: TextStyle(
                              color: AppColors.lightBackground,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),

                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_horiz, color: Colors.white),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      const Text(
                        'Total Amount Saved',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        appModel.formatCurrency(12756),
                        style: CredTextStyle.h2.copyWith(
                          color: AppColors.onSurface,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Last edited 2 days ago',
                        style: CredTextStyle.bs3.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 10),
                      SizedBox(width: 200,
                          // height: 30,
                          child: GradientButton(
                            onTap: (){
                              Navigator.pushNamed(context, Routes.availableSaving);
                            },
                            title: 'create a new goal', iconSize: 20,)),
                      // const SizedBox(height: 10,)
                    ],
                  ),
                ),
                Positioned(
                  top: 240,
                  child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 9,
                      ),
                      // margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Consumer<SavingNotifier>(
                          builder: (key, saving, child) {
                            List save = saving.savings;
                            if(save.isEmpty){
                              return Card(child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.not_interested_rounded, size: 80, color: AppColors.error,),
                                    const SizedBox(height: 15,),
                                    Text('No Savings '),
                                    const SizedBox(height:  5,),
                                    Text('Click the create button to start'),
                                  ],
                                ),
                              ),);
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: List.generate(save.length, (index) {
                                final s = save[index];
                                return SavingCard(appModel: appModel, saving: s,);
                              }),
                            );
                          })
                  ),
                ),
              ],
            ),
            const SizedBox(height: 850),
          ],
        ),
      ),
    );
  }
}
