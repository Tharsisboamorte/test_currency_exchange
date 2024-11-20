import 'package:currency_exchanger/core/res/Fonts.dart';
import 'package:currency_exchanger/core/res/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle tableHeader = TextStyle(
    fontFamily: Fonts.roboto,
    fontSize: 11,
    color: AppColors.neutralDark,
    fontWeight: FontWeight.w600,
    height: 14 / 11,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle paragraphDefaultBold = TextStyle(
    fontFamily: Fonts.roboto,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle paragraphMediumBold = TextStyle(
    fontFamily: Fonts.roboto,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 22 / 14,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle dashboardBigNumber = TextStyle(
    fontFamily: Fonts.roboto,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 40 / 32,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle paragraphLargeBold = TextStyle(
    fontFamily: Fonts.roboto,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 28 / 18,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle paragraphMedium = TextStyle(
    fontFamily: Fonts.roboto,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 22 / 14,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle titleAdminH1 = TextStyle(
    fontFamily: Fonts.roboto,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 30 / 24,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle buttonLarge = TextStyle(
    fontFamily: Fonts.roboto,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle inputLabel = TextStyle(
    fontFamily: Fonts.roboto,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle inputContent = TextStyle(
    fontFamily: Fonts.roboto,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    textBaseline: TextBaseline.alphabetic,
  );
}
