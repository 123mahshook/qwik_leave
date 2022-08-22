import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qwikleave/screens/home_screen/side_drawer.dart';
import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/custom_sliver_delegate.dart';
import 'package:qwikleave/utility/values/font_utils.dart';
import 'package:qwikleave/utility/values/scroll_behaviour.dart';
import 'package:qwikleave/utility/values/size_utils.dart';
import 'package:qwikleave/utility/values/utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyStatsScreen extends StatefulWidget {
  const MyStatsScreen({Key? key}) : super(key: key);

  @override
  State<MyStatsScreen> createState() => _MyStatsScreenState();
}

class _MyStatsScreenState extends State<MyStatsScreen> {
  final List<ChartData> chartData = [
    ChartData('used', 35, AppColors.splashgrad2Color),
    ChartData('unused', 65, AppColors.chartColor),
  ];

  List<ChartSampleData> chartDatabar = <ChartSampleData>[
    ChartSampleData('M', 50, AppColors.chartColor),
    ChartSampleData('T', 80, AppColors.splashgrad2Color),
    ChartSampleData('W', 35, AppColors.chartColor),
    ChartSampleData('T', 100, AppColors.splashgrad2Color),
    ChartSampleData('F', 50, AppColors.chartColor),
    ChartSampleData('S', 50, AppColors.chartColor),
    ChartSampleData('S', 50, AppColors.chartColor),
  ];

  List<ChartTestData> chartTestDt = <ChartTestData>[
    ChartTestData(1, 50, AppColors.chartColor),
    ChartTestData(2, 80, AppColors.splashgrad2Color),
    ChartTestData(3, 35, AppColors.chartColor),
    ChartTestData(4, 100, AppColors.splashgrad2Color),
    ChartTestData(5, 50, AppColors.chartColor),
    ChartTestData(6, 50, AppColors.chartColor),
    ChartTestData(7, 50, AppColors.chartColor),
  ];

