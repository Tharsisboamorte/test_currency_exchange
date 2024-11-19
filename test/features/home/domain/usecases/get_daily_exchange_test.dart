import 'package:currency_exchanger/features/home/data/model/daily_exchange_model.dart';
import 'package:currency_exchanger/features/home/domain/repositories/home_repository.dart';
import 'package:currency_exchanger/features/home/domain/usecases/get_daily_exchange.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import 'home_repository.mock.dart';

void main() {
  late GetDailyExchange dailyExchangeUseCase;
  late HomeRepository repository;

  setUp(() {
    repository = HomeMockRepo();
    dailyExchangeUseCase = GetDailyExchange(repository);
  });

  const testResponse = DailyExchangeModel.empty();

  test(
    'should call the [HomeRepository.getDailyExchange] and '
    'return [DailyExchange]',
    () async {
      when(
        () => repository.getDailyExchange(toSymbol: 'EUR'),
      ).thenAnswer((_) async => const Result.success(testResponse));

      final result = await dailyExchangeUseCase('EUR');

      expect(result, equals(const Result.success(testResponse)));
      verify(() => repository.getDailyExchange(toSymbol: 'EUR')).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
