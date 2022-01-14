import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants/custom_colors.dart';
import 'package:flutter_bmi_calculator/constants/font_styles.dart';
import 'package:flutter_bmi_calculator/controller/calculator_controller.dart';
import 'package:flutter_bmi_calculator/model/gender.dart';
import 'package:flutter_bmi_calculator/pages/result_page.dart';
import 'package:flutter_bmi_calculator/ui/bottom_button.dart';
import 'package:flutter_bmi_calculator/ui/icon_content.dart';
import 'package:flutter_bmi_calculator/ui/reusable_card.dart';
import 'package:flutter_bmi_calculator/ui/round_icon_button.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 80;
  int age = 18;

  void selectGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void changeWeight(int amount) {
    setState(() {
      weight += amount;
    });
  }

  void changeAge(int amount) {
    setState(() {
      age += amount;
    });
  }

  bool isGenderActive(Gender gender) => selectedGender == gender;

  @override
  Widget build(BuildContext context) {
    CalculatorController calc;
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  isActive: Gender.male == selectedGender,
                  onTap: () => selectGender(Gender.male),
                  child: const IconContent(gender: Gender.male),
                ),
                ReusableCard(
                  isActive: Gender.female == selectedGender,
                  onTap: () => selectGender(Gender.female),
                  child: const IconContent(gender: Gender.female),
                ),
              ],
            ),
          ),
          ReusableCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height'.toUpperCase(),
                  style: FontStyles.label,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: FontStyles.number),
                    const Text(
                      'cm',
                      style: FontStyles.label,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    // activeTrackColor: Colors.white,
                    activeTrackColor: CustomColors.button,
                    inactiveTrackColor: CustomColors.font,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 16.0),
                    thumbColor: CustomColors.button,
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 32.0),
                    overlayColor: CustomColors.button.withAlpha(0x29),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight'.toUpperCase(),
                        style: FontStyles.label,
                      ),
                      Text(weight.toString(), style: FontStyles.number),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: Icons.remove,
                            onChange: () => changeWeight(-1),
                          ),
                          const SizedBox(width: 16.0),
                          RoundIconButton(
                            icon: Icons.add,
                            onChange: () => changeWeight(1),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ReusableCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age'.toUpperCase(),
                        style: FontStyles.label,
                      ),
                      Text(age.toString(), style: FontStyles.number),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: Icons.remove,
                            onChange: () => changeAge(-1),
                          ),
                          const SizedBox(width: 16.0),
                          RoundIconButton(
                            icon: Icons.add,
                            onChange: () => changeAge(1),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () => {
              calc = CalculatorController(height: height, weight: weight),
              Navigator.pushNamed(
                context,
                '/result',
                arguments: ResultPageArguments(
                  bmiResult: calc.calculateBMI(),
                  interpretation: calc.interpretation,
                  resultText: calc.result,
                ),
              ),
            },
            title: 'Calculate',
          ),
        ],
      ),
    );
  }
}
