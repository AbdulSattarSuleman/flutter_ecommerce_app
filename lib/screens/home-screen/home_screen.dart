import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icebox_cafe/font-dart-file/my_flutter_app_icons.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/images_manager.dart';
import 'package:icebox_cafe/resources/route_manager.dart';
import 'package:icebox_cafe/resources/style_manager.dart';
import 'package:icebox_cafe/resources/text_manager.dart';
import 'package:icebox_cafe/screens/home-screen/tabs/account_screen.dart';
import 'package:icebox_cafe/screens/home-screen/tabs/gift_card_screen.dart';
import 'package:icebox_cafe/screens/home-screen/tabs/order_screen.dart';
import 'package:icebox_cafe/screens/home-screen/tabs/recent_order_screen.dart';
import 'package:icebox_cafe/utils/elevated_button.dart';

import 'components/best_way_text.dart';
import 'components/card_design_widget.dart';
import 'components/order_list_view.dart';
import 'components/username_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, this.name}) : super(key: key);
  final name;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  int selectedIndex = 0;

  void _increaseIndex() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: NavigationBar(
      //     selectedIndex: selectedIndex,
      //     onDestinationSelected: (value) => setState(() {
      //           selectedIndex = value;
      //         }),
      //     destinations: [
      //       NavigationDestination(
      //         icon: SvgPicture.asset(ImagesManager.vendIcon),
      //         // icon: Icon(CustomIcons.accessibility),
      //         label: 'Order',
      //         selectedIcon: SvgPicture.asset(ImagesManager.orderIcon),
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.watch_later_outlined),
      //         label: 'Recent',
      //         // selectedIcon: SvgPicture.asset(ImagesManager.orderIcon),
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.card_giftcard),
      //         label: 'Gift Card',
      //         // selectedIcon: SvgPicture.asset(ImagesManager.orderIcon),
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.account_circle_outlined),
      //         label: 'Account',
      //         // selectedIcon: SvgPicture.asset(ImagesManager.orderIcon),
      //       ),
      //     ]),
      body: OrderScreenUI(widget: widget, screenSize: screenSize),
    );
  }
}
