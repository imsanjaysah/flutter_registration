import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/constants.dart';
import 'package:flutter_registration/config/size_config.dart';
import 'package:flutter_registration/screens/registration/components/registration_step_one.dart';
import 'package:flutter_registration/screens/registration/components/registration_steps.dart';
import 'package:flutter_registration/widgets/default_button.dart';

class RegistrationMainScreen extends StatefulWidget {
  static String routeName = "/registration";

  @override
  State<StatefulWidget> createState() => _RegistrationMainScreenState();
}

class _RegistrationMainScreenState extends State<RegistrationMainScreen> {
  int _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: _body,
    );
  }

  Widget get _body => Container(
    margin: EdgeInsets.only(left: 16, top: 56, right: 16, bottom: 56),
    child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RegistrationSteps(),
            _currentRegistrationStepPage,
            _nextButton
          ],
        ),
  );

  Widget get _currentRegistrationStepPage {
    switch (_currentStep) {
      case 1:
        return RegistrationStepOne();
      default:
        return Container();
    }
  }

  Widget get _nextButton => DefaultButton(
    text: 'NEXT',
    press: () {
    },
  );
}
