import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/size_utils.dart';
import 'package:qwikleave/utility/values/utils.dart';

import '../../utility/common/common_navigate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatetoLoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: SizeUtils.getScreenHeight(),
            width: SizeUtils.getScreenWidth(),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppColors.splashgrad1Color,
                    AppColors.splashgrad2Color,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                image: DecorationImage(
                    image: AssetImage(Utils.getAssetPng("splash_bg")),
                    fit: BoxFit.cover)),
            child: logo()),
      ),
    );
  }

  Widget logo() {
    return Center(
      child: SizedBox(
        height: SizeUtils.getHeight(104),
        child: SvgPicture.asset(
          Utils.getAssetSvg("logo"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  navigatetoLoginScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    CommonNavigate(parentContext: context).navigateLoginScreen();
  }
}
