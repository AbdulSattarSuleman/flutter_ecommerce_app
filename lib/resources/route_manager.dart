import 'package:flutter/material.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/style_manager.dart';
import 'package:icebox_cafe/screens/home-screen/home_screen.dart';
import 'package:icebox_cafe/screens/location-screen/explore-singlelocation-screen/explore_single_location_screen.dart';
import 'package:icebox_cafe/screens/location-screen/functionality-user-location/user-location.dart';
import 'package:icebox_cafe/screens/location-screen/location_screen.dart';
import 'package:icebox_cafe/screens/menu-screen/menu_screen.dart';
import 'package:icebox_cafe/screens/register-info-screen/register_info_screen.dart';
import 'package:icebox_cafe/screens/register-screen/register_screen.dart';
import 'package:icebox_cafe/screens/sign-in-screen/signin_screen.dart';
import 'package:icebox_cafe/screens/verification-screen/verification_screen.dart';

import '../screens/splash-screen/splash_sceen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String signInRoute = '/signIn';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String verificationRoute = '/verification';
  static const String registerInfopRoute = '/registerInfo';
  static const String homeRoute = '/home';
  static const String locationRoute = '/location';
  static const String getlocationRoute = '/getLocation';
  static const String machineListRoute = '/machineList';
  static const String machineDetailRoute = '/machineDetail';
  static const String menuRoute = '/menu';
  static const String productDetailRoute = '/productDetail';
  static const String reviewOrderRoute = '/reviewOrder';
  static const String orderSucessRoute = '/orderSucess';
  static const String recentOrderRoute = '/recentOrder';
  static const String userAccountRoute = '/userAccount';
}

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.verificationRoute:
        return MaterialPageRoute(builder: (_) => OTPVerificationScreen());
      case Routes.registerInfopRoute:
        return MaterialPageRoute(builder: (_) => RegisterInfoScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.locationRoute:
        return MaterialPageRoute(builder: (_) => LocationScreen());
      case Routes.getlocationRoute:
        return MaterialPageRoute(builder: (_) => UserLocationScreen());
      case Routes.machineDetailRoute:
        return MaterialPageRoute(builder: (_) => ExploreSingleLocationScreen());
      case Routes.menuRoute:
        return MaterialPageRoute(builder: (_) => MenuScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("No Route Found"),
        ),
        body: Center(
          child: Text(
            "No Route Found",
            style: StyleManager().customTextStyle(
                15, ColorManager.textColorDark, FontWeight.w400),
          ),
        ),
      );
    });
  }
}
