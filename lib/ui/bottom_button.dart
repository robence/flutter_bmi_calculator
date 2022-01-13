import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants/custom_colors.dart';
import 'package:flutter_bmi_calculator/constants/font_styles.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const BottomButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Center(
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: FontStyles.button,
          ),
        ),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        color: CustomColors.button,
        height: 80.0,
      ),
    );
  }
}
