import 'package:flutter/widgets.dart';
import 'package:flutter_registration/screens/registration/registration_main_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  RegistrationMainScreen.routeName: (context) => RegistrationMainScreen(),
};
