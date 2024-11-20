import 'package:currency_exchanger/core/theme/text_styles.dart';
import 'package:currency_exchanger/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ExchangeRateNowWidget extends StatelessWidget {
  const ExchangeRateNowWidget({
    required this.fromSymbol,
    required this.toSymbol,
    required this.dateTime,
    required this.exchangeRate,
    required this.currencySymbol,
    super.key,
  });

  final String fromSymbol;
  final String toSymbol;
  final String dateTime;
  final String currencySymbol;
  final String exchangeRate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.exchangeRateNow,
              style: AppTextStyles.dateStyle.copyWith(color: Colors.black),
            ),
            Text(
              '$toSymbol/$fromSymbol',
              style: AppTextStyles.dateStyle,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          dateTime,
          style: AppTextStyles.valueStyle.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],
          ),
          child: Center(
            child: Text(
              '$currencySymbol $exchangeRate',
              style: AppTextStyles.exchangeRateStyle,
            ),
          ),
        ),
      ],
    );
  }
}
