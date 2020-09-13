import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/constants.dart';
import 'package:flutter_registration/config/size_config.dart';
import 'package:flutter_registration/screens/registration/registration_controller.dart';
import 'package:flutter_registration/widgets/custom_textfield.dart';
import 'package:flutter_registration/widgets/password_validator_control.dart';
import 'package:provider/provider.dart';

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
          Selector(
            selector: (_, RegistrationController controller) =>
                controller.password,
            builder: (context, password, child) =>
                PasswordValidatorControl(password ?? ''),
          )
        ],
      );

  Widget get _title => Text(
        'Create Password',
        style: bodyStyle,
      );

  Widget get _desc => Text(
        'Password will be used to login to account',
        style: captionStyle,
      );

  Widget get _password => CustomTextField(
        hintText: 'Create Password',
        obscureText: true,
        suffixIcon: Icons.remove_red_eye,
        onChanged: (String password) {
          Provider.of<RegistrationController>(context, listen: false)
              .setPassword(password);
        },
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
          Selector(
            selector: (_, RegistrationController controller) =>
                controller.passwordComplexity,
            builder: (context, PasswordComplexity complexity, child) => Text(
                complexity != null ? complexity.complexity : '',
                style: captionStyle.apply(
                    color: complexity != null
                        ? complexity.color
                        : Colors.transparent)),
          )
        ],
      );
}
