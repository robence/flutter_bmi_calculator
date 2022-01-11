import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/gender.dart';
import 'package:flutter_bmi_calculator/icon_content.dart';
import 'package:flutter_bmi_calculator/main.dart';
import 'package:flutter_bmi_calculator/reusable_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

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
            const ReusableCard(),
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
