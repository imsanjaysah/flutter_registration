import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registration/config/constants.dart';
import 'package:flutter_registration/config/size_config.dart';
import 'package:flutter_registration/widgets/drop_down_menu.dart';

class RegistrationStepFour extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrationStepFourState();
}

class _RegistrationStepFourState extends State<RegistrationStepFour> {
  DateTime pickedDate;
  TimeOfDay time;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _body;

  Widget get _body => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

  Widget get _title => Text(
        'Schedule Video Call',
        style: bodyStyle,
      );

  Widget get _desc => Text(
        'Choose the data and time that you preferred. We will send a link via email to make a video call on the scheduled date and time ',
        style: captionStyle,
      );

  Widget get _date => DropDownMenu(
        isEnabled: false,
        label: 'Date',
        menuItems: pickedDate == null
            ? [
                '-Choose Date-',
              ]
            : [
                pickedDate.toString(),
              ],
        onTap: () {
          isAndroid ? _androidPickDate() : _iOSPickDate();
        },
      );

  Widget get _time => DropDownMenu(
        isEnabled: false,
        label: 'Time',
        menuItems: time == null
            ? [
                '-Choose Time-',
              ]
            : [
                time.toString(),
              ],
        onTap: () {
          isAndroid ? _androidPickTime() : _iOSPickTime();
        },
      );

  _androidPickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: DateTime.now(),
    );
    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }

  _androidPickTime() async {
    TimeOfDay t =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (t != null)
      setState(() {
        time = t;
      });
  }

  _iOSPickDate() async {
    CupertinoDatePicker(
      mode: CupertinoDatePickerMode.date,
      initialDateTime: DateTime(DateTime.now().year - 5),
      onDateTimeChanged: (DateTime date) {
        if (date != null)
          setState(() {
            pickedDate = date;
          });
      },
    );
  }

  _iOSPickTime() async {
    CupertinoDatePicker(
      mode: CupertinoDatePickerMode.time,
      initialDateTime: DateTime.now(),
      onDateTimeChanged: (DateTime date) {
        if (date != null)
          setState(() {
            time = TimeOfDay.fromDateTime(date);
          });
      },
    );
  }
}
