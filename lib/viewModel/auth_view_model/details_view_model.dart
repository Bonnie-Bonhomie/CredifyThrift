import 'package:flutter/material.dart';

class DetailsViewModel extends ChangeNotifier{



  bool nameFill =  false;
  bool lastFill = false;
  bool secFill = false;
  bool dateFill = false;
  bool _addressFill = false;

  bool get addressFill => _addressFill;

  void firstFill(String fName){
    nameFill = fName.isNotEmpty;
    notifyListeners();
  }
  void lastNFill(String val){
    lastFill = val.isNotEmpty;
    notifyListeners();
  }
  void dateFFill(String val){
    dateFill = val.isNotEmpty;
    notifyListeners();
  }
  void sectFill(String val){
    secFill = val.isNotEmpty;
    notifyListeners();
  }
  void addFill(String val){
    _addressFill = val.isNotEmpty;
    notifyListeners();
  }



}