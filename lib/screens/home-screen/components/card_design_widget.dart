import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/images_manager.dart';
import '../../../resources/route_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/text_manager.dart';
import '../../../utils/elevated_button.dart';

class TwoCardDesignWidget extends StatelessWidget {
  const TwoCardDesignWidget({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Reserve Items
        SizedBox(
          height: 260,
          width: screenSize.width * 0.47,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // shrinkWrap: true,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // width: 30,
                    // child: Image.asset(
                    //   ImagesManager.vendingImg,
                    // ),
                    child: SvgPicture.asset(ImagesManager.fridgeImg2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    TextManger.card1Title,
                    style: StyleManager().railwayFont(
                        20, ColorManager.textColorDark, FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    TextManger.card1Desc,
                    textAlign: TextAlign.center,
                    style: StyleManager().customTextStyle(
                        12, Color(0xff8D8D8D), FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RoundedButtonWidget(
                      buttonText: "Order Now",
                      p_bot: 5.0,
                      p_left: 20.0,
                      p_right: 20.0,
                      p_top: 2.0,
                      borderRadius: 20.0,
                      bgColor: ColorManager.primaryColor,
                      txtColor: Colors.white,
                      fontSize: 12,
                      routeName: Routes.getlocationRoute)
                ],
              ),
            ),
          ),
        ),
        // Gift card
        SizedBox(
          height: 260,
          width: screenSize.width * 0.48,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // shrinkWrap: true,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 57,
                    child: Image.asset(
                      ImagesManager.cardImg,
                    ),
                    // child: SvgPicture.asset(
                    //   ImagesManager.newCardImg,
                    // ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    TextManger.card2Title,
                    style: StyleManager().railwayFont(
                        20, ColorManager.textColorDark, FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    TextManger.card2Desc,
                    textAlign: TextAlign.center,
                    style: StyleManager().customTextStyle(
                        12, Color(0xff8D8D8D), FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RoundedButtonWidget(
                      buttonText: "Order Now",
                      p_bot: 5.0,
                      p_left: 20.0,
                      p_right: 20.0,
                      p_top: 2.0,
                      borderRadius: 20.0,
                      bgColor: ColorManager.primaryColor,
                      txtColor: Colors.white,
                      fontSize: 12,
                      routeName: Routes.orderSucessRoute)
                ],
              ),
            ),
          ),
        ),
        // Gift Card
      ],
    );
  }
}
