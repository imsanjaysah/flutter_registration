import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_registration/config/size_config.dart';

const kPrimaryColor = Colors.blue;
const kPrimaryLightColor = Color(0x992196F3);
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
