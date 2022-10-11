import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RoundedButtonWidget extends StatelessWidget {
  RoundedButtonWidget(
      {Key? key,
      this.buttonText,
      required this.bgColor,
      required this.txtColor,
      required this.fontSize,
      required this.routeName,
      this.borderRadius,
      this.p_bot,
      this.p_left,
      this.p_right,
      this.p_top})
      : super(key: key);
  final buttonText;
  final Color bgColor;
  final Color txtColor;
  final double fontSize;
  final String routeName;
  final p_top, p_bot, p_right, p_left;
  final borderRadius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Text(
          buttonText,
          style: TextStyle(fontSize: fontSize),
        ),
        style: ElevatedButton.styleFrom(
          // padding: EdgeInsets.fromLTRB(36, 10, 36, 10),
          padding: EdgeInsets.fromLTRB(p_left, p_top, p_right, p_bot),
          onPrimary: txtColor,
          primary: bgColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ));
  }
}
