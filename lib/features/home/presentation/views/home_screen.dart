import 'package:currency_exchanger/features/home/presentation/widgets/daily_expansion_tile.dart';
import 'package:currency_exchanger/features/home/presentation/widgets/exchange_rate_now_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              ExchangeRateNowWidget(
                currencySymbol: r'R$',
                fromSymbol: 'BRL',
                toSymbol: 'USD',
                dateTime: '09/03/2022 - 15h09',
                exchangeRate: '5,00',
              ),
              DailyExchangeExpansionTile(),
            ],
          ),
        ),
      ),
    );
  }
}
