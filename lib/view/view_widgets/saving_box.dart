
import 'package:credify/export_barrel.dart';

import '../../core/utils/gradient_linear_bar.dart';
import '../../viewModel/app_model.dart';

class SavingBox extends StatelessWidget {
  const SavingBox({
    super.key,
    required this.appModel,
  });

  final AppModel appModel;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(child: Icon(Icons.foggy),),
                  Text('Title of Saving', style: CredTextStyle.h5,),
                  Text('Paid', style: CredTextStyle.bs4,),
                  Text.rich(TextSpan(text: appModel.formatCurrNoKobo(245), style: CredTextStyle.h4, children: [
                    TextSpan(text: ' out of ${appModel.formatCurrNoKobo(500)}', style: CredTextStyle.bs4)
                  ])),

                  SizedBox(
                    width: 150,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 0.7),
                      duration: const Duration(seconds: 4),
                      builder: (context, value, child) {
                        return GradientProgressBar(progress: value);
                      },),
                  ),
                ]
            ),
          ),
        )
    );
  }
}
