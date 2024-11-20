import 'package:currency_exchanger/core/utils/logger.dart';
import 'package:currency_exchanger/features/home/domain/entities/current_exchange.dart';
import 'package:currency_exchanger/features/home/domain/entities/daily_exchange.dart';
import 'package:currency_exchanger/features/home/domain/entities/data.dart';
import 'package:currency_exchanger/features/home/domain/usecases/get_current_exchange.dart';
import 'package:currency_exchanger/features/home/domain/usecases/get_daily_exchange.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sealed_currencies/sealed_currencies.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetCurrentExchange getCurrentExchange,
    required GetDailyExchange getDailyExchange,
  })  : _dailyExchange = getDailyExchange,
        _currentExchange = getCurrentExchange,
        super(const HomeInitial());

  final GetCurrentExchange _currentExchange;
  final GetDailyExchange _dailyExchange;

  final TextEditingController currencyTextController = TextEditingController();

  Future<void> getCurrencyExchange(String toSymbol) async {
    emit(const GettingCurrencyData());

    final currentExchangeResult = await _currentExchange(toSymbol);
    final dailyExchangeResult = await _dailyExchange(toSymbol);

    currentExchangeResult.fold(
      (currentExchange) {
        logger.i(currentExchange);
        dailyExchangeResult.fold(
          (dailyExchange) {
            logger.i(dailyExchange);
            emit(
              CurrencyDataLoaded(
                dailyExchange as DailyExchange,
                currentExchange as CurrentExchange,
              ),
            );
          },
          (failedResult) => emit(
            ErrorState(failedResult.message),
          ),
        );
      },
      (failure) => emit(
        ErrorState(failure.message),
      ),
    );
  }

  List<Data> filterLast30Days(List<Data> dataList) {
    final now = DateTime.now();
    final thirtyDaysAgo = now.subtract(const Duration(days: 30));

    return dataList.where((data) {
      final dataDate = DateTime.parse(data.date!);
      return dataDate.isAfter(thirtyDaysAgo) && dataDate.isBefore(now);
    }).toList();
  }

  String formatDateToDaily(String date) {
    final parsedDate = DateTime.parse(date);
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(parsedDate);
  }

  String formatDateToCurrent(String date) {
    final parsedDate = DateTime.parse(date);
    final formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(parsedDate);
  }

  String formatCurrentCurrency(double value) {
    final formatter = NumberFormat('#,##0.00', 'pt_BR');
    return formatter.format(value);
  }

  bool isCurrencyValid(String input) {
    final exists = FiatCurrency.list.any(
      (currency) => currency.code == input.toUpperCase(),
    );
    if (exists == false) {
      emit(const ErrorState('Invalid currency code.'));
    }
    return exists;
  }
}
