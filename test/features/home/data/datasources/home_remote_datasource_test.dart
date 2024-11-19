import 'package:currency_exchanger/core/errors/exceptions.dart';
import 'package:currency_exchanger/core/utils/typedefs.dart';
import 'package:currency_exchanger/features/home/data/datasources/home_remote_datasource.dart';
import 'package:currency_exchanger/features/home/data/model/current_exchange_model.dart';
import 'package:currency_exchanger/features/home/data/model/daily_exchange_model.dart';
import 'package:currency_exchanger/features/home/data/model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements Dio {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Dio client;
  late HomeRemoteDataSource homeRemoteDataSource;

  setUp(() async {
    dotenv.testLoad(
      mergeWith: {
        'API_KEY': 'mocked_api_key',
      },
    );
    client = MockClient();
    homeRemoteDataSource = HomeRemoteDataSourceImpl(client);
    registerFallbackValue(RequestOptions());
    registerFallbackValue(<DataMap>{});
  });
  group(
    'GetCurrentExchange',
    () {
      const testResponseJson = {
        'success': true,
        'lastUpdatedAt': '2024-11-19T15:15:00.000+00:00',
        'fromSymbol': 'BRL',
        'toSymbol': 'EUR',
        'exchangeRate': 0.16363,
      };

      const expectedModel = CurrentExchangeModel(
        success: true,
        lastUpdatedAt: '2024-11-19T15:15:00.000+00:00',
        fromSymbol: 'BRL',
        toSymbol: 'EUR',
        exchangeRate: 0.16363,
      );

      test(
        'should complete successfully when the status code is 200 or 201'
        ' and Return [CurrentExchangeModel]',
        () async {
          final apiKey = dotenv.env['API_KEY'];
          when(
            () => client.get<DataMap>(
              any(),
              queryParameters: any(named: 'queryParameters'),
            ),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(path: 'open/currentExchangeRate'),
              statusCode: 200,
              data: testResponseJson,
            ),
          );

          final result = await homeRemoteDataSource.getCurrentExchangeRate(
            toSymbol: 'EUR',
          );

          expect(apiKey, equals('mocked_api_key'));
          expect(result, equals(expectedModel));
          verify(
            () => client.get<DataMap>(
              any(),
              queryParameters: any(named: 'queryParameters'),
            ),
          ).called(1);
        },
      );
      test(
        'should throw [APIException] when the status code is not 200 or 201',
        () {
          when(
            () => client.get<DataMap>(
              any(),
              queryParameters: any(named: 'queryParameters'),
            ),
          ).thenThrow(
            DioException(
              response: Response<DataMap>(
                requestOptions:
                    RequestOptions(path: 'open/currentExchangeRate'),
                statusCode: 400,
                statusMessage: 'Bad Request',
              ),
              requestOptions: RequestOptions(path: 'open/currentExchangeRate'),
            ),
          );

          expect(
            () => homeRemoteDataSource.getCurrentExchangeRate(toSymbol: 'EUR'),
            throwsA(isA<APIException>()),
          );
        },
      );
    },
  );
  group(
    'GetDailyExchange',
    () {
      const testJson = {
        'success': true,
        'from': 'BRL',
        'to': 'USD',
        'lastUpdatedAt': '2024-11-19T15:15:00.000+00:00',
        'data': [
          {
            'open': 5.0,
            'high': 5.5,
            'low': 4.8,
            'close': 5.2,
            'date': '2024-11-18',
          },
        ],
      };

      const expectedModel = DailyExchangeModel(
        success: true,
        lastUpdatedAt: '2024-11-19T15:15:00.000+00:00',
        from: 'BRL',
        to: 'USD',
        data: [
          DataModel(
            open: 5.0,
            high: 5.5,
            low: 4.8,
            close: 5.2,
            date: '2024-11-18',
          ),
        ],
      );

      test(
        'should complete successfully when the status code is 200 or 201 '
        'and Return [DailyExchangeModel]',
        () async {
          final apiKey = dotenv.env['API_KEY'];

          when(
            () => client.get<DataMap>(
              any(),
              queryParameters: any(named: 'queryParameters'),
            ),
          ).thenAnswer(
            (_) async => Response<DataMap>(
              requestOptions: RequestOptions(path: 'open/dailyExchangeRate'),
              statusCode: 200,
              data: testJson,
            ),
          );

          final result = await homeRemoteDataSource.getDailyExchangeRate(
            toSymbol: 'USD',
          );

          expect(apiKey, equals('mocked_api_key'));
          expect(result, equals(expectedModel));

          verify(
            () => client.get<DataMap>(
              any(),
              queryParameters: any(named: 'queryParameters'),
            ),
          ).called(1);
        },
      );
      test(
        'should throw [APIException] when the status code is not 200 or 201',
        () {
          when(
            () => client.get<DataMap>(
              any(),
              queryParameters: any(named: 'queryParameters'),
            ),
          ).thenThrow(
            DioException(
              response: Response<DataMap>(
                requestOptions: RequestOptions(path: 'open/dailyExchangeRate'),
                statusCode: 400,
                statusMessage: 'Bad Request',
              ),
              requestOptions: RequestOptions(path: 'open/dailyExchangeRate'),
            ),
          );

          expect(
            () => homeRemoteDataSource.getDailyExchangeRate(toSymbol: 'USD'),
            throwsA(isA<APIException>()),
          );
        },
      );
    },
  );
}
