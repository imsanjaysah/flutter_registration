import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/constants.dart';
import 'package:flutter_registration/config/size_config.dart';

class PasswordValidatorControl extends StatelessWidget {
  const PasswordValidatorControl(this.password,
      {Key key, this.onValidPassword, this.onInValidPassword})
      : super(key: key);

  final String password;
  final VoidCallback onValidPassword;
  final VoidCallback onInValidPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _passwordControl('a', 'Lowercase', true),
        _passwordControl('A', 'Uppercase', false),
        _passwordControl('123', 'Number', false),
        _passwordControl('9+', 'Characters', true),
      ],
    );
  }

  Widget _passwordControl(String title, String desc, bool isDone) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isDone
              ? Text(
                  title,
                  style: headingStyle,
                )
              : CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 16,
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Text(desc, style: captionStyle)
        ],
      );
}
