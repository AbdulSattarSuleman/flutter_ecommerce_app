import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/style_manager.dart';

class RecentOrderScreen extends StatelessWidget {
  const RecentOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Recent"),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new)),
          // child: Icon(Typicons.map)),
        ),
        body: DefaultTabController(
          // initialIndex: 0,
          animationDuration: Duration(seconds: 0),
          length: 3,
          child: Column(
            children: [
              TabBar(
                  labelColor: ColorManager.primaryColor,
                  indicatorColor: ColorManager.primaryColor,
                  unselectedLabelColor: ColorManager.greyColor,
                  labelStyle: StyleManager().customTextStyle(
                      14, ColorManager.greyColor, FontWeight.w400),
                  indicatorSize: TabBarIndicatorSize.tab,
                  automaticIndicatorColorAdjustment: true,
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return ColorManager.textColorDark;
                    }
                    return ColorManager.primaryColor.withOpacity(0.4);
                  }),
                  // indicator: ,
                  tabs: [
                    Tab(
                      text: "All",
                    ),
                    Tab(
                      text: "Pending",
                    ),
                    Tab(
                      text: "Completed",
                    )
                  ])
            ],
          ),
        ));
  }
}
