import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/size_config.dart';

class RegistrationSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _body;

  Widget get _body => Column(
        children: [
          _successIcon,
          SizedBox(height: getProportionateScreenHeight(20),),
          _successText,
        ],
      );

  Widget get _successIcon => CircleAvatar(
        backgroundColor: Colors.white,
        radius: getProportionateScreenWidth(80),
        child: Icon(
          Icons.done,
          color: Colors.green,
          size: getProportionateScreenWidth(120),
        ),
      );

  Widget get _successText => Text(
        'Registration Success',
        style: TextStyle(
          fontSize: getProportionateScreenWidth(30),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
}
