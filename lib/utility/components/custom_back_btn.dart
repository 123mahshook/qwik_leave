import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/size_utils.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({Key? key, this.onTap, this.isWhite = false})
      : super(key: key);
  final Function()? onTap;
  final bool isWhite;

  final Size btnSize = Size(SizeUtils.getHeight(25), SizeUtils.getHeight(25));
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: SizeUtils.getHeight(20),
      width: SizeUtils.getHeight(20),
      child: TextButton(
        style: TextButton.styleFrom(
            alignment: Alignment.center,
            primary: AppColors.primaryColor,
            shape: const CircleBorder(),
            padding: EdgeInsetsDirectional.only(start: SizeUtils.getWidth(5)),
            backgroundColor: AppColors.transparent,
            fixedSize: btnSize,
            tapTargetSize: MaterialTapTargetSize.padded,
            minimumSize: btnSize,
            maximumSize: btnSize),
        onPressed: onTap ??
            () {
              Navigator.pop(context);
            },
        child: Icon(
          Icons.arrow_back_ios,
          color: isWhite ? AppColors.black : AppColors.white,
          size: SizeUtils.getHeight(20),
        ),
      ),
    );
  }
}
