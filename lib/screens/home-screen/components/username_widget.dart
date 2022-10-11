import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/text_manager.dart';

class WelcomeUserNameWidget extends StatelessWidget {
  const WelcomeUserNameWidget({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: RichText(
                text: TextSpan(
                    text: "Hi, ",
                    style: StyleManager()
                        .railwayFont(22, Colors.black, FontWeight.w500),
                    children: [
                  TextSpan(
                      text: "${name}",
                      style: StyleManager().railwayFont(
                        28,
                        ColorManager.textColorDark,
                        FontWeight.w500,
                      ))
                ])),
          ),
          // Emoji text
          Positioned(
            bottom: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: RichText(
                text: TextSpan(
                    text: TextManger.homeTxt1,
                    style: StyleManager().customTextStyle(
                        20, ColorManager.primaryColor, FontWeight.w600),
                    children: [
                      TextSpan(text: " 😋", style: TextStyle(fontSize: 30))
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
