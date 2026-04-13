import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/core/utils/custom_snack_bar.dart';
import 'package:credify/core/utils/loaderFile/loading_wrapper.dart';
import 'package:credify/core/utils/validator/validatoe.dart';
import 'package:credify/core/widgets/app_button.dart';
import 'package:credify/core/widgets/phone_number_form.dart';
import 'package:credify/core/widgets/term_or_agree.dart';
import 'package:credify/data/models/countries_model.dart';
import 'package:credify/view/onboardViews/auth_views/verify_acc.dart';
import 'package:credify/view/onboardViews/identifyVerification/verify_method.dart';
import 'package:credify/viewModel/auth_view_model/sign_in_v_model.dart';
import 'package:credify/viewModel/loader_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final formKey = GlobalKey<FormState>();

  final numberKey = GlobalKey<FormFieldState>();

  final numberCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<LoaderModel>().isLoading;
    final signMod = context.watch<SignUpViewM>();
    final readSign = context.read<SignUpViewM>();
    return LoaderWrapper(
      loading: loading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_left)),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 200,),
              Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sign Up', style: Theme.of(context).textTheme.headlineLarge,),
                      const SizedBox(height: 10,),
                      const Text(
                        'Simply enter your phone number to login or create an account.',
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Theme.of(context).cardTheme.color,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                showCountries(context, signMod.availableCount, (select){context.read<SignUpViewM>().selectCode(select);});
                              },
                              child: Row(
                                children: [
                                  Text(signMod.selected),
                                  const Icon(Icons.arrow_drop_down_sharp),
                                  SizedBox(
                                    height: 30,
                                    child: VerticalDivider(
                                      color: Theme.of(context).dividerTheme.color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: PhoneNumberFormField(
                                numberCtrl: numberCtrl,
                                numberKey: numberKey,
                                validator: (val) =>
                                    Validator.validateNumber(val!),
                                onChanged: (val){
                                  readSign.fillNumber(val);
                                  numberKey.currentState!.validate();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 200,),
              TermOfAgreeText(),
              const SizedBox(height: 30,),
              signMod.filled?
              AppButton(
                onPressed: () {

                  if(formKey.currentState!.validate()){
                  context.read<LoaderModel>().changeLoadingState(() {
                    numberCtrl.text = '${signMod.selected }-${numberCtrl.text.substring(1)}';
                    // CustomSnackbar.successSnack(context: context, message: 'You have sign In successfully');
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyAccView(number: numberCtrl.text,)));
                  });}
                },
                label: 'Continue',
              ): DisabledButton(label: 'Continue'),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

  void showCountries(BuildContext context, List<CountryModel> lists, Function(String) onTap){

    showDialog(context: context, builder: (context){
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            shrinkWrap: true,
              itemCount: lists.length,
              itemBuilder: (context, index){
                final item = lists[index];
                return ListTile(
                  // leading: Image(image: AssetImage('assetName')),
                  title: Text(item.name, style: TextStyle(color: Colors.black),),
                  trailing: Text(item.numberCode, style: TextStyle(color: Colors.black),),
                  onTap: () {onTap(item.numberCode); Navigator.pop(context);}
                );
              }),
        ),
      );
    });
  }
}
