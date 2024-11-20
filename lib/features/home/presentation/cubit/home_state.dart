part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class GettingCurrencyData extends HomeState {
  const GettingCurrencyData();
}

class CurrencyDataLoaded extends HomeState {
  const CurrencyDataLoaded(this.dailyExchanges, this.currentExchange);

  final DailyExchange dailyExchanges;
  final CurrentExchange currentExchange;

  @override
  List<Object> get props => [
        dailyExchanges,
        currentExchange,
      ];
}

class ErrorState extends HomeState {
  const ErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
