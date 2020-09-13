import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/size_config.dart';
import 'package:flutter_registration/screens/registration/components/registration_steps.dart';

class RegistrationMainScreen extends StatelessWidget {
  static String routeName = "/registration";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: RegistrationSteps(),
    );
  }
}