import 'package:currency_exchanger/core/usecases/usecase.dart';
import 'package:currency_exchanger/core/utils/typedefs.dart';
import 'package:currency_exchanger/features/home/domain/entities/daily_exchange.dart';
import 'package:currency_exchanger/features/home/domain/repositories/home_repository.dart';

class GetDailyExchange extends UseCaseWithParams<DailyExchange, String> {
  const GetDailyExchange(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  ResultFuture<DailyExchange> call(String params) async =>
      _homeRepository.getDailyExchange(toSymbol: params);
}
