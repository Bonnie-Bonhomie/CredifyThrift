import 'package:credify/export_barrel.dart';
import 'package:credify/view/savings/data/save_model.dart';

import '../../../viewModel/app_model.dart';

class CreateNewSaving extends StatefulWidget {
  final SaveModeModel saveMode;

  const CreateNewSaving({super.key, required this.saveMode});

  @override
  State<CreateNewSaving> createState() => _CreateNewSavingState();
}

class _CreateNewSavingState extends State<CreateNewSaving> {
  int selectIndex = 0;
  final appModel = AppModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        bottomMargin: 0,
        allPadding: 0,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel, color: Colors.white),
                      style: IconButton.styleFrom(
                        padding: const EdgeInsets.all(5),
                        iconSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.account_balance_wallet, size: 70),
                    backgroundColor: AppColors.progressColor,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'save ${appModel.formatCurrNoKobo(widget.saveMode.amount)} by',
                    style: CredTextStyle.bs3.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'November 2026',
                    style: CredTextStyle.h3.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${Frequency.values[selectIndex].value} payment'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_circle_outline,
                              size: 25,
                              color: Colors.grey,
                            ),
                          ),
                          Center(
                            child: Text(
                              appModel.formatCurrNoKobo(
                                widget.saveMode.average,
                              ),
                              style: CredTextStyle.h1,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle_outline_outlined,
                              size: 25,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(Frequency.values.length, (index) {
                        bool selected = index == selectIndex;
                        final title = Frequency.values[index].value;
                        return InkWell(
                          onTap: () {
                            setState(() => selectIndex = index);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            // height: 60,
                            // width: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selected
                                  ? AppColors.progressColor
                                  : AppColors.grey,
                            ),
                            child: Text(
                              title,
                              style: CredTextStyle.bs3.copyWith(
                                color: selected
                                    ? Colors.white
                                    : AppColors.textMain,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    RichText(
                      text: TextSpan(
                        text:
                            'Your ${Frequency.values[selectIndex].value} savings start on ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(text: 'Nov 29', style: CredTextStyle.h5),
                        ],
                      ),
                    ),

                    Column(
                      children: [
                        const Divider(
                          endIndent: 30,
                          indent: 30,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Smart Savings',
                                    style: CredTextStyle.h5,
                                  ),
                                  Text(
                                    'Save when you spend less than your budget',style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Switch(
                                value: false,
                                onChanged: (val) {},
                                hoverColor: AppColors.grey,
                                inactiveThumbColor: AppColors.grey,
                              ),
                            ],
                          ),
                        ),
                        AppButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.hub, size: 120, color: AppColors.progressColor,),
                                        const SizedBox(height: 20,),
                                        Text(
                                          'Congratulations!',
                                          style: CredTextStyle.h4,
                                        ),
                                        const SizedBox(height: 20,),
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text: 'You`ve create your ',
                                            style: Theme.of(context).textTheme.bodyMedium,
                                            children: [
                                              TextSpan(
                                                text: widget.saveMode.title,
                                                style: CredTextStyle.h6,
                                              ),
                                              TextSpan(text: ' Saving goals '),

                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20,),
                                        AppButton(onPressed: (){}, label: 'Got it')
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          label: 'Create your savings',
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
