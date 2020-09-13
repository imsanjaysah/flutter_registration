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

  String _activationOption;

  String get activationOption => _activationOption;

  set setActivationOption(String option) {
    _activationOption = option;
    _validatePersonalInfo();
  }

  String _monthlyIncome;

  String get monthlyIncome => _monthlyIncome;

  set setMonthlyIncome(String option) {
    _monthlyIncome = option;
    _validatePersonalInfo();
  }

  String _monthlyExpense;

  String get monthlyExpense => _monthlyExpense;

  set setMonthlyExpense(String option) {
    _monthlyExpense = option;
    _validatePersonalInfo();
  }

  String _scheduleDate;

  String get scheduleDate => _scheduleDate;

  String _scheduleTime;

  String get scheduleTime => _scheduleTime;

  void setPassword(String password) {
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

    switch (passwordStrengthScore) {
      case 0:
        _passwordComplexity =
            PasswordComplexity('Very Weak', Colors.red.shade900);
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

  void _validatePersonalInfo() {
    if (_activationOption == null &&
        _monthlyIncome == null &&
        _monthlyExpense == null) {
      _isFormValid = false;
    } else if (!_activationOption.contains('-Choose Option-') &&
        !_monthlyIncome.contains('-Choose Option-') &&
        !_monthlyExpense.contains('-Choose Option-')) {
      _isFormValid = true;
    } else {
      _isFormValid = false;
    }
    notifyListeners();
  }
}
