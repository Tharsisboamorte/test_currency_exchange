import 'package:currency_exchanger/features/home/domain/entities/data.dart';
import 'package:equatable/equatable.dart';

class DailyExchange extends Equatable {
  const DailyExchange({
    this.success = false,
    this.from = 'BRL',
    this.to = '',
    this.lastUpdatedAt = '',
    this.data = const [],
  });

  final bool? success;
  final String? from;
  final String? to;
  final String? lastUpdatedAt;
  final List<Data>? data;

  @override
  List<Object?> get props => [
        success,
        from,
        to,
        lastUpdatedAt,
        data,
      ];
}
