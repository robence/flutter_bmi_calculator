import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

mixin CustomColors {
  static const background = Color(0xFF0a0e21);
  static const button = Color(0xFFEB1555);
  static const tile = Color(0xFF1D1E33);
  static const font = Color(0xFF8D8E98);
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const InputPage(),
    );
  }
}
