import 'package:currency_exchanger/core/errors/exceptions.dart';
import 'package:currency_exchanger/core/errors/failure.dart';
import 'package:currency_exchanger/core/utils/typedefs.dart';
import 'package:currency_exchanger/features/home/data/datasources/home_remote_datasource.dart';
import 'package:currency_exchanger/features/home/domain/entities/current_exchange.dart';
import 'package:currency_exchanger/features/home/domain/entities/daily_exchange.dart';
import 'package:currency_exchanger/features/home/domain/repositories/home_repository.dart';
import 'package:result_dart/result_dart.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._homeRemoteDataSource);

  final HomeRemoteDataSource _homeRemoteDataSource;

  @override
  ResultFuture<CurrentExchange> getCurrentExchange({
    required String toSymbol,
  }) async {
    try {
      final result = await _homeRemoteDataSource.getCurrentExchangeRate(
        toSymbol: toSymbol,
      );
      return Result.success(result);
    } on APIException catch (e) {
      return Result.failure(
        APIFailure.fromException(e),
      );
    }
  }

  @override
  ResultFuture<DailyExchange> getDailyExchange({
    required String toSymbol,
  }) async {
    try {
      final result = await _homeRemoteDataSource.getDailyExchangeRate(
        toSymbol: toSymbol,
      );
      return Result.success(result);
    } on APIException catch (e) {
      return Result.failure(
        APIFailure.fromException(e),
      );
    }
  }
}
