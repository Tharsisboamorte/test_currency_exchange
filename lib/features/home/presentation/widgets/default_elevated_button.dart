import 'package:currency_exchanger/core/theme/text_styles.dart';
import 'package:currency_exchanger/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({
    required this.currencyController,
    super.key,
  });

  final TextEditingController currencyController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // final currencyCode = currencyController.text.trim().toUpperCase();

        // if (!validCurrencyCodes.contains(currencyCode)) {
        //
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text('$currencyCode is not a valid currency code!'),
        //       backgroundColor: Colors.red,
        //     ),
        //   );
        // }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        AppStrings.exchangeResult,
        style: AppTextStyles.labelStyle.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
