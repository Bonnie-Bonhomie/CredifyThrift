import 'package:flutter/widgets.dart';

class CreatePwdVModel extends ChangeNotifier{

  bool _obscure = true;
  bool minLength = false;
  bool hasSymbol = false;
  bool hasNumber = false;
  bool _isValid = false;
  bool _filled = false;

  bool get obscure => _obscure;
  bool get isValid => _isValid;
  bool get filled => _filled;

  void togglePwd(){
    _obscure = !_obscure;
    notifyListeners();
  }
  void validatePwd(String value){
    minLength = value.length >= 8;
    hasNumber = RegExp(r'[0-9]').hasMatch(value);
    hasSymbol = RegExp(r'[A-Z !@#$%^&*(),.?":{}|<>]').hasMatch(value);
    // print(minLength);
    _isValid = minLength & hasNumber && hasSymbol;
    print(_isValid);
    notifyListeners();
  }

  void filledPwd(String val){
    _filled = val.isNotEmpty;
    notifyListeners();
  }
  void submitPwd(String pwd) async{

  }

}