
import 'package:credify/export_barrel.dart';


class AddressDetailsView extends StatelessWidget {
  AddressDetailsView({super.key});

  final TextEditingController addressCtrl = TextEditingController();
  final streetCtrl = TextEditingController();
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
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_left)),
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardTheme.color,
              ),
              child: Text('step 2 of 3'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSize.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home Address', style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height: 10,),
              Text('Let us know where we should send your Mastercard Debit Card'),
              const SizedBox(height: 20,),
              ReuseContainer(
                child:
                FormWidget(
                  label: 'Street Address',
                  fieldKey: streetKey,
                  validator: (val) => Validator.validateText(val, 'street Address'),
                  valController: streetCtrl,
                  onChanged: (val) {
                    streetKey.currentState!.validate();
                    readDet.firstFill(val);
                  },
                ),
              ),
              ReuseContainer(
                child:
                FormWidget(
                  label: 'Apartment/ Suite number',
                  fieldKey: aptKey,
                  validator: (value) =>
                      Validator.validateText(value, 'Apartment'),
                  valController: apartment,
                  onChanged: (val) {
                    aptKey.currentState!.validate();
                    readDet.lastNFill(val);
                  },
                ),
              ), ReuseContainer(
                child:
                FormWidget(
                  label: 'City',
                  fieldKey: cityKey,
                  validator: (value) =>
                      Validator.validateText(value, 'city'),
                  valController: cityCtrl,
                  onChanged: (val) {
                    cityKey.currentState!.validate();
                    readDet.lastNFill(val);
                  },
                ),
              ), ReuseContainer(
                child:
                FormWidget(
                  label: 'State',
                  fieldKey: stateKey,
                  validator: (value) =>
                      Validator.validateText(value, 'State'),
                  valController: stateCtrl,
                  onChanged: (val) {
                    stateKey.currentState!.validate();
                    readDet.lastNFill(val);
                  },
                ),
              ),
              ReuseContainer(
                child:
                FormWidget(
                  label: 'Zip Code',
                  fieldKey: zipKey,
                  validator: (value) =>
                      Validator.validateText(value, 'zip code'),
                  valController: zipCodeCtrl,
                  onChanged: (val) {
                    zipKey.currentState!.validate();
                    readDet.lastNFill(val);
                  },
                ),
              ),
              const SizedBox(height: 400,),
              Padding(padding: const EdgeInsets.only(bottom: 15), child:
              // watchDet.addressFill?
              AppButton(onPressed: (){

                Navigator.pushNamed(context, Routes.verifyID);
              }, label: 'Continue'))
                  // : DisabledButton(label: 'Continue'),)
            ],
          ),
        ),
      ),
    );
  }
}
