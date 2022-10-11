import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/style_manager.dart';

class ThemeManger {
  ThemeData applicationTheme() {
    return ThemeData(
        primaryColor: ColorManager.primaryColor,
        primarySwatch:
            MaterialColor(0xFFFE5000, ColorManager().primarySwtachColor),
        appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            // brightness: Brightness.light,
            iconTheme: IconThemeData(color: ColorManager.primaryColor),
            backgroundColor: Colors.white,
            elevation: 1.5,
            centerTitle: true,
            // systemOverlayStyle: SystemUiOverlayStyle(),
            titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorManager.primaryColor)),

        //  Navigation Bar Style
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 10,
            height: 65,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            indicatorColor: Colors.transparent,
            iconTheme: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return IconThemeData(
                  color: ColorManager.primaryColor,
                );
              }
              return IconThemeData(
                color: Color.fromARGB(255, 147, 145, 145),
                // size: 35,
              );
            }),
            labelTextStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return TextStyle(
                  fontSize: 13,
                  color: ColorManager.primaryColor,
                );
              }
              return TextStyle(
                color: Color(0xff797878),
                fontSize: 13,
              );
            })));
  }
}
