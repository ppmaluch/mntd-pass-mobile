import 'package:flutter/material.dart';
import 'package:mntd_mobile/utils/themes/colors.dart';
import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.person,
      this.hintStyle,
      this.onChanged,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: GFColors.kPrimary800Color,
        style: textStyle,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.green,
          ),
          hintText: hintText,
          hintStyle: hintStyle,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
