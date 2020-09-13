import 'package:flutter/material.dart';
import 'package:flutter_registration/config/constants.dart';
import 'package:flutter_registration/config/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press, this.isEnabled,
  }) : super(key: key);
  final String text;
  final bool isEnabled;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: kPrimaryColor,
        disabledColor: kPrimaryLightColor,
        onPressed: isEnabled ? press : null,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: isEnabled ? Colors.white : Colors.white70,
          ),
        ),
      ),
    );
  }
}
