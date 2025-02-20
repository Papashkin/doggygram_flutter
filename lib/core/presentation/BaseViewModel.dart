import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  static void _emptyFunction() {}

  BaseViewModel();

  void updateStateWithNotification({void Function() action = _emptyFunction}) {
    action.call();
    notifyListeners();
  }
}
