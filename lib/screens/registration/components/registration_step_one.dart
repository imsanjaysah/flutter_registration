import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/size_config.dart';

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
      TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          prefixIcon: Icon(Icons.email)
        ),
      );
}
