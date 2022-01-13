import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants/custom_colors.dart';

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
