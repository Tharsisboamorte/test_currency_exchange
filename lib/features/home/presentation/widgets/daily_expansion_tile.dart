import 'package:currency_exchanger/core/theme/text_styles.dart';
import 'package:currency_exchanger/core/utils/app_strings.dart';
import 'package:currency_exchanger/features/home/presentation/widgets/daily_exchange_card.dart';
import 'package:flutter/material.dart';

class DailyExchangeExpansionTile extends StatefulWidget {
  const DailyExchangeExpansionTile({
    // required this.dailyExchangeInfo,
    super.key,
  });

  // final List<DailyExchange> dailyExchangeInfo;

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
      duration: const Duration(milliseconds: 500),
    );

    _iconAnimation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
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
              style: AppTextStyles.exchangeRateStyle.copyWith(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            trailing: RotationTransition(
              turns: _iconAnimation,
              child: Icon(
                _isExpanded ? Icons.remove : Icons.add,
                color: Colors.blue,
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
            iconColor: Colors.blue,
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut,
                height:
                    _isExpanded ? MediaQuery.of(context).size.height * 0.67 : 0,
                color: Colors.grey.withOpacity(0.1),
                child: _isExpanded
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return const DailyExchangeCard(
                            date: '07/03/2022',
                            open: 5.0666,
                            close: 5.0038,
                            high: 5.0689,
                            low: 4.9836,
                            closeDiff: 1.15,
                          );
                        },
                      )
                    : null,
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          color: Colors.blue,
        ),
      ],
    );
  }
}