  List<String> types = <String>["Weekly", "Monthly", "All Time"];
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            drawer: SideDrawer(),
            body: Container(
              height: SizeUtils.getScreenHeight(),
              width: SizeUtils.getScreenWidth(),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.splashgrad1Color,
                    AppColors.splashgrad2Color,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(children: [
                Align(alignment: Alignment.bottomCenter, child: sheetPack()),
                ScrollConfiguration(
                  behavior: NoGlowScrollBehaviour(),
                  child: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [
                          SliverOverlapAbsorber(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                            sliver: SliverSafeArea(
                              top: false,
                              bottom: false,
                              sliver: SliverPersistentHeader(
                                delegate: SliverAppBarDelegate(
                                    maxHeight: SizeUtils.getHeight(80),
                                    minHeight: SizeUtils.getHeight(80),
                                    child: appBar()),
                                pinned: true,
                              ),
                            ),
                          ),
                        ];
                      },
                      body: CustomScrollView(
                        slivers: [
                          SliverList(
                              delegate: SliverChildListDelegate([
                            chartSheet(),
                            verticalSpace(12),
                            arrivalCard(),
                            verticalSpace(12),
                            logList()
                          ]))
                        ],
                      )),
                ),
              ]),
            )));
  }

  Widget appBar() {
    return Builder(builder: (context) {
      return Container(
        height: SizeUtils.getHeight(62),
        width: SizeUtils.getScreenWidth(),
        // color: AppColors.homeGradcolor,
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
              "my Stats",
              style: FontUtils.getFont18Style(
                  color: AppColors.white, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
          ],
        ),
      );
    });
  }

  Widget sheetPack() {
    return Container(
      // constraints: BoxConstraints(minHeight: SizeUtils.getHeight(20)),
      height: SizeUtils.getHeight(490),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(20),
          vertical: SizeUtils.getHeight(16)),
      decoration: BoxDecoration(
          color: AppColors.bghomeColor.withOpacity(0.8),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                SizeUtils.getRadius(30),
              ),
              topRight: Radius.circular(SizeUtils.getRadius(30)))),
    );
  }

  Widget arrivalCard() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeUtils.getWidth(20),
        right: SizeUtils.getWidth(20),
      ),
      child: Container(
        height: SizeUtils.getHeight(94),
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.only(
          top: SizeUtils.getHeight(10),
          bottom: SizeUtils.getHeight(10),
          left: SizeUtils.getWidth(16),
          right: SizeUtils.getWidth(16),
        ),
        decoration: BoxDecoration(
            color: AppColors.homeTpinkColor,
            borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              //color: AppColors.WHITE,
              height: SizeUtils.getHeight(64),
              width: SizeUtils.getHeight(64),
              child: Stack(children: [
                Container(
                  height: SizeUtils.getHeight(64),
                  width: SizeUtils.getHeight(64),
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    backgroundColor: AppColors.white.withOpacity(0.6),
                    color: AppColors.indicaterColor,
                    value: 0.76,
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "76%",
                      style: FontUtils.getFont16Style(
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ))
              ]),
            ),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "On-Time Arrival",
                  maxLines: 1,
                  style: FontUtils.getFont16Style(
                      color: AppColors.white, fontWeight: FontWeight.w500),
                ),
                verticalSpace(4),
                SizedBox(
                  width: SizeUtils.getWidth(120),
                  child: Text(
                    "From Feb 20, 2020 to 15 Mar, 2020",
                    maxLines: 1,
                    style: FontUtils.getFont12Style(
                        color: AppColors.white, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget logList() {
    return Container(
      padding: EdgeInsets.only(
        left: SizeUtils.getWidth(20),
        right: SizeUtils.getWidth(20),
      ),
      width: SizeUtils.getScreenWidth(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            //months[index],
            "Recent Logs",
            style: FontUtils.getFont14Style(
                color: AppColors.listHeadColor, fontWeight: FontWeight.w400),
          ),
          verticalSpace(2),
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return logListTile(
                  index,
                );
              }),
          verticalSpace(30),
        ],
      ),
    );
  }

  Widget logListTile(
    int index,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeUtils.getHeight(14)),
      height: SizeUtils.getHeight(81),
      width: SizeUtils.getScreenWidth(),
      padding: EdgeInsets.only(
        top: SizeUtils.getHeight(10),
        bottom: SizeUtils.getHeight(10),
        left: SizeUtils.getWidth(16),
        right: SizeUtils.getWidth(16),
      ),
      decoration: BoxDecoration(
          color: AppColors.white,
          // border: Border.all(color: AppColors.bordergrey),
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Wednesday",
                maxLines: 1,
                style: FontUtils.getFont16Style(
                    color: AppColors.tilefontColor,
                    fontWeight: FontWeight.w400),
              ),
              verticalSpace(2),
              Text(
                "15 Mar 2020",
                maxLines: 1,
                style: FontUtils.getFont12Style(
                    color: AppColors.tilefontColor,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeUtils.getHeight(30),
                width: SizeUtils.getHeight(30),
                child: SfCircularChart(
                    margin: EdgeInsets.zero,
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                          dataSource: chartData,
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y)
                    ]),
              ),
              verticalSpace(2),
              Text(
                "3:52 Hrs",
                maxLines: 1,
                style: FontUtils.getFont10Style(
                    color: AppColors.tilefontColor,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget chartSheet() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeUtils.getWidth(20),
        right: SizeUtils.getWidth(20),
      ),
      child: Container(
        height: SizeUtils.getHeight(418),
        width: SizeUtils.getScreenWidth(),
        padding: EdgeInsets.only(
          top: SizeUtils.getHeight(20),
          bottom: SizeUtils.getHeight(20),
          left: SizeUtils.getWidth(10),
          right: SizeUtils.getWidth(10),
        ),
        decoration: BoxDecoration(
            color: AppColors.white,
            // border: Border.all(color: AppColors.bordergrey),
            borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Overall Performance",
                maxLines: 1,
                style: FontUtils.getFont18Style(
                    color: AppColors.fontcardColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            verticalSpace(2),
            Center(
              child: Text(
                "Jan 06 - Jan 12",
                maxLines: 1,
                style: FontUtils.getFont14Style(
                    color: AppColors.fontsubcardColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            verticalSpace(10),
            categoryList(),
            verticalSpace(24),
            Container(
              height: SizeUtils.getHeight(150),
              child: SfCartesianChart(
                /*series: <ChartSeries>[
                  // Renders bar chart
                  BarSeries<ChartTestData, double>(
                      dataSource: chartTestDt,
                      xValueMapper: (ChartTestData data, _) => data.x,
                      yValueMapper: (ChartTestData data, _) => data.y)
                ],*/
                series: <ColumnSeries<ChartTestData, double>>[
                  ColumnSeries<ChartTestData, double>(
                    // Binding the chartData to the dataSource of the column series.
                    dataSource: chartTestDt,
                    pointColorMapper: (ChartTestData data, _) => data.color,
                    xValueMapper: (ChartTestData sales, _) => sales.x,
                    yValueMapper: (ChartTestData sales, _) => sales.y,
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(15)),
                  ),
                ],
              ),
            ),
            verticalSpace(2),
            Divider(),
            verticalSpace(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Complete View",
                        maxLines: 1,
                        style: FontUtils.getFont16Style(
                            color: AppColors.tilefontColor,
                            fontWeight: FontWeight.w400),
                      ),
                      verticalSpace(2),
                      Text(
                        "View your complete view for leaves",
                        maxLines: 1,
                        style: FontUtils.getFont12Style(
                            color: AppColors.tilefontColor,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: SizeUtils.getHeight(29),
                      width: SizeUtils.getHeight(29),
                      padding: EdgeInsets.all(SizeUtils.getHeight(8)),
                      decoration: BoxDecoration(
                          color: AppColors.arrowBgColor,
                          borderRadius:
                              BorderRadius.circular(SizeUtils.getRadius(4))),
                      child: SvgPicture.asset(
                        Utils.getAssetSvg("ic_rightarrow"),
                        height: SizeUtils.getHeight(12),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryList() {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: SizeUtils.getHeight(40),
      width: SizeUtils.getScreenWidth(),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(4), vertical: SizeUtils.getHeight(4)),
      decoration: BoxDecoration(
          color: AppColors.listBgColor,
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            types.length,
            (index) => AnimatedContainer(
                  clipBehavior: Clip.antiAlias,
                  duration: const Duration(milliseconds: 10),
                  height: SizeUtils.getHeight(40),
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeUtils.getWidth(20),
                      vertical: SizeUtils.getHeight(7)),
                  decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? AppColors.white
                          : AppColors.transparent,
                      borderRadius:
                          BorderRadius.circular(SizeUtils.getRadius(30))),
                  child: InkWell(
                    focusColor: AppColors.white,
                    hoverColor: AppColors.white,
                    splashColor: AppColors.white,
                    highlightColor: AppColors.white,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Text(
                      types[index],
                      style: FontUtils.getFont12Style(
                          fontWeight: FontWeight.w500, color: AppColors.black),
                    ),
                  ),
                )),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class ChartSampleData {
  ChartSampleData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class ChartTestData {
  ChartTestData(this.x, this.y, this.color);
  final double x;
  final double y;
  final Color color;
}
