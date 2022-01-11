import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/main.dart';

class ReusableCard extends StatelessWidget {
  final Widget? child;
  const ReusableCard({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: child,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: CustomColors.card,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
