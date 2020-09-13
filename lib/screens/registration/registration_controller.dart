import 'package:flutter/cupertino.dart';

class RegistrationController extends ChangeNotifier {
  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  void setFormValid(bool status) {
    _isFormValid = status;
    notifyListeners();
  }
}