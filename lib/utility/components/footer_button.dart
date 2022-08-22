import 'package:flutter/material.dart';
import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/font_utils.dart';
import 'package:qwikleave/utility/values/size_utils.dart';
import 'package:qwikleave/utility/values/utils.dart';

/*class FooterButton extends StatelessWidget {
  const FooterButton(
      {Key? key,
      required this.label,
      required this.onTap,
      this.height,
      this.width,
      this.color,
      this.secondLabel,
      this.child})
      : super(key: key);
  final String label;
  final void Function() onTap;
  final Color? color;
  final double? height;
  final double? width;
  final String? secondLabel;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    // bool isLoading = false
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (secondLabel != null)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeUtils.getWidth(20)),
                    child: Text(secondLabel!,
                        style: FontUtils.getFont10Style(
                            color: AppColors.silverColor)),
                  ),
                verticalSpace(10),
                Container(
                  color: AppColors.secondaryColor,
                  height: SizeUtils.getHeight(3),
                ),
              ]),
        ),
        SizedBox(
          width: width,
          height: height ?? SizeUtils.getHeight(55),
          child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.black,
                padding:
                    EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(30)),
                backgroundColor: color ?? AppColors.secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(SizeUtils.getRadius(5))))),
            onPressed: onTap,
            child: child ??
                Text(
                  label,
                  style: FontUtils.getFont15Style(
                      fontWeight: FontWeight.w700, color: AppColors.black),
                ),
          ),
        ),
      ],
    );
  }
}*/
class FooterButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color? color;

  const FooterButton(
      {Key? key, required this.label, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.getHeight(53),
      width: SizeUtils.getScreenWidth(),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shadowColor: AppColors.black,
              onPrimary: color ?? AppColors.black,
              elevation: 0,
              primary: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(24)),
              )),
          onPressed: onTap,
          child: Text(
            label,
            style: FontUtils.getFont18Style(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          )),
    );
  }
}
