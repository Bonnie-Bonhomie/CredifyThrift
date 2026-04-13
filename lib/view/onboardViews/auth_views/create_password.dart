import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/constants/app_size.dart';
import 'package:credify/core/utils/custom_snack_bar.dart';
import 'package:credify/core/utils/form_widget.dart';
import 'package:credify/core/utils/loaderFile/loading_wrapper.dart';
import 'package:credify/core/widgets/app_button.dart';
import 'package:credify/viewModel/auth_view_model/create_pwd_v_model.dart';
import 'package:credify/viewModel/loader_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePasswordView extends StatelessWidget {
  CreatePasswordView({super.key});

  final pwdKey = GlobalKey<FormFieldState>();
  final pwdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final readPwd = context.read<CreatePwdVModel>();
    final watchPwd = context.watch<CreatePwdVModel>();
    final loading = context.watch<LoaderModel>().isLoading;

    return LoaderWrapper(
      loading: loading,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.keyboard_arrow_left),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSize.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 200),
                  Text(
                    'Create Password',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'Choose a secure password that will be easy for you to remember',
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Theme.of(context).cardTheme.color,
                    ),
                    child: FormWidget(
                      textSize: 30,
                      fieldKey: pwdKey,
                      validator: (val) {
                        readPwd.validatePwd(val!);
                      },
                      valController: pwdCtrl,
                      obscure: watchPwd.obscure,
                      label: 'Password',
                      onChanged: (val) {
                        readPwd.filledPwd(val);
                        pwdKey.currentState!.validate();
                      },
                      suffixIcon: watchPwd.filled
                          ? IconButton(
                              onPressed: () {
                                readPwd.togglePwd();
                              },
                              icon: watchPwd.obscure
                                  ? Icon(Icons.visibility_outlined, color: Theme.of(context).iconTheme.color,)
                                  : Icon(Icons.visibility_off_outlined, color: Theme.of(context).iconTheme.color,),
                            )
                          : SizedBox(),
                    ),
                  ),
                  passwordRules(
                    context,
                    'Has at least 8 characters',
                    watchPwd.minLength,
                  ),
                  passwordRules(
                    context,
                    'Has an uppercase letter or symbol',
                    watchPwd.hasSymbol,
                  ),
                  passwordRules(context, 'Has a number', watchPwd.hasNumber),
                ],
              ),
              SizedBox(height: 130,),
              watchPwd.isValid
                  ? AppButton(onPressed: () {
                    context.read<LoaderModel>().changeLoadingState((){
                      CustomSnackbar.successSnack(context: context, message: 'Password has been set successfully');
                      Navigator.pushReplacementNamed(context, Routes.personalInfo);
                    });
              }, label: 'Continue')
                  : DisabledButton(label: 'Continue'),
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordRules(BuildContext context, String rule, bool valid) {
    return Row(
      children: [
        Icon(
          Icons.done,
          color: valid ? AppColors.blueGrey : Theme.of(context).cardTheme.color,
        ),
        const SizedBox(width: 5.0),
        Text(rule),
      ],
    );
  }
}
