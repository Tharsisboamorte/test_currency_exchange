import 'package:currency_exchanger/core/errors/failure.dart';
import 'package:result_dart/result_dart.dart';

typedef ResultFuture<T > = Future<Result<dynamic, APIFailure>>;

typedef DataMap = Map<String, dynamic>;

