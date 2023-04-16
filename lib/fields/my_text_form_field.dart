import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_styles.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.fillColor,
    required this.inputAction,
    required this.focusNode,
    required this.inputType,
  }) : super(key: key);

  final String hint;
  final IconData icon;
  final Color fillColor;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: focusNode.hasFocus
            ? kBodyText2.copyWith(color: kPrimaryColor)
            : kInputHintStyle,
        cursorColor: kSecondaryColor,
        keyboardType: inputType,
        textInputAction: inputAction,
        focusNode: focusNode,
        decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            border: kInputBorder,
            enabledBorder: kInputBorder,
            hintText: hint,
            hintStyle: kInputHintStyle,
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                  width: 2,
                  color: kScaffoldBackground,
                ))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    icon,
                    color: focusNode.hasFocus
                        ? kPrimaryColor
                        : kSecondaryColor.withOpacity(0.5),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
