import 'package:currency_exchanger/core/res/colors.dart';
import 'package:currency_exchanger/core/res/text_styles.dart';
import 'package:currency_exchanger/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({
    required this.currencyController,
    this.onPressedButton,
    super.key,
  });

  final TextEditingController currencyController;
  final void Function()? onPressedButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressedButton,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.branded,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          AppStrings.exchangeResult,
          style: AppTextStyles.buttonLarge.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
