import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants/custom_colors.dart';
import 'package:flutter_bmi_calculator/pages/input_page.dart';
import 'package:flutter_bmi_calculator/pages/result_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: CustomColors.background,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: CustomColors.background,
      ),
      routes: {
        '/': (context) => const InputPage(),
        ResultPage.routeName: (context) => const ResultPage(),
      },
      initialRoute: '/',
    );
  }
}
