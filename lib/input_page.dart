import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants/custom_colors.dart';
import 'package:flutter_bmi_calculator/constants/font_styles.dart';
import 'package:flutter_bmi_calculator/gender.dart';
import 'package:flutter_bmi_calculator/icon_content.dart';
import 'package:flutter_bmi_calculator/reusable_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 182;

  void selectGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  bool isGenderActive(Gender gender) => selectedGender == gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: SafeArea(
        child: Column(
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
                      Text(
                        height.toString(),
                        style: const TextStyle(
                            fontSize: 48.0, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'cm',
                        style: FontStyles.label,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
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
                children: const [
                  ReusableCard(),
                  ReusableCard(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              color: CustomColors.button,
              height: 80.0,
            )
          ],
        ),
      ),
    );
  }
}
