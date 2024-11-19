import 'package:currency_exchanger/features/home/data/model/current_exchange_model.dart';
import 'package:currency_exchanger/features/home/domain/repositories/home_repository.dart';
import 'package:currency_exchanger/features/home/domain/usecases/get_current_exchange.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import 'home_repository.mock.dart';

void main() {
  late GetCurrentExchange currentExchangeUseCase;
  late HomeRepository repository;

  setUp(() {
    repository = HomeMockRepo();
    currentExchangeUseCase = GetCurrentExchange(repository);
  });

  const testResponse = CurrentExchangeModel.empty();

  test(
    'should call the [HomeRepository.getCurrentExchange] and '
        'return [CurrentExchange]',
        () async {
      when(
            () => repository.getCurrentExchange(toSymbol: 'EUR'),
      ).thenAnswer((_) async => const Result.success(testResponse));

      final result = await currentExchangeUseCase('EUR');

      expect(result, equals(const Result.success(testResponse)));
      verify(() => repository.getCurrentExchange(toSymbol: 'EUR')).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
