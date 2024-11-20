import 'package:currency_exchanger/core/theme/text_styles.dart';
import 'package:currency_exchanger/core/utils/app_strings.dart';
import 'package:currency_exchanger/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeRateNowWidget extends StatelessWidget {
  const ExchangeRateNowWidget({
    required this.fromSymbol,
    required this.toSymbol,
    required this.dateTime,
    required this.exchangeRate,
    super.key,
  });

  final String fromSymbol;
  final String toSymbol;
  final String dateTime;
  final double exchangeRate;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.exchangeRateNow,
                  style: AppTextStyles.paragraphLargeBold.copyWith(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(
                  dateTime,
                  style: AppTextStyles.paragraphMedium.copyWith(
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
            Text(
              '$toSymbol/$fromSymbol',
              style: AppTextStyles.titleAdminH1.copyWith(fontSize: 24),
            ),
          ],
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
              'R\$ ${cubit.formatCurrentCurrency(exchangeRate)}',
              style: AppTextStyles.dashboardBigNumber,
            ),
          ),
        ),
      ],
    );
  }
}
