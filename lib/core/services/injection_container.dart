import 'package:currency_exchanger/core/services/logging_interceptor.dart';
import 'package:currency_exchanger/core/utils/constants.dart';
import 'package:currency_exchanger/features/home/data/datasources/home_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl

    //Data Sources
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(sl<Dio>()),
    )

    //HTTP REQUESTS
    ..registerLazySingleton<Dio>(() {
      final dio = Dio(
        BaseOptions(
          baseUrl: ApiConfig.BASE_URL,
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 3000),
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      dio.interceptors.addAll([
        LoggingInterceptor(),
      ]);

      return dio;
    });

}
