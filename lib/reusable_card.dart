import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/main.dart';

class ReusableCard extends StatelessWidget {
  final Widget? child;
  final bool isActive;
  final void Function()? onTap;

  const ReusableCard({Key? key, this.child, this.onTap, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: child,
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: isActive ? CustomColors.activeCard : CustomColors.card,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
