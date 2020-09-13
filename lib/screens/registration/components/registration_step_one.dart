import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/size_config.dart';
import 'package:flutter_registration/widgets/custom_textfield.dart';

class RegistrationStepOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrationStepOneState();
}

class _RegistrationStepOneState extends State<RegistrationStepOne> {
  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Widget get _body =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _welcomeTitle,
          SizedBox(height: getProportionateScreenHeight(20),),
          _welcomeBody,
          SizedBox(height: getProportionateScreenHeight(20),),
          _email
        ],
      );

  Widget get _welcomeTitle =>
      Text.rich(
        TextSpan(
          style: TextStyle(
              fontSize: getProportionateScreenWidth(40),
              fontWeight: FontWeight.bold,
              color: Colors.white),
          children: [
            TextSpan(text: "Welcome to \nGIN "),
            TextSpan(
              text: "Finans",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      );

  Widget get _welcomeBody =>
      Text(
        'Welcome to the Bank of the Future.\nManage and track your accounts on\n the go.',
        style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.bold,
            color: Colors.white),
      );

  Widget get _email =>
      CustomTextField(
        hintText: 'Email',
        prefixIcon: Icons.email,
      );
}
