import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/text_manager.dart';
import '../components/best_way_text.dart';
import '../components/card_design_widget.dart';
import '../components/order_list_view.dart';
import '../home_screen.dart';

class OrderScreenUI extends StatelessWidget {
  const OrderScreenUI({
    Key? key,
    required this.widget,
    required this.screenSize,
  }) : super(key: key);

  final HomeScreen widget;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 30,
          ),
          // User Name  Welcome Message
          // User Name  Welcome Message
          // WelcomeUserNameWidget(name: name),
          SizedBox(
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
                            text: widget.name == null ? '' : widget.name,
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
                            TextSpan(
                                text: " 😋", style: TextStyle(fontSize: 30))
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text two best
          TwoBestWayText(),

          // Two Cards
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 8, 10),
            child: TwoCardDesignWidget(screenSize: screenSize),
          ),

          // Text My Order
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 10, 20),
            child: Text(
              "My Orders",
              style: StyleManager()
                  .railwayFont(22, ColorManager.textColorDark, FontWeight.w600),
            ),
          ),

          // Orders Cards
          OrderList(orderStatus: "Pending", cardItem: 10),
        ],
      ),
    );
  }
}
