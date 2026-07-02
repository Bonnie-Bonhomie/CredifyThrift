import 'dart:async';

import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/core/utils/custom_snack_bar.dart';
import 'package:credify/data/models/countries_model.dart';
import 'package:flutter/material.dart';

class SignUpViewM extends ChangeNotifier{

  List<CountryModel> availableCount = [
    CountryModel(name: 'America', imgPath: 'imgPath', numberCode: '+222'),
    CountryModel(name: 'Nigeria', imgPath: 'imgPath', numberCode: '+234'),
    CountryModel(name: 'India', imgPath: 'imgPath', numberCode: '+91'),
    CountryModel(name: 'Tanzania', imgPath: 'imgPath', numberCode: '+123'),
    CountryModel(name: 'South Korea', imgPath: 'imgPath', numberCode: '+111'),
  ];

  String _selected = '+234';
  bool _incorrectCode = false;
  int _seconds = 60;
  Timer? timer;
  bool _filled = false;


  int get seconds => _seconds;
  String get selected => _selected;
  bool get inCorrectCode => _incorrectCode;
  bool get filled => _filled;


  void fillNumber(String val){
    _filled = val.isNotEmpty;
    notifyListeners();
  }
  void selectCode (select){
    _selected = select;
    notifyListeners();
  }

  void startTimer(){
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (time){
      if(_seconds > 0){
        _seconds--;
        notifyListeners();
      }else{
        time.cancel();
      }
    });
  }

  void resetTimer(){
    timer?.cancel();
    _seconds = 60;
    _incorrectCode = false;
    notifyListeners();
  }
  void onComplete(BuildContext context, pin){
    if(pin.length == 4){
      validatePin(context, pin);
    }
    notifyListeners();
  }

  Future<void> validatePin(BuildContext context, pin) async {
    bool isValid =  pin =='1234';

    if(isValid) {
      CustomSnackbar.successSnack(
          context: context, message: 'Account verification is successful');
      Navigator.pushReplacementNamed(context, Routes.createPwd);
    }else{
      _incorrectCode = true;
      notifyListeners();
    }
  }


  void cancelTimer(){
    timer!.cancel();
    notifyListeners();
  }
  //
  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }
}