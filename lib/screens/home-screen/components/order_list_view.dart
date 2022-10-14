import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/images_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../utils/elevated_button.dart';

class OrderList extends StatelessWidget {
  OrderList({Key? key, required this.orderStatus, required this.cardItem})
      : super(key: key);
  final orderStatus;
  late int cardItem;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: cardItem,
        itemBuilder: ((context, index) {
          return Card(
            margin: EdgeInsets.only(left: 12, right: 12),
            elevation: 4.0,
            color: Color(0xffF9F9F9),
            child: Column(
              children: [
                ListTile(
                  // leading: Image(
                  //   image: AssetImage(
                  //     ImagesManager.vendingImg,
                  //   ),
                  // ),
                  leading: SvgPicture.asset(ImagesManager.fridgeImg2),
                  title: Text(
                    "IB1 - Icebox Cafe - Hallandale",
                    style: StyleManager().customTextStyle(
                        14, ColorManager.textColorDark, FontWeight.w500),
                  ),
                  subtitle: Text(
                    "219 NE 3rd St, Hallandale Beach, FL 33009, USA",
                    style: StyleManager().customTextStyle(
                        11, Color(0xff616060), FontWeight.w400),
                  ),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 0, 20, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text("asd"),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Item:",
                                style: StyleManager().customTextStyle(
                                    14,
                                    ColorManager.textColorDark,
                                    FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Granola ",
                                style: StyleManager().customTextStyle(14,
                                    ColorManager.primaryColor, FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Sale ID:",
                                style: StyleManager().customTextStyle(
                                    14,
                                    ColorManager.textColorDark,
                                    FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "01234 ",
                                style: StyleManager().customTextStyle(14,
                                    ColorManager.primaryColor, FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Amount:",
                                style: StyleManager().customTextStyle(
                                    14,
                                    ColorManager.textColorDark,
                                    FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "\$ 12.00 ",
                                style: StyleManager().customTextStyle(14,
                                    ColorManager.primaryColor, FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // BUtton Column
                      Column(
                        children: [
                          Text("Today 11:59pm"),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 20),
                          //   child: ElevatedButton(
                          //       style: ElevatedButton.styleFrom(
                          //           textStyle: TextStyle(
                          //               color: ColorManager.primaryColor),
                          //           backgroundColor: Color(0xffF9F9F9),
                          //           // foregroundColor: Color(0xffF9F9F9),
                          //           elevation: 1,
                          //           shape: StadiumBorder()),
                          //       onPressed: () {},
                          //       child: Text(
                          //         orderStatus,
                          //         style:
                          //             TextStyle(color: ColorManager.errorColor),
                          //       )),
                          // ),
                          Container(
                            margin: EdgeInsets.only(left: 30, top: 5),
                            height: 20,
                            padding: EdgeInsets.fromLTRB(10, 1, 10, 0),
                            // width: 30,
                            child: Text(
                              orderStatus,
                              style: StyleManager().customTextStyle(
                                  13, ColorManager.errorColor, FontWeight.w400),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border:
                                    Border.all(color: ColorManager.errorColor),
                                shape: BoxShape.rectangle),
                          )
                          // : RoundedButtonWidget(
                          //     buttonText: orderStatus,
                          //     borderRadius: 15.0,
                          //     bgColor: Colors.white,
                          //     txtColor: ColorManager.errorColor,
                          //     fontSize: 12,
                          //     routeName: "Rotes",
                          //     p_bot: 0.0,
                          //     p_left: 10.0,
                          //     p_right: 10.0,
                          //     p_top: 0.0,
                          //   )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}
