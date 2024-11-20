import 'package:currency_exchanger/core/services/logging_interceptor.dart';
import 'package:currency_exchanger/core/utils/constants.dart';
import 'package:currency_exchanger/features/home/data/datasources/home_remote_datasource.dart';
import 'package:currency_exchanger/features/home/data/repositories/home_repository_impl.dart';
import 'package:currency_exchanger/features/home/domain/repositories/home_repository.dart';
import 'package:currency_exchanger/features/home/domain/usecases/get_current_exchange.dart';
import 'package:currency_exchanger/features/home/domain/usecases/get_daily_exchange.dart';
import 'package:currency_exchanger/features/home/presentation/cubit/home_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl

    //Data Sources
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(sl<Dio>()),
    )

    //Repositories
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()))

    //App Logic
    ..registerFactory(
      () => HomeCubit(
        getCurrentExchange: sl(),
        getDailyExchange: sl(),
      ),
    )

    //UseCases
    ..registerLazySingleton(() => GetCurrentExchange(sl()))
    ..registerLazySingleton(() => GetDailyExchange(sl()))

    //external dependencies
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
