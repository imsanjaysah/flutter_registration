import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/constants.dart';
import 'package:flutter_registration/config/size_config.dart';
import 'package:flutter_registration/screens/registration/registration_controller.dart';
import 'package:flutter_registration/widgets/drop_down_menu.dart';
import 'package:provider/provider.dart';

class RegistrationStepFour extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrationStepFourState();
}

class _RegistrationStepFourState extends State<RegistrationStepFour> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), lowerBound: 0.5, upperBound: 0.8
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceInOut,
    );
    //_animationController.forward();
    initAnimation(_animationController, _scaleAnimation);
  }

  void initAnimation(
      AnimationController controller, Animation<double> animation) {
    animation.addStatusListener((AnimationStatus status) {
      Future<void>(() {
        if (status == AnimationStatus.completed) {
          controller?.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller?.forward();
        }
      });
    });
    controller?.forward();
  }

  @override
  Widget build(BuildContext context) => _body;

  Widget get _body => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _clockAnimation,
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          _title,
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          _desc,
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          _date,
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          _time,
        ],
      );

  Widget get _clockAnimation => CircleAvatar(
    backgroundColor: Colors.white70,
    radius: 32,
    child: ScaleTransition(
      scale: _scaleAnimation,
      child: CircleAvatar(
        radius: 32,
        backgroundColor: Colors.white,
        child: Icon(Icons.calendar_today, color: kPrimaryColor,),
      ),
    ),
  );

  Widget get _title => Text(
        'Schedule Video Call',
        style: bodyStyle,
      );

  Widget get _desc => Text(
        'Choose the data and time that you preferred. We will send a link via email to make a video call on the scheduled date and time ',
        style: captionStyle,
      );

  Widget get _date => Selector(
        selector: (_, RegistrationController controller) =>
            controller.scheduleDate,
        builder: (context, date, child) => DropDownMenu(
          isEnabled: false,
          label: 'Date',
          menuItems: date == null
              ? [
                  '-Choose Date-',
                ]
              : [
                  dateFormat(date),
                ],
          onTap: () {
            isAndroid ? _androidPickDate() : _iOSPickDate();
          },
        ),
      );

  Widget get _time => Selector(
        selector: (_, RegistrationController controller) =>
            controller.scheduleTime,
        builder: (context, time, child) => DropDownMenu(
          isEnabled: false,
          label: 'Time',
          menuItems: time == null
              ? [
                  '-Choose Time-',
                ]
              : [
                  timeFormat(time),
                ],
          onTap: () {
            isAndroid ? _androidPickTime() : _iOSPickTime();
          },
        ),
      );

  _androidPickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDate: DateTime.now(),
    );
    if (date != null)
      Provider.of<RegistrationController>(context, listen: false).scheduleDate =
          date;
  }

  _androidPickTime() async {
    TimeOfDay time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null)
      Provider.of<RegistrationController>(context, listen: false).scheduleTime =
          time;
  }

  _iOSPickDate() async {
    CupertinoDatePicker(
      mode: CupertinoDatePickerMode.date,
      initialDateTime: DateTime(DateTime.now().year),
      onDateTimeChanged: (DateTime date) {
        if (date != null)
          Provider.of<RegistrationController>(context, listen: false)
              .scheduleDate = date;
      },
    );
  }

  _iOSPickTime() async {
    CupertinoDatePicker(
      mode: CupertinoDatePickerMode.time,
      initialDateTime: DateTime.now(),
      onDateTimeChanged: (DateTime date) {
        if (date != null)
          Provider.of<RegistrationController>(context, listen: false)
              .scheduleTime = TimeOfDay.fromDateTime(date);
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
