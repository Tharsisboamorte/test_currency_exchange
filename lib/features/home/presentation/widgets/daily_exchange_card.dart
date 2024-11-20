import 'package:currency_exchanger/core/theme/text_styles.dart';
import 'package:currency_exchanger/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class DailyExchangeCard extends StatelessWidget {
  const DailyExchangeCard({
    required this.date,
    required this.open,
    required this.close,
    required this.high,
    required this.low,
    required this.closeDiff,
    super.key,
  });

  final String date;
  final double open;
  final double close;
  final double high;
  final double low;
  final double closeDiff;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: AppTextStyles.dateStyle,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLabelValuePair(
                AppStrings.open,
                'R\$ ${open.toStringAsFixed(4)}',
              ),
              _buildLabelValuePair(
                AppStrings.high,
                'R\$ ${high.toStringAsFixed(4)}',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLabelValuePair(
                AppStrings.close,
                'R\$ ${close.toStringAsFixed(4)}',
              ),
              _buildLabelValuePair(
                AppStrings.low,
                'R\$ ${low.toStringAsFixed(4)}',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                AppStrings.closeDiff,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  Text(
                    closeDiff > 0
                        ? '+${closeDiff.toStringAsFixed(2)}%'
                        : '${closeDiff.toStringAsFixed(2)}%',
                    style: TextStyle(
                      color: closeDiff > 0 ? Colors.green : Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    closeDiff > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                    color: closeDiff > 0 ? Colors.green : Colors.red,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildLabelValuePair(String label, String value) {
  return Row(
    children: [
      Text(
        label,
        style: AppTextStyles.labelStyle,
      ),
      const SizedBox(width: 4),
      Text(
        value,
        style: AppTextStyles.valueStyle,
      ),
    ],
  );
}
