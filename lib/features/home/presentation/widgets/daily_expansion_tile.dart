import 'package:currency_exchanger/core/extension/context_extension.dart';
import 'package:currency_exchanger/core/theme/colors.dart';
import 'package:currency_exchanger/core/theme/text_styles.dart';
import 'package:currency_exchanger/core/utils/app_strings.dart';
import 'package:currency_exchanger/core/utils/logger.dart';
import 'package:currency_exchanger/features/home/domain/entities/daily_exchange.dart';
import 'package:currency_exchanger/features/home/presentation/cubit/home_cubit.dart';
import 'package:currency_exchanger/features/home/presentation/widgets/daily_exchange_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyExchangeExpansionTile extends StatefulWidget {
  const DailyExchangeExpansionTile({
    required this.dailyExchangeData,
    super.key,
  });

  final DailyExchange dailyExchangeData;

  @override
  State<DailyExchangeExpansionTile> createState() =>
      _DailyExchangeExpansionTileState();
}

class _DailyExchangeExpansionTileState extends State<DailyExchangeExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _iconAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final dailyExchangeData =
        cubit.filterLast30Days(widget.dailyExchangeData.data!);

    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          child: ExpansionTile(
            title: Text(
              AppStrings.last30Days,
              style: AppTextStyles.paragraphDefaultBold.copyWith(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            trailing: RotationTransition(
              turns: _iconAnimation,
              child: Icon(
                _isExpanded ? Icons.remove : Icons.add,
                color: AppColors.branded,
              ),
            ),
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isExpanded = expanded;
                if (_isExpanded) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              });
            },
            iconColor: AppColors.branded,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  height: _isExpanded ? context.height * 5.45 : 0,
                  color: Colors.grey.withOpacity(0.1),
                  child: _isExpanded
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: dailyExchangeData.length,
                          itemBuilder: (BuildContext context, int index) {
                            logger.i(dailyExchangeData.length);
                            final indexedDailyData = dailyExchangeData[index];

                            return DailyExchangeCard(
                              date: cubit.formatDateToDaily(
                                indexedDailyData.date!,
                              ),
                              open: indexedDailyData.open!,
                              close: indexedDailyData.close!,
                              high: indexedDailyData.high!,
                              low: indexedDailyData.low!,
                              closeDiff: indexedDailyData.close!,
                            );
                          },
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 2,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
