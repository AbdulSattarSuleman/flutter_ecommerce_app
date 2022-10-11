import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SimpleTextButton extends StatelessWidget {
  SimpleTextButton(
      {Key? key,
      required this.text,
      required this.txtColor,
      required this.fontSize,
      this.fontWeight})
      : super(key: key);
  final String text;
  final double fontSize;
  final Color txtColor;
  final fontWeight;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(text,
          style: TextStyle(
              fontSize: fontSize, color: txtColor, fontWeight: fontWeight)),
    );
  }
}
