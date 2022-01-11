import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/icon_text.dart';
import 'package:flutter_bmi_calculator/main.dart';
import 'package:flutter_bmi_calculator/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatelessWidget {
  const InputPage({Key? key}) : super(key: key);

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
                children: const [
                  ReusableCard(
                    child:
                        IconContent(title: 'Male', icon: FontAwesomeIcons.mars),
                  ),
                  ReusableCard(
                    child: IconContent(
                        title: 'Female', icon: FontAwesomeIcons.venus),
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
