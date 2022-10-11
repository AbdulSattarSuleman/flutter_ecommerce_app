import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/images_manager.dart';
import 'package:icebox_cafe/resources/route_manager.dart';
import 'package:icebox_cafe/resources/style_manager.dart';
import 'package:icebox_cafe/screens/location-screen/components/location_list.dart';
import 'package:icebox_cafe/utils/elevated_button.dart';

class ExploreSingleLocationScreen extends StatelessWidget {
  const ExploreSingleLocationScreen(
      {Key? key, this.machineName, this.branchId, this.distance, this.address})
      : super(key: key);
  final machineName;
  final branchId;
  final distance;
  final address;
  @override
  Widget build(BuildContext context) {
    // final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    // print(args);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        // print(args);
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              // physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                // Get Directions
                Container(
                  child: Column(
                    children: [
                      // Spacer(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(machineName,
                          style: StyleManager().customTextStyle(
                              22, ColorManager.textColorDark, FontWeight.w700)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        address.toString(),
                        textAlign: TextAlign.center,
                      ),
                      // Text(branchId.toString()),
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          // child: Image(
                          //     image: AssetImage(ImagesManager.directiomImg)),
                          child: Icon(Icons.directions_outlined)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Get Direction - " + distance.toString() + " Km",
                        style: StyleManager().customTextStyle(
                            14, ColorManager.accentColor, FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Divider(color: ColorManager.borderColor, thickness: 1.0),
                //  Timing
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        // child: Image(image: AssetImage(ImagesManager.watchImg)),
                        child: Icon(Icons.watch_later_outlined),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Open - Closes at 11:59 pm",
                        style: StyleManager().customTextStyle(
                            14, ColorManager.textColorDark, FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Divider(color: ColorManager.borderColor, thickness: 1.0),

                //  Public/Private Location
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        // child: Image(image: AssetImage(ImagesManager.lockImg)),
                        child: Icon(Icons.lock_open),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Public Location",
                        style: StyleManager().customTextStyle(
                            14, ColorManager.textColorDark, FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Location is accessible to public",
                        style: StyleManager().customTextStyle(
                            12, Color(0xff767676), FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Divider(color: ColorManager.borderColor, thickness: 1.0),
                // Area/Location
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        // child: Image(
                        //     image: AssetImage(ImagesManager.locationImg),
                        //     fit: BoxFit.fill),
                        child: Icon(Icons.location_on_rounded),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Located in the main dining area",
                        style: StyleManager().customTextStyle(
                            14, ColorManager.textColorDark, FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Divider(color: ColorManager.borderColor, thickness: 1.0),
                // Mobile Ordering
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.mobile_screen_share_outlined)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Mobile Ordering Available",
                        style: StyleManager().customTextStyle(
                            14, ColorManager.textColorDark, FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Order your items ahead for pickup at this Fridge",
                        style: StyleManager().customTextStyle(
                            12, Color(0xff767676), FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Divider(color: ColorManager.borderColor, thickness: 1.0),
                // Tochless PickUp

                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.do_not_touch_outlined)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tochless Pick Up Available",
                        style: StyleManager().customTextStyle(
                            14, ColorManager.textColorDark, FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: Text(
                          "Order ahead on the app and pick up your food without touching the screen",
                          textAlign: TextAlign.center,
                          style: StyleManager().customTextStyle(
                              12, Color(0xff767676), FontWeight.w400,
                              lineHeight: 1.3),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Divider(color: ColorManager.borderColor, thickness: 1.0),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            // width: screenSize.width * 0.5,
            // decoration: BoxDecoration(
            //   boxShadow: [BoxShadow(offset: Offset(10.0, 0))],
            // ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  padding: EdgeInsets.fromLTRB(80, 13, 80, 13),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.menuRoute);
                },
                child: Text(
                  "Order For Pickup",
                  style: TextStyle(fontSize: 18),
                )),
          ),
          // RoundedButtonWidget(
          //     borderRadius: 20.0,
          //     buttonText: "Order For Pickup",
          //     p_bot: 10.0,
          //     p_top: 10.0,
          //     p_left: 70.0,
          //     p_right: 70.0,
          //     bgColor: ColorManager.primaryColor,
          //     txtColor: Colors.white,
          //     fontSize: 18,
          //     routeName: Routes.menuRoute),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
