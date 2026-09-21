import 'package:credify/export_barrel.dart';




Future<dynamic> createBottomSheet1(
    BuildContext context,
    {required SaveModeModel saving,
     required AppModel appModel, required String route}
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
                Navigator.pushNamed(context, route, arguments: saving);
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
    {required SaveModeModel saving,
     required  AppModel appModel,}
    ) async {
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

