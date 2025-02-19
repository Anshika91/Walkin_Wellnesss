import 'package:flutter/material.dart';

import '../style/styling.dart';

class Button extends StatelessWidget {
  final String btnTxt;
  final VoidCallback onTap;
  final bool border;
  final Color borderColor;
  final bool roundedBorder;

  const Button(
      {Key? key,
        this.roundedBorder = false,
        required this.btnTxt,
        required this.onTap,
        this.border = false,
        required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: border ? Colors.transparent : AppColor.pColor,
      borderRadius: roundedBorder
          ? BorderRadius.circular(PadRadius.radius)
          : BorderRadius.circular(5),
      child: InkWell(
        highlightColor: Colors.grey,
        //  splashColor: border ? AppColor.pColor : null,
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
            borderRadius: roundedBorder
                ? BorderRadius.circular(PadRadius.radius)
                : BorderRadius.circular(5)),
        child: Container(
          height: 53,
          decoration: BoxDecoration(
              border: border ? Border.all(color: borderColor) : null,
              borderRadius: roundedBorder
                  ? BorderRadius.circular(PadRadius.radius)
                  : BorderRadius.circular(5)),
          width: double.infinity,
          child: Center(
            child: Text(
              btnTxt,
              style: AppTextStyle.body16,
            ),
          ),
        ),
      ),
    );
  }
}
