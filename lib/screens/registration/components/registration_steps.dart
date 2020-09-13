import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/constants.dart';
import 'package:flutter_registration/config/size_config.dart';
import 'package:flutter_registration/widgets/step_progress_view.dart';

class RegistrationSteps extends StatelessWidget {
  RegistrationSteps(this._curPage, {Key key}) : super(key: key);

  final _stepsText = ['1','2','3','4'];

  final _stepCircleRadius = 30.0;

  final _stepProgressViewHeight = 150.0;

  final Color _activeColor = kCurrentRegistrationStepColor;

  Color _inactiveColor = kDefaultRegistrationStepColor;

  TextStyle _stepStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black);

  final int _curPage;

  @override
  Widget build(BuildContext context) {
    return StepProgressView(
      _stepsText,
      _curPage,
      _stepProgressViewHeight,
      SizeConfig.screenWidth,
      _stepCircleRadius,
      _activeColor,
      _inactiveColor,
      _stepStyle,
      decoration: BoxDecoration(color: Colors.transparent),
      padding: EdgeInsets.only(
        top: 48.0,
        left: 24.0,
        right: 24.0,
      ),
    );
  }


}
