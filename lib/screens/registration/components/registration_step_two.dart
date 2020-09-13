import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/constants.dart';
import 'package:flutter_registration/config/size_config.dart';
import 'package:flutter_registration/widgets/custom_textfield.dart';
import 'package:flutter_registration/widgets/password_validator_control.dart';

class RegistrationStepTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrationStepTwoState();
}

class _RegistrationStepTwoState extends State<RegistrationStepTwo> {
  @override
  Widget build(BuildContext context) => _body;

  Widget get _body => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title,
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          _desc,
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          _password,
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          _complexityRow,
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          PasswordValidatorControl(''),
        ],
      );

  Widget get _title => Text(
        'Create Password',
        style: bodyStyle,
      );

  Widget get _desc => Text(
        'Password will be used to be to account',
        style: captionStyle,
      );

  Widget get _password => CustomTextField(
        hintText: 'Create Password',
        suffixIcon: Icons.remove_red_eye,
      );

  Widget get _complexityRow => Row(
        children: [
          Text(
            'Complexity:',
            style: captionStyle,
          ),
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
          Text(
            'Very Weak',
            style: captionStyle)
        ],
      );
}
