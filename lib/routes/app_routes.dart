import 'package:flutter/material.dart';
import 'package:varun_s_application20/presentation/one_screen/one_screen.dart';
import 'package:varun_s_application20/presentation/two_screen/two_screen.dart';
import 'package:varun_s_application20/presentation/thre_screen/thre_screen.dart';
import 'package:varun_s_application20/presentation/four_screen/four_screen.dart';
import 'package:varun_s_application20/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String oneScreen = '/one_screen';

  static const String twoScreen = '/two_screen';

  static const String threScreen = '/thre_screen';

  static const String fourScreen = '/four_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    oneScreen: (context) => OneScreen(),
    twoScreen: (context) => TwoScreen(),
    threScreen: (context) => ThreScreen(),
    fourScreen: (context) => FourScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
