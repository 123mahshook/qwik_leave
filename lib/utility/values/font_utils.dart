import 'package:flutter/material.dart';
import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/size_utils.dart';

class FontUtils {
  static TextStyle getFont8Style(
      {Color color = AppColors.white,
      double height = 1.5,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        height: height,
        color: color,
        fontSize: SizeUtils.getFont(8),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }

  static TextStyle getFont9Style(
      {Color color = AppColors.white,
      double height = 1.5,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        height: height,
        color: color,
        fontSize: SizeUtils.getFont(9),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }

  static TextStyle getFont10Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(10),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }

  static TextStyle getFont11Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(11),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }

  static TextStyle getFont12Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(12),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }

  static TextStyle getFont14Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(14),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }

  static TextStyle getFont15Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(15),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }

  static TextStyle getFont16Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w700,
      TextDecoration decoration = TextDecoration.none}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(16),
        fontFamily: "Poppins",
        fontWeight: fontWeight,
        decoration: decoration);
  }

  static TextStyle getFont18Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(18),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }

  static TextStyle getFont19Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(19),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }

  static TextStyle getFont20Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(20),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }

  static TextStyle getFont24Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w700,
      double height = 1.3}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(24),
        fontFamily: "Poppins",
        height: height,
        fontWeight: fontWeight);
  }

  static TextStyle getFont25Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w700}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(25),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }

  static TextStyle getFont36Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w600}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(36),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }

  static TextStyle getFont36HomeStyle(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w700}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(36),
        fontFamily: "Home Gold",
        fontWeight: fontWeight);
  }

  static TextStyle getFont48Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w100}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(48),
        fontFamily: "Poppins",
        fontWeight: fontWeight);
  }
}
