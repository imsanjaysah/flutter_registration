import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_registration/config/size_config.dart';

const kPrimaryColor = Colors.blue;
const kPrimaryLightColor = Color(0x662196F3);
const kBackgroundColor = Colors.indigo;


const kCurrentRegistrationStepColor = Colors.green;
const kDefaultRegistrationStepColor = Colors.white;
const kTextColor = Color(0xFF757575);


final headingStyle =TextStyle(fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.white);

final bodyStyle = TextStyle(fontSize: getProportionateScreenWidth(16),
    fontWeight: FontWeight.bold,
    color: Colors.white);

final captionStyle = TextStyle(fontSize: getProportionateScreenWidth(12),
    color: Colors.white);

bool get isAndroid => Platform.isAndroid == true;

final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final RegExp passwordHasDigitValidatorRegExp = RegExp("(?=.*[0-9]).*");
final RegExp passwordHasLowerCaseLetterValidatorRegExp = RegExp("(?=.*[a-z]).*");
final RegExp passwordHasUpperCaseLetterValidatorRegExp = RegExp("(?=.*[A-Z]).*");

String dateFormat(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}

String timeFormat(TimeOfDay timeOfDay) {
  return '${timeOfDay.hour}:${timeOfDay.minute}';
}

bool isPreviousDate(DateTime dateTime) {
  return dateTime.difference(DateTime.now()).inDays < 0;
}

bool isPreviousTime(TimeOfDay timeOfDay) {
  TimeOfDay now = TimeOfDay.now();
  int nowInMinutes = now.hour * 60 + now.minute;
  int selectedDateInMinutes = timeOfDay.hour * 60 + timeOfDay.minute;
  return selectedDateInMinutes - nowInMinutes < 0;
}

