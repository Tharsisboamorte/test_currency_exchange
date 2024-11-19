import 'package:currency_exchanger/core/utils/typedefs.dart';
import 'package:currency_exchanger/features/home/domain/entities/data.dart';

class DataModel extends Data {
  const DataModel({
    super.open,
    super.high,
    super.low,
    super.close,
    super.date,
  });

  DataModel.fromJson(DataMap json)
      : super(
          open: json['open'] as double,
          high: json['high'] as double,
          low: json['low'] as double,
          close: json['close'] as double,
          date: json['date'] as String,
        );
}
