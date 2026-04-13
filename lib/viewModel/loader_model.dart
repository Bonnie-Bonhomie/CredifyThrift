import 'package:flutter/cupertino.dart';

class LoaderModel extends ChangeNotifier{

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> changeLoadingState(Function() action) async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
      action();
    _isLoading = false;
    notifyListeners();
  }

}