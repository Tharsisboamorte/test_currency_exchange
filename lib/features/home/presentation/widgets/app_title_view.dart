import 'package:currency_exchanger/core/extension/context_extension.dart';
import 'package:currency_exchanger/core/res/colors.dart';
import 'package:currency_exchanger/core/res/media_res.dart';
import 'package:currency_exchanger/core/res/text_styles.dart';
import 'package:currency_exchanger/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTitleView extends StatelessWidget {
  const AppTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height * .016,
        ),
        SvgPicture.asset(MediaRes.titleSVG),
        SizedBox(
          height: context.height * .016,
        ),
        const Divider(
          thickness: 2,
          color: AppColors.offWhite,
        ),
        SizedBox(height: context.height * .032),
        Text(
          AppStrings.appTitle,
          style: AppTextStyles.paragraphMedium.copyWith(
            color: AppColors.branded,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
