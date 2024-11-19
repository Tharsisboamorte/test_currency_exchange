import 'package:currency_exchanger/core/utils/typedefs.dart';
import 'package:currency_exchanger/features/home/domain/entities/current_exchange.dart';

class CurrentExchangeModel extends CurrentExchange {
  const CurrentExchangeModel({
    super.success,
    super.lastUpdatedAt,
    super.fromSymbol,
    super.toSymbol,
    super.exchangeRate,
  });

  const CurrentExchangeModel.empty()
  :this(
    success: true,
    lastUpdatedAt: '',
    fromSymbol: 'BRL',
    toSymbol: '',
    exchangeRate: 0,
  );

  CurrentExchangeModel.fromMap(DataMap json)
      : super(
          success: json['success'] as bool,
          lastUpdatedAt: json['lastUpdatedAt'] as String,
          fromSymbol: json['fromSymbol'] as String,
          toSymbol: json['toSymbol'] as String,
          exchangeRate: json['exchangeRate'] as double,
        );
}
