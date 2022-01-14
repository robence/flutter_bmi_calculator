import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants/custom_colors.dart';
import 'package:flutter_bmi_calculator/ui/bottom_button.dart';
import 'package:flutter_bmi_calculator/ui/reusable_card.dart';

class ResultPageArguments {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPageArguments({
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });
}

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  static const routeName = '/result';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ResultPageArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'.toUpperCase()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
            child: Text(
              "Your Result",
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          ReusableCard(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    args.resultText.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.resultGreen),
                  ),
                  Text(
                    args.bmiResult,
                    style: const TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    args.interpretation,
                    style: const TextStyle(fontSize: 24.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () => Navigator.pop(context),
            title: 'Re-Calculate',
          ),
        ],
      ),
    );
  }
}
