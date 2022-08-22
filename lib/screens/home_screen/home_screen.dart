import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qwikleave/screens/home_screen/side_drawer.dart';
import 'package:qwikleave/utility/common/common_navigate.dart';
import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/custom_sliver_delegate.dart';
import 'package:qwikleave/utility/values/font_utils.dart';
import 'package:qwikleave/utility/values/scroll_behaviour.dart';
import 'package:qwikleave/utility/values/size_utils.dart';
import 'package:qwikleave/utility/values/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        drawer: SideDrawer(),
        //drawerScrimColor: AppColors.white.withOpacity(0),
        floatingActionButton: customFAB(),
        body: Container(
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          decoration: BoxDecoration(
              /* gradient: const LinearGradient(
                colors: [
                  AppColors.splashgrad1Color,
                  AppColors.splashgrad2Color,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),*/
              image: DecorationImage(
                  image: AssetImage(Utils.getAssetPng("bg_all")),
                  fit: BoxFit.cover)),
          child: ScrollConfiguration(
            behavior: NoGlowScrollBehaviour(),
            child: CustomScrollView(
              physics: ClampingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: SizeUtils.getHeight(80),
                    maxHeight: SizeUtils.getHeight(80),
                    child: appBar(),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: false,
                  delegate: SliverAppBarDelegate(
                    minHeight: SizeUtils.getHeight(0),
                    maxHeight: SizeUtils.getHeight(150),
                    child: title(),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: SizeUtils.getHeight(25),
                    maxHeight: SizeUtils.getHeight(25),
                    child: containerTop(),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    leaveCard(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customFAB() {
    return Padding(
      padding: EdgeInsets.only(
          bottom: SizeUtils.getHeight(20), right: SizeUtils.getHeight(30)),
      child: SizedBox(
        height: SizeUtils.getHeight(60),
        width: SizeUtils.getHeight(60),
        child: FloatingActionButton(
          elevation: 4,
          backgroundColor: AppColors.fabColor,
          onPressed: () {
            CommonNavigate(parentContext: context).navigateAddnewLeaveScreen();
          },
          child: SvgPicture.asset(
            Utils.getAssetSvg("ic_plus"),
            height: SizeUtils.getHeight(24),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Builder(builder: (context) {
      return Container(
        height: SizeUtils.getHeight(62),
        width: SizeUtils.getScreenWidth(),
        color: AppColors.homeGradcolor,
        padding: EdgeInsets.only(
            left: SizeUtils.getWidth(20),
            right: SizeUtils.getWidth(20),
            bottom: SizeUtils.getHeight(16),
            top: SizeUtils.getHeight(20)),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: SvgPicture.asset(
                Utils.getAssetSvg("ic_drawer"),
                height: SizeUtils.getHeight(12),
              ),
            ),
            horizontalSpace(20),
            Text(
              "Home",
              style: FontUtils.getFont18Style(
                  color: AppColors.white, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                Utils.getAssetSvg("ic_notification"),
                height: SizeUtils.getHeight(18),
              ),
            ),
          ],
        ),
      );
    });
  }

  //Title and description
  Widget title() {
    return SingleChildScrollView(
      child: Container(
        height: SizeUtils.getHeight(150),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.homeGradcolor,
              AppColors.splashgrad2Color,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning, Kevin Durand",
              style: FontUtils.getFont14Style(
                  color: AppColors.white, fontWeight: FontWeight.w500),
            ),
            verticalSpace(14),
            Text(
              "Leave Dashboard",
              style: FontUtils.getFont24Style(
                  color: AppColors.white, fontWeight: FontWeight.w600),
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "4 Leave ",
                  style: FontUtils.getFont12Style(
                      color: AppColors.white, fontWeight: FontWeight.w500),
                ),
                Text(
                  "12 Leaves",
                  style: FontUtils.getFont12Style(
                      color: AppColors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            verticalSpace(2),
            statusBar(35.8),
          ],
        ),
      ),
    );
  }

  Widget statusBar(double value) {
    return SizedBox(
      height: SizeUtils.getHeight(7),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: SizeUtils.getScreenWidth(),
            height: SizeUtils.getHeight(5),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(4))),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: SizeUtils.getWidth(100),
              height: SizeUtils.getHeight(6),
              decoration: BoxDecoration(
                  color: AppColors.homePinkColor,
                  borderRadius: BorderRadius.circular(SizeUtils.getRadius(4))),
            ),
          )
        ],
      ),
    );
  }

  Widget containerTop() {
    return Stack(children: [
      Container(
        color: AppColors.splashgrad2Color,
      ),
      Container(
        height: SizeUtils.getHeight(25),
        width: SizeUtils.getScreenWidth(),
        padding: EdgeInsets.only(top: SizeUtils.getHeight(34)),
        decoration: BoxDecoration(
          color: AppColors.bghomeColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeUtils.getRadius(30)),
            topRight: Radius.circular(SizeUtils.getRadius(30)),
          ),
        ),
      )
    ]);
  }

  Widget leaveCard() {
    return Container(
        width: SizeUtils.getScreenWidth(),
        //padding: EdgeInsets.only(top: SizeUtils.getHeight(24)),
        padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(20)),
        decoration: const BoxDecoration(
          color: AppColors.bghomeColor,
        ),
        child: leaveList());
  }

  Widget leaveList() {
    return ListView.builder(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return leaveListTile(
            index,
          );
        });
  }

  Widget leaveListTile(
    int index,
  ) {
    return Container(
      width: SizeUtils.getScreenWidth(),
      margin: EdgeInsets.only(bottom: SizeUtils.getHeight(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            //months[index],
            "Yesterday",
            style: FontUtils.getFont14Style(
                color: AppColors.fontColor, fontWeight: FontWeight.w500),
          ),
          verticalSpace(12),
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return listTile(
                  index,
                );
              }),
          verticalSpace(30),
        ],
      ),
    );
  }

  Widget listTile(
    int index,
  ) {
    return Container(
      height: SizeUtils.getHeight(200),
      width: SizeUtils.getScreenWidth(),
      padding: EdgeInsets.only(
        top: SizeUtils.getHeight(16),
        bottom: SizeUtils.getHeight(16),
        left: SizeUtils.getWidth(16),
      ),
      decoration: BoxDecoration(
          color: AppColors.white,
          // border: Border.all(color: AppColors.bordergrey),
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          iconTileWithSatus(
              "ic_calander",
              AppColors.homeTCalendaColor,
              "Applied Duration",
              "12 Oct, 2019  to  15 Oct, 2019",
              "Pending",
              AppColors.homePendingColor),
          verticalSpace(8),
          iconTile("ic_reson", AppColors.homeTResonColor, "Reason",
              "Having fever from last night"),
          verticalSpace(8),
          iconTile("ic_leaveType", AppColors.homePinkColor, "Type of Leave",
              "Sick Leave"),
          verticalSpace(8),
        ],
      ),
    );
  }

  Widget iconTile(String icon, Color clr, String title, String subtext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: SizeUtils.getHeight(24),
          width: SizeUtils.getHeight(24),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: clr.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            Utils.getAssetSvg(icon),
            height: SizeUtils.getHeight(12),
          ),
        ),
        horizontalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: FontUtils.getFont11Style(
                color: AppColors.black,
              ),
            ),
            verticalSpace(4),
            Text(
              subtext,
              style: FontUtils.getFont14Style(
                color: AppColors.homefontColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget iconTileWithSatus(String icon, Color clr, String title, String subtext,
      String status, Color sclr) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeUtils.getHeight(24),
                width: SizeUtils.getHeight(24),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: clr.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  Utils.getAssetSvg(icon),
                  height: SizeUtils.getHeight(12),
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      style: FontUtils.getFont11Style(
                        color: AppColors.black,
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      subtext,
                      maxLines: 1,
                      style: FontUtils.getFont14Style(
                        color: AppColors.homefontColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: SizeUtils.getWidth(75),
          height: SizeUtils.getHeight(23),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: sclr,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    SizeUtils.getRadius(12),
                  ),
                  bottomLeft: Radius.circular(
                    SizeUtils.getRadius(12),
                  ))),
          child: Text(
            status,
            style: FontUtils.getFont10Style(
              color: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
