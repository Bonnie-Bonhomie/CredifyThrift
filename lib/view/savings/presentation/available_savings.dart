import 'package:credify/export_barrel.dart';
import 'package:credify/view/savings/notifier/saving_notifier.dart';
import 'package:credify/viewModel/app_model.dart';


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
                    style: CredTextStyle.h2.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 7,),
                  Text(
                    'Select a saving category below to start your savings for it.',
                    style: CredTextStyle.bs5.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 10),
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
                    Text('Custom Saving'),
                    methodSave(sd, (){}),
                    const SizedBox(height: 15,),
                    Text('Basic Saving'),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(5),
                        itemCount: savings.saveMode.length,
                        itemBuilder: (context, index) {
                          final availableSave = savings.saveMode;
                          if (availableSave.isEmpty) {
                            return Column(children: [Text('data')]);
                          }
                          final s = availableSave[index];
                          return methodSave(s, (){createBottomSheet1(context, saving: s, route: Routes.createSaving, appModel: appModel);});
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


}
