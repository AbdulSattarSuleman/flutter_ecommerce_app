import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/route_manager.dart';
import 'package:icebox_cafe/resources/style_manager.dart';
import 'package:icebox_cafe/screens/home-screen/components/order_list_view.dart';

class RecentOrderScreen extends StatefulWidget {
  const RecentOrderScreen({super.key});

  @override
  State<RecentOrderScreen> createState() => _RecentOrderScreenState();
}

class _RecentOrderScreenState extends State<RecentOrderScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(2);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Recent"),
          leading: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.homeRoute);
              },
              child: Icon(Icons.arrow_back_ios_new)),
          // child: Icon(Typicon
          // s.map)),
          bottom: PreferredSize(
            preferredSize: Size(0, 50),
            child: Container(
              color: Colors.grey.shade200,
              height: 35,
              child: TabBar(
                  indicatorWeight: 1,
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: ColorManager.primaryColor.withOpacity(0.2),
                  ),
                  // indicator: UnderlineTabIndicator(
                  //     insets: EdgeInsets.symmetric(horizontal: 10),
                  //     borderSide: BorderSide(
                  //       width: 2,
                  //       color: ColorManager.primaryColor,
                  //     )),
                  labelColor: ColorManager.primaryColor,
                  // labelColor: Colors.white,
                  indicatorColor: ColorManager.primaryColor,
                  unselectedLabelColor: Colors.black,
                  // labelStyle: StyleManager().customTextStyle(
                  //     14, ColorManager.greyColor, FontWeight.w500),
                  indicatorSize: TabBarIndicatorSize.tab,
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
                  ]),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TabBarView(controller: _tabController, children: [
            OrderList(orderStatus: "Pending", cardItem: 10),
            OrderList(orderStatus: "Pending", cardItem: 5),
            OrderList(orderStatus: "Completed", cardItem: 2),
            // Text("Completed Screen"),
          ]),
        ),
      ),
    );
  }
}
