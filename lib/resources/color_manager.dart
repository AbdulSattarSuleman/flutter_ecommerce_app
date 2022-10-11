import 'package:flutter/material.dart';

class ColorManager {
  static const Color primaryColor = Color(0xFFFE5000);
  static const Color appBarColor = Color(0xFF8EAE3E);
  static const Color textColorDark = Color(0xff1C1B1F);
  static const Color greyColor = Color(0xff454053);
  static const Color accentColor = Color(0xff0056FC);
  static const Color errorColor = Color(0xffFF0000);
  static const Color borderColor = Color(0xffD7D3D3);

  Map<int, Color> primarySwtachColor = {
    50: Color.fromARGB(24, 236, 119, 64),
    100: Color.fromRGBO(254, 80, 0, .2),
    200: Color.fromRGBO(254, 80, 0, .3),
    300: Color.fromRGBO(254, 80, 0, .4),
    400: Color.fromRGBO(254, 80, 0, .5),
    500: Color.fromRGBO(254, 80, 0, .6),
    600: Color.fromRGBO(254, 80, 0, .7),
    700: Color.fromRGBO(254, 80, 0, .8),
    800: Color.fromRGBO(254, 80, 0, .9),
    900: Color.fromRGBO(254, 80, 0, 1),
  };
}
