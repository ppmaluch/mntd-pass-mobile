import 'package:flutter/material.dart';
import 'package:mntd_mobile/utils/themes/colors.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  final TextStyle hintStyle;
  final TextStyle textStyle;

  const RoundedPasswordField(
      {Key key, this.onChanged, this.hintStyle, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: GFColors.kPrimary800Color,
        style: textStyle,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: hintStyle,
          icon: Icon(
            Icons.lock,
            color: Colors.green,
          ),
          // suffixIcon: Icon(
          //   Icons.visibility,
          //   color: kPrimaryColor,
          //   pres
          // ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
