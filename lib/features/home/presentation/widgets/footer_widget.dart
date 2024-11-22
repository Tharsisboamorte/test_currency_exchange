import 'package:currency_exchanger/core/extension/context_extension.dart';
import 'package:currency_exchanger/core/res/colors.dart';
import 'package:currency_exchanger/core/res/text_styles.dart';
import 'package:currency_exchanger/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * .035,
      color: AppColors.branded,
      alignment: Alignment.center,
      child: const Text(
        AppStrings.copyRights,
        style: AppTextStyles.tablePagination,
      ),
    );
  }
}
