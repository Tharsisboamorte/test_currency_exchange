import 'package:currency_exchanger/core/utils/typedefs.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class HomeRemoteDataSource {
  Future<DataMap> getCurrentExchangeRate({required String toSymbol});

  Future<DataMap> getDailyExchangeRate({required String toSymbol});
}

const kGetCurrentExchangeRate = '/get/open/currentExchangeRate';
const kGetDailyExchangeRate = '/get/open/dailyExchangeRate';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  const HomeRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<DataMap> getCurrentExchangeRate({required String toSymbol}) async {
    try {
      final response = await _client.get<DataMap>(
        kGetCurrentExchangeRate,
        queryParameters: {
          'apiKey': dotenv.env['API_KEY'],
          'from_symbol': 'BRL',
          'to_symbol': toSymbol,
        },
      );
      return response.data!;
    } catch (e) {
      throw Exception('Failed to get current exchange rate: $e');
    }
  }

  @override
  Future<DataMap> getDailyExchangeRate({required String toSymbol}) async {
    try {
      final response = await _client.get<DataMap>(
        kGetDailyExchangeRate,
        queryParameters: {
          'apiKey': dotenv.env['API_KEY'],
          'from_symbol': 'BRL',
          'to_symbol': toSymbol,
        },
      );
      return response.data!;
    } catch (e) {
      throw Exception('Failed to get daily exchange rate: $e');
    }
  }
}
