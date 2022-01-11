import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconText extends StatelessWidget {
  final String title;
  final IconData icon;
  const IconText({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: Colors.white,
            size: 80.0,
          ),
          const SizedBox(height: 16.0),
          Text(
            title,
            style: const TextStyle(color: CustomColors.font, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
