import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
    }
  }

  IconData get icon {
    switch (this) {
      case Gender.male:
        return FontAwesomeIcons.mars;
      case Gender.female:
        return FontAwesomeIcons.venus;
    }
  }
}
