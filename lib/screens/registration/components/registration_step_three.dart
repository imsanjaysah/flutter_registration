import 'package:flutter/cupertino.dart';
import 'package:flutter_registration/config/constants.dart';
import 'package:flutter_registration/config/size_config.dart';
import 'package:flutter_registration/widgets/drop_down_menu.dart';

class RegistrationStepThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrationStepThreeState();
}

class _RegistrationStepThreeState extends State<RegistrationStepThree> {
  @override
  Widget build(BuildContext context) => _body;

  Widget get _body =>
      Column(
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
          _activationOptions,
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          _incomeOptions,
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          _expenseOptions,
        ],
      );

  Widget get _title =>
      Text(
        'Personal Information',
        style: bodyStyle,
      );

  Widget get _desc =>
      Text(
        'Please fill in the information below and your goal for digital saving',
        style: captionStyle,
      );

  Widget get _activationOptions =>
      DropDownMenu(
        label: 'Goal for activation',
        menuItems: [
          '-Choose Option-',
          'Long term goal',
          'Mid term goal',
          'Short term goal'
        ],
        onItemSelected: (String option) {

        },
      );

  Widget get _incomeOptions =>
      DropDownMenu(
        label: 'Monthly income',
        menuItems: [
          '-Choose Option-',
          '20,000 - 50,000',
          '50,000 - 80,000',
          '80,000 - 1,00,000',
          '1,00,000+'

        ],
        onItemSelected: (String option) {

        },
      );

  Widget get _expenseOptions =>
      DropDownMenu(
        label: 'Monthly expense',
        menuItems: [
          '-Choose Option-',
          '10,000 - 20,000',
          '20,000 - 35,000',
          '35,000 - 50,000'
        ],
        onItemSelected: (String option) {

        },
      );
}
