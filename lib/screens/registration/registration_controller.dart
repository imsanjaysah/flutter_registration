import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/constants.dart';
class PasswordComplexity {
  PasswordComplexity(this.complexity, this.color);
  final String complexity;
  final Color color;
}
class RegistrationController extends ChangeNotifier {
  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  String _password;
  String get password => _password;

  PasswordComplexity _passwordComplexity;
  PasswordComplexity get passwordComplexity => _passwordComplexity;

  void  setPassword(String password) {
    _password = password;
    _calculatePasswordComplexity();
    notifyListeners();
  }

  void setFormValid(bool status) {
    _isFormValid = status;
    notifyListeners();
  }

  void _calculatePasswordComplexity() {
    var passwordStrengthScore = 0;
    if (passwordHasLowerCaseLetterValidatorRegExp.hasMatch(_password)) {
      passwordStrengthScore += 2;
    }
    if (passwordHasUpperCaseLetterValidatorRegExp.hasMatch(_password)) {
      passwordStrengthScore += 2;
    }
    if (passwordHasDigitValidatorRegExp.hasMatch(_password)) {
      passwordStrengthScore += 2;
    }
    if (password.length >= 2) {
      passwordStrengthScore += 2;
    }

    switch(passwordStrengthScore) {
      case 0: 
        _passwordComplexity = PasswordComplexity('Very Weak', Colors.red.shade900);
        break;
      case 2:
        _passwordComplexity = PasswordComplexity('Weak', Colors.red);
        break;
      case 4:
        _passwordComplexity = PasswordComplexity('Medium', Colors.orange);
        break;
      case 6:
        _passwordComplexity = PasswordComplexity('Strong', Colors.amber);
        break;
      case 8:
        _passwordComplexity = PasswordComplexity('Very Strong', Colors.green);
        break;
      default:
        _passwordComplexity = PasswordComplexity('Very Strong', Colors.green);
        break;
    }
    if (passwordStrengthScore == 8) {
      _isFormValid = true;
    }
  }
}