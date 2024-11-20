import 'package:currency_exchanger/core/extension/context_extension.dart';
import 'package:currency_exchanger/core/theme/colors.dart';
import 'package:currency_exchanger/core/theme/media_res.dart';
import 'package:currency_exchanger/core/theme/text_styles.dart';
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
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
