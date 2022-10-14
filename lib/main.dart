import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/route_manager.dart';
import 'package:icebox_cafe/resources/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: ColorManager.primaryColor,

    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
    // status bar color
  ));
  // SystemChrome.setEnabledSystemUIMode(overlays:{
  //   SystemUiOverlayStyle().
  // } )
  runApp(IceboxCafeApp());
}

class IceboxCafeApp extends StatelessWidget {
  const IceboxCafeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManger().applicationTheme(),
      onGenerateRoute: RouteGenerator.getRoutes,
      initialRoute: Routes.splashRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
