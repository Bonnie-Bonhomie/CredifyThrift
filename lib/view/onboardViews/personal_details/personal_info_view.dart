import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/core/constants/app_size.dart';
import 'package:credify/core/utils/date_formatter.dart';
import 'package:credify/core/utils/form_widget.dart';
import 'package:credify/core/utils/loaderFile/loading_wrapper.dart';
import 'package:credify/core/utils/validator/validatoe.dart';
import 'package:credify/core/widgets/app_button.dart';
import 'package:credify/view/view_widgets/reuse_container.dart';
import 'package:credify/viewModel/auth_view_model/details_view_model.dart';
import 'package:credify/viewModel/loader_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final dateOfBirth = TextEditingController();
  final securityCode = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final firstKey = GlobalKey<FormFieldState>();
  final lastKey = GlobalKey<FormFieldState>();
  final dobKey = GlobalKey<FormFieldState>();
  final secKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final readDet = context.read<DetailsViewModel>();
    final watchDet = context.watch<DetailsViewModel>();
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
              child: Text('step 1 of 3'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSize.padding),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Personal Info',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'We ask for your personal information to verify your application.',
                ),
                const SizedBox(height: 10),
                ReuseContainer(
                 child:
                  FormWidget(
                    label: 'First name',
                    fieldKey: firstKey,
                    validator: (val) => Validator.validateText(val, 'first name'),
                    valController: firstNameCtrl,
                    onChanged: (val) {
                      firstKey.currentState!.validate();
                      readDet.firstFill(val);
                    },
                  ),
                ),
                ReuseContainer(
                  child:
                  FormWidget(
                    label: 'Last name',
                    fieldKey: lastKey,
                    validator: (value) =>
                        Validator.validateText(value, 'last name'),
                    valController: lastNameCtrl,
                    onChanged: (val) {
                      lastKey.currentState!.validate();
                      readDet.lastNFill(val);
                    },
                  ),
                ),
                ReuseContainer(
                  child:
                  TextFormField(
                    key: dobKey,
                    validator: (val) => Validator.validateDate(val!),
                    controller: dateOfBirth,
                    decoration: InputDecoration(
                      labelText: 'Date of birth (MM/DD/YYYY)',
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      suffixIcon: Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                   inputFormatters: [
                     FilteringTextInputFormatter.digitsOnly,
                     DateFormatter()
                   ],
                    onChanged: (val){
                      dobKey.currentState!.validate();
                      readDet.dateFFill(val);
                    },
                  ),
                ),
                ReuseContainer(
                  child: FormWidget(
                    label: 'Social Security number',
                    fieldKey: secKey,
                    validator: (val) {
                      if(val!.isNotEmpty){
                        return null;
                      }
                      return 'Enter your security number';
                    },
                    valController: securityCode,
                    onChanged: (val) {
                      secKey.currentState!.validate();
                      readDet.sectFill(val);
                    },
                    suffixIcon: Icon(
                      Icons.lock_outline,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'We use 128-bit encryption for security, and this is only use for identity verification purpose.',
                ),
                const SizedBox(height: 150),
                watchDet.nameFill && watchDet.secFill && watchDet.secFill && watchDet.dateFill
                    ? AppButton(onPressed: () {
                      if(formKey.currentState!.validate()){
                            context.read<LoaderModel>().changeLoadingState((){
                              Navigator.pushNamed(context, Routes.address);
                            });
                      }
                }, label: 'Continue')
                    :DisabledButton(label: 'Continue'),
              ],
            ),
          ),
        ),
      ),
    );
  }

}


