import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/utils/loaderFile/loading_wrapper.dart';
import 'package:credify/core/widgets/app_button.dart';
import 'package:credify/core/widgets/app_text_widget.dart';
import 'package:credify/view/view_widgets/gradient_page.dart';
import 'package:credify/viewModel/loader_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});

  final List<String> numbersList = [
    '+234', '+221', '+122',
    // '+234','+221' ,'+122',
    // '+234','+221' ,'+122',
    // '+234','+221' ,'+122',
    // '+234','+221' ,'+122',
    // '+234','+221' ,'+122',
  ];
  final int selected = 0;

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<LoaderModel>().isLoading;
    return Scaffold(
      body: LoaderWrapper(
        loading: loading,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                AppText(data: 'This is the home page'),
                AppButton(
                  onPressed: () async {
                    // print(loading);
                    context.read<LoaderModel>().changeLoadingState(() {
                      // Navigator.push(context, MaterialPageRoute(builder: (context){
                      //   return GradientPageWidget();
                      // }));
                    });
                  },
                  label: 'App Button',
                ),

                Container(
                  height: 50,
                  width: 200,
                  color: AppColors.lightGrey,
                  child: Text('This container color'),
                ),
                SizedBox(height: 30),
                Container(
                  height: 50,
                  width: 200,
                  color: AppColors.darkGrey,
                  child: Text(
                    'This container color',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: 300,
                  height: 100,
                  color: AppColors.lightGrey,
                  child: Row(
                    children: [
                      Text('data'),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_drop_down_sharp),
                      ),
                      SizedBox(height: 10, child: VerticalDivider()),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
