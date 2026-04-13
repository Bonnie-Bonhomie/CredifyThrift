import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/core/constants/app_size.dart';
import 'package:credify/core/utils/loaderFile/loading_wrapper.dart';
import 'package:credify/core/widgets/app_button.dart';
import 'package:credify/view/onboardViews/identifyVerification/verify_method.dart';
import 'package:credify/view/view_widgets/reuse_container.dart';
import 'package:credify/viewModel/auth_view_model/details_view_model.dart';
import 'package:credify/viewModel/loader_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressDetailsView extends StatelessWidget {
  AddressDetailsView({super.key});

  final TextEditingController addressCtrl = TextEditingController();
  final addressKey = GlobalKey<FormFieldState>();
  final formKey = GlobalKey<FormState>();
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
              ReuseContainer(child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                key: addressKey,
                controller: addressCtrl,
                validator: (val){},
                decoration: InputDecoration(
                  hint: Text('Street address'),
                  contentPadding: const EdgeInsets.all(5)
                ),
                onChanged: (val){
                  addressKey.currentState!.validate();
                  readDet.addFill(val);
                },
              )),
              const SizedBox(height: 400,),
              Padding(padding: const EdgeInsets.only(bottom: 15), child:
              watchDet.addressFill? AppButton(onPressed: (){
                Navigator.pushNamed(context, Routes.verifyID);
              }, label: 'Continue'):
              DisabledButton(label: 'Continue'),)
            ],
          ),
        ),
      ),
    );
  }
}
