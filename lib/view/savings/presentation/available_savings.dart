import 'package:credify/export_barrel.dart';
import 'package:credify/view/savings/notifier/saving_notifier.dart';
import 'package:credify/viewModel/app_model.dart';

import '../data/save_model.dart';

class AvailableSavings extends StatelessWidget {
  AvailableSavings({super.key});

  final AppModel appModel = AppModel();
  final sd = SaveModeModel(
    title: 'Other Expenses',
    frequency: Frequency.weekly,
    amount: 2000,
    duration: 7,
  );

  @override
  Widget build(BuildContext context) {
    final savings = context.watch<SavingNotifier>();
    return Scaffold(
      body: GradientContainer(
        bottomMargin: 0,
        allPadding: 0,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    'Create Savings',
                    style: CredTextStyle.h3.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 7,),
                  Text(
                    'Select a saving category below to start you savings for it.',
                    style: CredTextStyle.bs3.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CUSTOM SAVING'),
                    methodSave(sd, (){}),
                    const SizedBox(height: 15,),
                    Text('BASIC SAVING'),
                    Expanded(
                      child: ListView.builder(
                        itemCount: savings.saveMode.length,
                        itemBuilder: (context, index) {
                          final availableSave = savings.saveMode;
                          if (availableSave.isEmpty) {
                            return Column(children: [Text('data')]);
                          }
                          final s = availableSave[index];
                          return methodSave(s, (){createBottomSheet1(context, s);});
                        },
                      ),
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

  Widget methodSave(SaveModeModel s, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(child: Icon(Icons.account_balance_wallet_sharp)),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.title, style: CredTextStyle.h4),
                Text('${appModel.formatCurrency(s.average)} ${s.frequency.value} average'),
              ],
            ),
            const Spacer(),
            CustomArrowBtn(onTap: () {}),
          ],
        ),
      ),
    );
  }

  Future<dynamic> createBottomSheet1(
    BuildContext context,
    SaveModeModel saving,
  ) {
    return showModalBottomSheet(
      context: context,
      scrollControlDisabledMaxHeightRatio: 0.8,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomArrowBtn(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.home_work, size: 80),
                ),
              ),
              Text('Savings'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(saving.title, style: CredTextStyle.h5),
                  Icon(Icons.edit),
                ],
              ),
              // SizedBox(
              //   width: 200,
              //   child: TextFormField(
              //     controller: TextEditingController(text: saving.title),
              //     style: TextStyle(fontWeight: FontWeight(1000)),
              //     decoration: InputDecoration(hintText: 'Saving title', suffixIcon: Icon(Icons.edit)),
              //   ),
              // ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'How much do you want to save',
                  style: CredTextStyle.h2.copyWith(fontSize: 20),
                ),
              ),
              const Spacer(),
              Text('TARGET AMOUNT', style: CredTextStyle.h6),
              Padding(
                padding: const EdgeInsets.all(20),
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
                        appModel.formatCurrNoKobo(saving.amount),
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
              const Spacer(),
              AppButton(
                onPressed: () {
                  Navigator.pop(context);
                  createBottomSheet2(context, saving);
                },
                label: 'Continue',
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> createBottomSheet2(
    BuildContext context,
    SaveModeModel saving,
  ) {
    return showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.9,
      backgroundColor: Colors.transparent,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomArrowBtn(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Text('TARGET AMOUNT', style: CredTextStyle.h6),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: TextFormField(
                    controller: TextEditingController(
                      text: appModel.formatCurrNoKobo(saving.amount),
                    ),
                    autofocus: true,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              AppButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routes.createSaving, arguments: saving);
                },
                label: 'Set amount ',
              ),
            ],
          ),
        );
      },
    );
  }
}
