import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/text_manager.dart';

class TwoBestWayText extends StatelessWidget {
  const TwoBestWayText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 35, 0, 20),
      child: Text(
        TextManger.homeTxt2,
        style: StyleManager().customTextStyle(
          20,
          ColorManager.textColorDark,
          FontWeight.w400,
        ),
      ),
    );
  }
}
