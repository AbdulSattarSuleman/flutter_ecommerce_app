import 'package:flutter/material.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/images_manager.dart';
import 'package:icebox_cafe/resources/route_manager.dart';
import 'package:icebox_cafe/utils/elevated_button.dart';
import 'package:icebox_cafe/utils/text_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImagesManager.signInImage,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(0, 0, 1, 0.1),
                  Color.fromRGBO(0, 0, 0, 0.5),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                RoundedButtonWidget(
                  buttonText: "Register",
                  routeName: Routes.registerRoute,
                  bgColor: Colors.white,
                  txtColor: ColorManager.primaryColor,
                  fontSize: 20,
                  p_left: 36.0,
                  p_top: 10.0,
                  p_right: 36.0,
                  p_bot: 10.0,
                  borderRadius: 20.0,
                ),
                SizedBox(
                  height: 20,
                ),
                SimpleTextButton(
                  text: "Login",
                  txtColor: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
