import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qwikleave/utility/common/common_navigate.dart';
import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/font_utils.dart';
import 'package:qwikleave/utility/values/scroll_behaviour.dart';
import 'package:qwikleave/utility/values/size_utils.dart';
import 'package:qwikleave/utility/values/utils.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  int selectedIndex = -1;
  List<String> icons = [
    "ic_d1",
    "ic_d2",
    "ic_d3",
    "ic_d4",
    "ic_d5",
    "ic_d6",
    "ic_d7",
    "ic_d8",
    "ic_d9",
    "ic_d10",
    "ic_d11",
    "ic_d12",
    "ic_d13",
    "ic_d14",
  ];
  List<String> title = [
    "Home",
    "Lead Management",
    "Task Managment",
    "Todo List",
    "My Stats",
    "Call Log",
    "Attendance",
    "Chat",
    "Products",
    "Estimates",
    "Invoice",
    "Customers",
    "Profile",
    "Logout",
  ];
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10.0,
        sigmaY: 10.0,
      ),
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehaviour(),
        child: Container(
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getWidth(268),
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.getHeight(20),
            vertical: SizeUtils.getHeight(20),
          ),
          child: Column(
            children: [
              verticalSpace(16),
              logoRow(),
              verticalSpace(20),
              Divider(
                color: AppColors.hintColor,
                thickness: 2,
              ),
              Column(
                children: List.generate(icons.length,
                    (index) => imageTile(index, icons[index], title[index])),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return SizedBox(
      height: SizeUtils.getHeight(48),
      width: SizeUtils.getHeight(48),
      child: SvgPicture.asset(
        Utils.getAssetSvg("ic_logo_home"),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget logoRow() {
    return Row(
      children: [
        logo(),
        horizontalSpace(14),
        Text(
          "LOGO",
          style: FontUtils.getFont25Style(
            color: AppColors.fontdesGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            Utils.getAssetSvg("ic_d_cross"),
            height: SizeUtils.getWidth(18),
          ),
        ),
      ],
    );
  }

  Widget imageTile(int index, String icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeUtils.getHeight(8)),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
          if (index == 4) {
            CommonNavigate(parentContext: context).navigateMyStatScreen();
          }
        },
        child: Row(
          children: [
            SvgPicture.asset(
              Utils.getAssetSvg(icon),
              color: selectedIndex == index
                  ? AppColors.primaryColor
                  : AppColors.hintColor,
              height: SizeUtils.getHeight(16),
            ),
            horizontalSpace(14),
            Text(
              title,
              style: FontUtils.getFont14Style(
                  color: selectedIndex == index
                      ? AppColors.primaryColor
                      : AppColors.hintColor,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
