import 'package:equatable/equatable.dart';

class Data extends Equatable {
  const Data({
    this.open = 0.0,
    this.high = 0.0,
    this.low = 0.0,
    this.close = 0.0,
    this.date = '',
  });

  final double? open;
  final double? high;
  final double? low;
  final double? close;
  final String? date;

  @override
  List<Object?> get props => [
        open,
        high,
        low,
        close,
        date,
      ];
}
