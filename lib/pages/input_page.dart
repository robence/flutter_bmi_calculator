import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants/custom_colors.dart';
import 'package:flutter_bmi_calculator/constants/font_styles.dart';
import 'package:flutter_bmi_calculator/model/gender.dart';
import 'package:flutter_bmi_calculator/ui/icon_content.dart';
import 'package:flutter_bmi_calculator/ui/reusable_card.dart';

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
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/result'),
            child: Container(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Center(
                child: Text(
                  'Calculate'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: FontStyles.button,
                ),
              ),
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              color: CustomColors.button,
              height: 80.0,
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onChange;
  const RoundIconButton({Key? key, required this.icon, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      shape: const CircleBorder(),
      constraints: const BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      fillColor: CustomColors.greyButtonBackground,
      child: Icon(icon, color: Colors.white),
      onPressed: onChange,
    );
  }
}
