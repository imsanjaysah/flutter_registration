import 'package:flutter/widgets.dart';
import 'package:flutter_registration/screens/registration/registration_controller.dart';
import 'package:flutter_registration/screens/registration/registration_main_screen.dart';
import 'package:provider/provider.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  RegistrationMainScreen.routeName: (context) => ChangeNotifierProvider(
        create: (_) => RegistrationController(),
        child: RegistrationMainScreen(),
      ),
};
