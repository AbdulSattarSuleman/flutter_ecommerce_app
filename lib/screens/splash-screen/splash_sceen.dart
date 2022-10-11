import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/images_manager.dart';
import 'package:icebox_cafe/screens/sign-in-screen/signin_screen.dart';
import 'package:icebox_cafe/utils/functionality/api_function.dart';
import 'package:icebox_cafe/utils/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      print('$Timer(Duration(milliseconds: 300))');
      print("loader false");
      _isLoading = true;
    });
    Timer(Duration(seconds: 3), () {
      _isLoading = false;
      print("loader true");
      Navigator.push(
          context,
          PageTransition(
              child: SignInScreen(), type: PageTransitionType.rightToLoeft));
      _isLoading = true;
      print(_isLoading);
    });

    // APIFunction().vendingMachingListUsingLatlong();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImagesManager.splashImage))),
          child: Stack(children: const [
            // Logo Image
            Center(
              child: Image(
                image: AssetImage(ImagesManager.logo),
                width: 150,
              ),
            ),
            // Hide Splash Loader
            // _isLoading ? CircularProgressIndicator() : splashLoader(),

            // Shape Image
            Image(
              image: AssetImage(ImagesManager.splashShape),
              height: 350,
            )
          ]),
        ),
      ),
    );
  }

  Widget splashLoader() {
    print("loading screen");
    final screenSize = MediaQuery.of(context).size;
    return Align(
        alignment: Alignment.center,
        child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.black38,
            child: SizedBox(
              width: screenSize.width * 0.16,
              height: screenSize.width * 0.16,
              child: CircularProgressIndicator(
                backgroundColor: ColorManager.primaryColor,
                color: Colors.white,
              ),
            )));
  }
}
