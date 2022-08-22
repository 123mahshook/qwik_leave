import 'package:flutter/material.dart';
import 'package:qwikleave/screens/add_new_leave_screen/add_new_leave_screen.dart';
import 'package:qwikleave/screens/home_screen/home_screen.dart';
import 'package:qwikleave/screens/login_screen.dart/login_screen.dart';
import 'package:qwikleave/screens/my_stats_screen/my_stats_screen.dart';
import 'package:qwikleave/screens/splash_screen/splash_screen.dart';

class CommonNavigate {
  CommonNavigate({required this.parentContext});
  final BuildContext parentContext;
  navigateSplashScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const SplashScreen()));
  }

  navigateLoginScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  navigateHomeScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  navigateAddnewLeaveScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const AddNewLeaveScreen()));
  }

  navigateMyStatScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const MyStatsScreen()));
  }

  navigateServerError() {
    // ServerErrorDialog(parentContext: parentContext).show();
  }

  navigateNoInternet() {
    //NoInternetDialog(parentContext: parentContext).show();
  }
}
