import 'package:currency_exchanger/core/theme/text_styles.dart';
import 'package:currency_exchanger/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CurrencyTextField extends StatelessWidget {
  const CurrencyTextField({
    required this.currencyController,
    super.key,
  });

  final TextEditingController currencyController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: currencyController,
      decoration: InputDecoration(
        labelText: AppStrings.currencyCode,
        labelStyle: AppTextStyles.labelStyle.copyWith(color: Colors.blue),
        border: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      style: AppTextStyles.valueStyle.copyWith(fontSize: 18),
    );
  }
}
