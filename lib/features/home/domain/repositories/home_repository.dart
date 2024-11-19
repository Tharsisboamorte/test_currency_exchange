import 'package:currency_exchanger/core/utils/typedefs.dart';
import 'package:currency_exchanger/features/home/domain/entities/current_exchange.dart';
import 'package:currency_exchanger/features/home/domain/entities/daily_exchange.dart';

abstract class HomeRepository {
  const HomeRepository();

  ResultFuture<CurrentExchange> getCurrentExchange({required String toSymbol});

  ResultFuture<DailyExchange> getDailyExchange({required String toSymbol});
}
