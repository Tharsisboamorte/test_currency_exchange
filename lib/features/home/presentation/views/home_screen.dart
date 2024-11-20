import 'package:currency_exchanger/core/extension/context_extension.dart';
import 'package:currency_exchanger/core/res/colors.dart';
import 'package:currency_exchanger/features/home/presentation/cubit/home_cubit.dart';
import 'package:currency_exchanger/features/home/presentation/widgets/app_title_view.dart';
import 'package:currency_exchanger/features/home/presentation/widgets/currency_text_field.dart';
import 'package:currency_exchanger/features/home/presentation/widgets/default_elevated_button.dart';
import 'package:currency_exchanger/features/home/presentation/widgets/exchange_rates_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: <Widget>[
                  const AppTitleView(),
                  SizedBox(height: context.height * .030),
                  CurrencyTextField(
                    currencyController: cubit.currencyTextController,
                  ),
                  SizedBox(height: context.height * .032),
                  DefaultElevatedButton(
                    currencyController: cubit.currencyTextController,
                    onPressedButton: () {
                      final isCurrencyValid = context
                          .read<HomeCubit>()
                          .isCurrencyValid(cubit.currencyTextController.text);

                      if (isCurrencyValid == true) {
                        cubit.getCurrencyExchange(
                          cubit.currencyTextController.text.toUpperCase(),
                        );
                      }
                    },
                  ),
                  if (state is CurrencyDataLoaded)
                    ExchangeRatesView(
                      currentExchangeData: state.currentExchange,
                      dailyExchangeData: state.dailyExchanges,
                    )
                  else
                    state is GettingCurrencyData
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: CircularProgressIndicator(
                              color: AppColors.branded,
                            ),
                          )
                        : const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
