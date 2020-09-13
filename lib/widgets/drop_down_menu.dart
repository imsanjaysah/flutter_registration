import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_registration/config/size_config.dart';

class DropDownMenu extends StatefulWidget {
  DropDownMenu(
      {this.label, this.menuItems, this.selectedItem, this.onItemSelected, this.isEnabled = true}) {
    /* if (selectedItem != null) {
      debugPrint('Current selected item name $selectedItem');
      //onItemSelected(selectedItem);
    }*/
  }

  final String label;
  String selectedItem;
  final List<String> menuItems;
  final bool isEnabled;
  final Function(String selectedItem) onItemSelected;

  @override
  State<StatefulWidget> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String _currentSelectionValue = '0';

  List<DropdownMenuItem<String>> _getDropdownMenuItems(List<String> menuItems) {
    final List<DropdownMenuItem<String>> menus = <DropdownMenuItem<String>>[];
    for (int i = 0; i < menuItems.length; i++) {
      menus.add(DropdownMenuItem<String>(
        value: '$i',
        child: Text(menuItems[i]),
      ));
    }
    return menus;
  }

  Widget _buildDropDownWidget(List<String> menuItems) {
    if (widget.selectedItem != null) {
      _currentSelectionValue =
          widget.menuItems.indexOf(widget.selectedItem).toString();
    }
    //Send by default first item is selected event
    widget.onItemSelected(menuItems[int.parse(_currentSelectionValue)]);
    debugPrint('Selected item is default $_currentSelectionValue');

    return SizedBox(
      height: 36,
      width: SizeConfig.screenWidth,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _currentSelectionValue,
          items: widget.isEnabled ? _getDropdownMenuItems(menuItems) : null,
          hint: Text(menuItems[int.parse(_currentSelectionValue)]),
          onChanged: (String value) {
            setState(() {
              //Below line is the workaround to fix this issue https://github.com/flutter/flutter/issues/47128
              FocusScope.of(context).requestFocus(FocusNode());
              _currentSelectionValue = value;
              widget.selectedItem =
              menuItems[int.parse(_currentSelectionValue)];
              widget
                  .onItemSelected(menuItems[int.parse(_currentSelectionValue)]);
              debugPrint('Selected item is $_currentSelectionValue');
            });
          },
          //isExpanded: true,
        ),
      ),
    );
  }

  Widget _buildLabel() => Text(
    widget.label,
    style: Theme.of(context).textTheme.caption.apply(color: Colors.grey),
  );

  Widget _buildWidget() => Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(4))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildLabel(),
        _buildDropDownWidget(widget.menuItems)
      ],
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _buildWidget();
}