import 'package:currency_exchanger/core/res/Fonts.dart';
import 'package:currency_exchanger/core/res/colors.dart';
import 'package:currency_exchanger/core/services/injection_container.dart';
import 'package:currency_exchanger/features/home/presentation/cubit/home_cubit.dart';
import 'package:currency_exchanger/features/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await dotenv.load(fileName: 'assets/.env');
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Currency Exchange',
        theme: ThemeData(
          fontFamily: Fonts.roboto,
          focusColor: AppColors.branded,
          splashFactory: NoSplash.splashFactory,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.branded),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
