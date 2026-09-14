import 'package:credify/export_barrel.dart';
import 'package:credify/view/authentication/data/user_model.dart';

class VerifyDetailsView extends StatelessWidget {
  VerifyDetailsView({super.key, required this.userDetails});

  final UserModel userDetails;

  final TextEditingController addressCtrl = TextEditingController();
  final fullNameCtrl = TextEditingController();
  final apartment = TextEditingController();
  final zipCodeCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final stateCtrl = TextEditingController();

  final addressKey = GlobalKey<FormFieldState>();
  final streetKey = GlobalKey<FormFieldState>();
  final aptKey = GlobalKey<FormFieldState>();
  final zipKey = GlobalKey<FormFieldState>();
  final cityKey = GlobalKey<FormFieldState>();
  final stateKey = GlobalKey<FormFieldState>();

  final formKey = GlobalKey<FormState>();

  // void logi

  @override
  Widget build(BuildContext context) {
    final watchDet = context.watch<DetailsViewModel>();
    final readDet = context.read<DetailsViewModel>();
    final loading = context.watch<LoaderModel>().isLoading;
    return LoaderWrapper(
      loading: loading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardTheme.color,
              ),
              child: Text('step 3 of 3'),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSize.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Almost There!',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Please take a moment to ensure all of the information you provide is correct',
                    ),
                    const SizedBox(height: 20),

                    profileBox(
                      context,
                      title: 'Full Legal Name',
                      value: userDetails.fullName,
                    ),
                    profileBox(
                      context,
                      title: 'Full Legal Name',
                      value: userDetails.fullName,
                    ),
                    profileBox(
                      context,
                      title: 'Full Legal Name',
                      value: userDetails.fullName,
                    ),
                    profileBox(
                      context,
                      title: 'Full Legal Name',
                      value: userDetails.fullName,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child:
                  // watchDet.addressFill?
                  AppButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.verifyID);
                    },
                    label: 'Continue',
                  ),
            ),
            // : DisabledButton(label: 'Continue'),)
          ],
        ),
      ),
    );
  }

  Widget profileBox(
    BuildContext context, {
    required String title,
    required String value,
  }) {
    return Container(
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              Text(value, style: TextStyle(fontWeight: FontWeight(800))),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor,
                ),
                child: Text('Edit'),
              ),
            ],
          ),
          Divider(indent: 30, endIndent: 30,)
        ],
      ),
    );
  }
}
