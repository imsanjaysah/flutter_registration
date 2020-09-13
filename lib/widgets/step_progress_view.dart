import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepProgressView extends StatelessWidget {
  const StepProgressView(
      List<String> stepsText,
      int curStep,
      double height,
      double width,
      double dotRadius,
      Color activeColor,
      Color inactiveColor,
      TextStyle stepsStyle,
      {Key key,
      this.decoration,
      this.padding,
      this.lineHeight = 2.0,
      this.borderColor = Colors.black})
      : _stepsText = stepsText,
        _curStep = curStep,
        _height = height,
        _width = width,
        _dotRadius = dotRadius,
        _activeColor = activeColor,
        _inactiveColor = inactiveColor,
        _stepStyle = stepsStyle,
        assert(curStep > 0 == true && curStep <= stepsText.length),
        assert(width > 0),
        assert(height >= 2 * dotRadius),
        assert(width >= dotRadius * 2 * stepsText.length),
        super(key: key);

  //height of the container
  final double _height;

//width of the container
  final double _width;

//container decoration
  final BoxDecoration decoration;

//list of texts to be shown for each step
  final List<String> _stepsText;

//cur step identifier
  final int _curStep;

//active color
  final Color _activeColor;

//in-active color
  final Color _inactiveColor;

  //Border color
  final Color borderColor;

//dot radius
  final double _dotRadius;

//container padding
  final EdgeInsets padding;

//line height
  final double lineHeight;

//steps text
  final TextStyle _stepStyle;

  List<Widget> _buildSteps() {
    var wids = <Widget>[];
    _stepsText.asMap().forEach((i, text) {
      var circleColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;

      var lineColor = _curStep > i + 1 ? _activeColor : borderColor;

      wids.add(CircleAvatar(
        radius: _dotRadius + 2,
        backgroundColor: borderColor,
        child: CircleAvatar(
          radius: _dotRadius,
          backgroundColor: circleColor,
          child: Text(
            text,
            style: _stepStyle,
          ),
        ),
      ));

      //add a line separator
      if (i != _stepsText.length - 1) {
        wids.add(Expanded(
            child: Container(
          height: lineHeight,
          color: lineColor,
        )));
      }
    });

    return wids;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        height: this._height,
        width: this._width,
        decoration: this.decoration,
        child: Row(
          children: _buildSteps(),
        ));
  }
}
