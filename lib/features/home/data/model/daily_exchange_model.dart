import 'package:currency_exchanger/core/utils/typedefs.dart';
import 'package:currency_exchanger/features/home/data/model/data_model.dart';
import 'package:currency_exchanger/features/home/domain/entities/daily_exchange.dart';

class DailyExchangeModel extends DailyExchange {
  const DailyExchangeModel({
    super.success,
    super.from,
    super.to,
    super.lastUpdatedAt,
    super.data,
  });

  const DailyExchangeModel.empty()
      :this(
    success: true,
    lastUpdatedAt: '',
    from: 'BRL',
    to: '',
    data: const [],
  );

  DailyExchangeModel.fromMap(DataMap json)
      : super(
          success: json['success'] as bool,
          from: json['from'] as String,
          to: json['to'] as String,
          lastUpdatedAt: json['lastUpdatedAt'] as String,
          data: (json['data'] as List<dynamic>?)
              ?.map((item) => DataModel.fromJson(item as Map<String, dynamic>))
              .toList(),
        );
}
