import 'package:currency_exchanger/features/home/data/datasources/home_remote_datasource.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements dio.Dio {}

void main() {
  late dio.Dio client;
  late HomeRemoteDataSource homeRemoteDataSource;

  setUp(() {
    client = MockClient();
    homeRemoteDataSource = HomeRemoteDataSourceImpl(client);
    registerFallbackValue(Uri());
  });

  group(
    'GetCurrentExchange',
    () {
      test(
        'should complete successfully when the status code is 200 or 201',
        () {},
      );
      test(
        'should throw [APIException] when the status code is not 200 or 201',
        () {},
      );
    },
  );
  group(
    'GetDailyExchange',
    () {
      test(
        'should complete successfully when the status code is 200 or 201',
        () {},
      );
      test(
        'should throw [APIException] when the status code is not 200 or 201',
        () {},
      );
    },
  );
}
