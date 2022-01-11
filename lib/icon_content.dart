import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/gender.dart';
import 'package:flutter_bmi_calculator/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconContent extends StatelessWidget {
  final Gender gender;

  const IconContent({Key? key, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              gender.icon,
              color: Colors.white,
              size: 80.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              gender.name.toUpperCase(),
              style: const TextStyle(color: CustomColors.font, fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
