import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/size_utils.dart';
import 'package:qwikleave/utility/values/utils.dart';

class CustomCircularLoader extends StatefulWidget {
  const CustomCircularLoader({
    Key? key,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);
  final Color? color;
  final double? height;
  final double? width;

  @override
  State<CustomCircularLoader> createState() => _CustomCircularLoaderState();
}

class _CustomCircularLoaderState extends State<CustomCircularLoader>
    with SingleTickerProviderStateMixin {
  final double screenHeight = SizeUtils.getScreenHeight();
  final double screenWidth = SizeUtils.getScreenWidth();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return /*RotationTransition(
      turns: _animation,
      child:*/
        SizedBox(
      height: widget.height ?? SizeUtils.getHeight(80),
      width: widget.height ?? screenHeight * .03,
      child: Lottie.asset(Utils.getAssetLottie("loading"))
      /*CircularProgressIndicator(
          strokeWidth: widget.width ?? 4,
          value: .5,
          valueColor:
              AlwaysStoppedAnimation(widget.color ?? AppColors.primaryColor),
        )*/
      ,
      //),
    );
  }
}