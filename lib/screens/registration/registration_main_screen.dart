import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/constants.dart';
import 'package:flutter_registration/config/size_config.dart';
import 'package:flutter_registration/screens/registration/components/registration_step_four.dart';
import 'package:flutter_registration/screens/registration/components/registration_step_one.dart';
import 'package:flutter_registration/screens/registration/components/registration_step_three.dart';
import 'package:flutter_registration/screens/registration/components/registration_step_two.dart';
import 'package:flutter_registration/screens/registration/components/registration_steps.dart';
import 'package:flutter_registration/screens/registration/components/registration_success.dart';
import 'package:flutter_registration/screens/registration/registration_controller.dart';
import 'package:flutter_registration/widgets/default_button.dart';
import 'package:provider/provider.dart';

class RegistrationMainScreen extends StatefulWidget {
  static String routeName = "/registration";

  @override
  State<StatefulWidget> createState() => _RegistrationMainScreenState();
}

class _RegistrationMainScreenState extends State<RegistrationMainScreen> {
  int _stepsCompleted = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: _body,
    );
  }

  Widget get _body => SingleChildScrollView(
    child: Container(
      margin: EdgeInsets.only(left: 16, top: 56, right: 16, bottom: 56),
      child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RegistrationSteps(_stepsCompleted),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              _currentRegistrationStepPage,
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              _nextButton
            ],
          ),
    ),
  );

  Widget get _currentRegistrationStepPage {
    switch (_stepsCompleted) {
      case 0:
        return RegistrationStepOne();
      case 1:
        return RegistrationStepTwo();
      case 2:
        return RegistrationStepThree();
      case 3:
        return RegistrationStepFour();
      default:
        return RegistrationSuccess();
    }
  }

  Widget get _nextButton => Selector(
    selector: (_, RegistrationController controller) => controller.isFormValid,
    builder: (_, value, child) => DefaultButton(
      isEnabled: value,
      text: _stepsCompleted < 4 ? 'NEXT' : 'DONE',
      press: () {
        if (_stepsCompleted < 4) {
          setState(() {
            ++_stepsCompleted;
            if (_stepsCompleted != 4) {
              Provider.of<RegistrationController>(context, listen: false).setFormValid(false);
            }
          });
        } else {
          setState(() {
            _stepsCompleted = 0;
          });
        }
      },
    ),
  );
}
