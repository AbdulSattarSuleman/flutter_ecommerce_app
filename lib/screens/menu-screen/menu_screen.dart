import 'package:flutter/material.dart';

import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/style_manager.dart';

// ignore: must_be_immutable
class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: ColorManager.appBarColor,
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(children: [
          Container(
            margin: EdgeInsets.zero,
            height: 160.0,
            color: ColorManager.appBarColor,
            child: Stack(
              children: [
                // Positioned(
                //   left: 0,
                //   top: 0,
                //   child: IconButton(
                //     icon: Icon(
                //       Icons.abc_rounded,
                //       color: Color(0xff49454F),

                //       // color: Color,
                //       size: 20,
                //     ),
                //     onPressed: () {
                //       print("your menu action here");
                //       // _scaffoldKey.currentState.openDrawer();
                //     },
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  color: ColorManager.appBarColor,
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: Text(
                    "Menu",
                    textAlign: TextAlign.center,
                    style: StyleManager()
                        .railwayFont(24, Colors.white, FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      print("your menu action here");
                      // _scaffoldKey.currentState.openDrawer();
                    },
                  ),
                ),
                Positioned(
                  // top: 00.0,
                  left: 0.0,
                  right: 0.0,
                  bottom: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Color(0xff49454F),
                            ),
                            onPressed: () {
                              print("your menu action here");
                              // _scaffoldKey.currentState.openDrawer();
                            },
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                labelText: "Search Items",
                                hintText: "Input",
                              ),
                            ),
                          ),
                          // IconButton(
                          //   icon: Icon(
                          //     Icons.search,
                          //     color: Colors.red,
                          //   ),
                          //   onPressed: () {
                          //     print("your menu action here");
                          //   },
                          // ),
                          // IconButton(
                          //   icon: Icon(
                          //     Icons.notifications,
                          //     color: Colors.red,
                          //   ),
                          //   onPressed: () {
                          //     print("your menu action here");
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
