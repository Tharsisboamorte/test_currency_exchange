import 'package:equatable/equatable.dart';

class CurrentExchange extends Equatable {
  const CurrentExchange({
    this.success = false,
    this.lastUpdatedAt = '',
    this.fromSymbol = 'BRL',
    this.toSymbol = '',
    this.exchangeRate = 0.0,
  });

  final bool? success;
  final String? lastUpdatedAt;
  final String? fromSymbol;
  final String? toSymbol;
  final double? exchangeRate;

  @override
  List<Object?> get props => [
        success,
        lastUpdatedAt,
        fromSymbol,
        toSymbol,
        exchangeRate,
      ];

}
