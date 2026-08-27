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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 330,
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

                      const SizedBox(height: 30,),
                      const Text(
                        'Total Amount Saved',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(appModel.formatCurrency(12756), style: CredTextStyle.h2.copyWith(color: AppColors.onSurface),),
                      const SizedBox(height: 10),
                      Text('Last edited 2 days ago',
                          style: CredTextStyle.bs3.copyWith(
                              color: AppColors.textSecondary)),

                      const SizedBox(height: 10,),
                      SizedBox(
                          width: 200,
                          child: GradientButton()),
                    ],
                  ),
                ),
                Positioned(
                  top: 250,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(8, (index) {
                        return Card(
                            child: SizedBox(
                              height: 170,
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Buy a new house in New york', style: CredTextStyle.h5,),
                                              Text('${appModel.formatCurrNoKobo(
                                                  2500)}/m * 9 month left'),
                                            ],
                                          ),
                                          IconButton(onPressed: () {},
                                              icon: Icon(Icons
                                                  .keyboard_arrow_right_outlined))

                                        ],
                                      ),
                                      const SizedBox(height: 15,),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Amount paid', style: CredTextStyle.bs3,),
                                              Text.rich(TextSpan(
                                                  text: appModel.formatCurrNoKobo(245),
                                                  style: CredTextStyle.h2,
                                                  children: [
                                                    TextSpan(text: ' out of ${appModel
                                                        .formatCurrNoKobo(500)}',
                                                        style: CredTextStyle.bs3.copyWith(fontWeight: FontWeight.w400))
                                                  ])),

                                            ],
                                          ),
                                          const Spacer(),
                                          Text('35%'),
                                        ],
                                      ),
                                          TweenAnimationBuilder<double>(
                                            tween: Tween(begin: 0, end: 0.7),
                                            duration: const Duration(
                                                seconds: 4),
                                            builder: (context, value, child) {
                                              return GradientProgressBar(
                                                  progress: value);
                                            },),
                                    ]
                                ),
                              ),
                            )
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 800,)
          ],
        ),
      ),
    );
  }
}
