import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icebox_cafe/resources/route_manager.dart';

import '../../../resources/style_manager.dart';

class GiftCardScreen extends StatelessWidget {
  const GiftCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        title: Text("Gift Card"),
        leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.homeRoute);
            },
            child: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Gift Card",
              style: StyleManager()
                  .customTextStyle(25, Colors.black, FontWeight.w400),
            )),
      ),
    );
  }
}
