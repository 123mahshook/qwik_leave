import 'package:flutter/material.dart';
import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/font_utils.dart';
import 'package:qwikleave/utility/values/size_utils.dart';

class CustomizedFooterButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color? color;

  const CustomizedFooterButton(
      {Key? key, required this.label, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(24)),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.splashgrad1Color,
                AppColors.splashgrad2Color,
              ])),
      child: SizedBox(
        height: SizeUtils.getHeight(53),
        width: SizeUtils.getScreenWidth(),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shadowColor: AppColors.black,
                onPrimary: color ?? AppColors.black,
                elevation: 0,
                primary: AppColors.transparent,
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
      ),
    );
  }
}
