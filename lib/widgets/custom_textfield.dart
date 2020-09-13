import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key key,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.obscureText, this.onSuffixIconClicked})
      : super(key: key);

  final String hintText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final bool obscureText;
  final Function(String) onChanged;
  final VoidCallback onSuffixIconClicked;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon),
                  onPressed: () {
                    onSuffixIconClicked();
                  },
                )
              : null),
      onChanged: onChanged,
    );
  }
}
