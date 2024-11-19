import 'package:currency_exchanger/core/usecases/usecase.dart';
import 'package:currency_exchanger/core/utils/typedefs.dart';
import 'package:currency_exchanger/features/home/domain/entities/current_exchange.dart';
import 'package:currency_exchanger/features/home/domain/repositories/home_repository.dart';

class GetCurrentExchange extends UseCaseWithParams<CurrentExchange, String> {
  const GetCurrentExchange(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  ResultFuture<CurrentExchange> call(String params) async =>
      _homeRepository.getCurrentExchange(toSymbol: params);
}
