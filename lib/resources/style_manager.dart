import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleManager {
  TextStyle customTextStyle(
      double fontSize, Color textColor, FontWeight fontWeight,
      {double lineHeight = 0}) {
    return GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        height: lineHeight);
  }

  TextStyle railwayFont(double fontSize, Color textColor, FontWeight fontWeight,
      {double lineHeight = 0}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: textColor,
      fontFamily: "Railway Reg",
    );
  }
}
