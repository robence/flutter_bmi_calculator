import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants/custom_colors.dart';

mixin FontStyles {
  static const label = TextStyle(color: CustomColors.font, fontSize: 18.0);
  static const number = TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold);
  static const button = TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500);
}
