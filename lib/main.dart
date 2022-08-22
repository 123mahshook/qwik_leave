import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qwikleave/screens/splash_screen/splash_screen.dart';
import 'package:qwikleave/utility/values/app_colors.dart';

import 'providers/customer_details_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.splashgrad1Color,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      builder: (BuildContext context, Widget? child) {
        return ChangeNotifierProvider(
          create: (context) => CustomerDetailsProvider(),
          child: MaterialApp(
            title: 'Qwik Leave',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
