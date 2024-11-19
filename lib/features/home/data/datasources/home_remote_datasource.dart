import 'package:currency_exchanger/core/errors/exceptions.dart';
import 'package:currency_exchanger/core/utils/typedefs.dart';
import 'package:currency_exchanger/features/home/data/model/current_exchange_model.dart';
import 'package:currency_exchanger/features/home/data/model/daily_exchange_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class HomeRemoteDataSource {
  Future<CurrentExchangeModel> getCurrentExchangeRate(
      {required String toSymbol});

  Future<DailyExchangeModel> getDailyExchangeRate({required String toSymbol});
}

const kGetCurrentExchangeRate = '/get/open/currentExchangeRate';
const kGetDailyExchangeRate = '/get/open/dailyExchangeRate';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  const HomeRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<CurrentExchangeModel> getCurrentExchangeRate({
    required String toSymbol,
  }) async {
    try {
      final response = await _client.get<DataMap>(
        kGetCurrentExchangeRate,
        queryParameters: {
          'apiKey': dotenv.env['API_KEY'],
          'from_symbol': 'BRL',
          'to_symbol': toSymbol,
        },
      );
      if (response.statusCode != 200 || response.statusCode != 201) {
        return CurrentExchangeModel.fromMap(response.data!);
      } else {
        throw APIException(
          message: response.statusMessage!,
          statusCode: response.statusCode!,
        );
      }
    } catch (e) {
      throw Exception('Failed to get current exchange rate: $e');
    }
  }

  @override
  Future<DailyExchangeModel> getDailyExchangeRate({
    required String toSymbol,
  }) async {
    try {
      final response = await _client.get<DataMap>(
        kGetDailyExchangeRate,
        queryParameters: {
          'apiKey': dotenv.env['API_KEY'],
          'from_symbol': 'BRL',
          'to_symbol': toSymbol,
        },
      );
      if (response.statusCode != 200 || response.statusCode != 201) {
        return DailyExchangeModel.fromMap(response.data!);
      } else {
        throw APIException(
          message: response.statusMessage!,
          statusCode: response.statusCode!,
        );
      }
    } catch (e) {
      throw Exception('Failed to get daily exchange rate: $e');
    }
  }
}
