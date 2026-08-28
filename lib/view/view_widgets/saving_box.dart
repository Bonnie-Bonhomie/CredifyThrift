
import 'package:credify/export_barrel.dart';
import 'package:credify/view/savings/data/save_model.dart';

import '../../core/utils/gradient_linear_bar.dart';
import '../../viewModel/app_model.dart';

class SavingBox extends StatelessWidget {
  const SavingBox({
    super.key,
    required this.appModel,
    required this.saving,
  });

  final AppModel appModel;
  final SaveModel saving ;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
          // height: 200,
          // width: 100,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: AppColors.progressColor, width: 0.9)),
                      child: Row(
                        children: [
                          CircleAvatar(radius: 17,child: Icon(Icons.safety_check_rounded),),
                          const SizedBox(width: 8.0,),
                          Text(saving.frequency.value, style: CredTextStyle.h5,),
                          const SizedBox(width: 8.0,),
                        ],
                      )),
                  const SizedBox(height: 8.0,),
                  Text(saving.title, style: CredTextStyle.h6,),
                  const SizedBox(height: 15,),
                  Text('Paid', style: CredTextStyle.bs4,),
                  const SizedBox(height: 5,),
                  Text.rich(TextSpan(text: appModel.formatCurrNoKobo(saving.paidAmount), style: CredTextStyle.h4, children: [
                    TextSpan(text: ' out of ${appModel.formatCurrNoKobo(saving.amount)}', style: CredTextStyle.bs4)
                  ])),
const SizedBox(height: 8,),
                  SizedBox(
                    width: 160,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: saving.percent),
                      duration: const Duration(seconds: 4),
                      builder: (context, value, child) {
                        return GradientProgressBar(progress: saving.percent, color: appModel.getPercent(saving.percent * 100),);
                      },),
                  ),
                ]
            ),
          ),
        )
    );
  }
}


class SavingCard extends StatelessWidget {
  const SavingCard({
    super.key,
    required this.appModel,
    required this.saving,
  });

  final AppModel appModel;
  final SaveModel saving;

  @override
  Widget build(BuildContext context) {
    final  freq = saving.frequency;
    return Card(
      child: SizedBox(
        // height: 170,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        saving.title,
                        style: CredTextStyle.h5,
                      ),
                      Text(
                        '${appModel.formatCurrNoKobo(2500)}/${freq.abbrev} * ${saving.duration} ${freq.name} left',
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right_outlined,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Amount paid',
                          style: CredTextStyle.bs3,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: appModel.formatCurrNoKobo(
                            saving.paidAmount,
                          ),
                          style: CredTextStyle.h2,
                          children: [
                            TextSpan(
                              text:
                              ' out of ${appModel.formatCurrNoKobo(saving.amount)}',
                              style: CredTextStyle.bs3
                                  .copyWith(
                                fontWeight:
                                FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text('${saving.percent * 100}%'),
                ],
              ),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: saving.percent),
                duration: const Duration(seconds: 4),
                builder: (context, value, child) {
                  return GradientProgressBar(
                    progress: value,
                    color: appModel.getPercent(saving.percent * 100),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

