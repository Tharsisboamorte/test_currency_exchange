import 'package:currency_exchanger/core/extension/context_extension.dart';
import 'package:currency_exchanger/core/res/colors.dart';
import 'package:currency_exchanger/features/home/domain/entities/current_exchange.dart';
import 'package:currency_exchanger/features/home/domain/entities/daily_exchange.dart';
import 'package:currency_exchanger/features/home/presentation/cubit/home_cubit.dart';
import 'package:currency_exchanger/features/home/presentation/widgets/daily_expansion_tile.dart';
import 'package:currency_exchanger/features/home/presentation/widgets/exchange_rate_now_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeRatesView extends StatefulWidget {
  const ExchangeRatesView({
    required this.dailyExchangeData,
    required this.currentExchangeData,
    super.key,
  });

  final DailyExchange dailyExchangeData;
  final CurrentExchange currentExchangeData;

  @override
  State<ExchangeRatesView> createState() => _ExchangeRatesViewState();
}

class _ExchangeRatesViewState extends State<ExchangeRatesView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * .030),
        const Divider(
          color: AppColors.offWhite,
          thickness: 1,
        ),
        ExchangeRateNowWidget(
          fromSymbol: 'BRL',
          toSymbol: widget.currentExchangeData.toSymbol!,
          dateTime: context
              .read<HomeCubit>()
              .formatDateToCurrent(widget.currentExchangeData.lastUpdatedAt!),
          exchangeRate: widget.currentExchangeData.exchangeRate!,
        ),
        DailyExchangeExpansionTile(
          dailyExchangeData: widget.dailyExchangeData,
        ),
      ],
    );
  }
}
