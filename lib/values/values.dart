import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/presentation/widgets/app_icon.dart';
import 'package:nimbus/presentation/widgets/buttons/social_button.dart';
import 'package:nimbus/presentation/widgets/project_item.dart';
import 'package:nimbus/presentation/widgets/project_preview.dart';

part 'colors.dart';
part 'borders.dart';
part 'images.dart';
part 'sizes.dart';
part 'strings.dart';
part 'styles.dart';
part 'data.dart';
part 'gradients.dart';
part 'decoration.dart';
part 'shadows.dart';
part 'radius.dart';

class WorkExperienceData {
  final String company;
  final String position;
  final String duration;
  final List<String> responsibilities;
  final IconData icon;

  WorkExperienceData({
    required this.company,
    required this.position,
    required this.duration,
    required this.responsibilities,
    required this.icon,
  });
}

class HeroStatData {
  final String value;
  final String label;

  HeroStatData({required this.value, required this.label});
}

class ServiceCardData {
  final String title;
  final String description;
  final IconData icon;

  ServiceCardData({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class TechCategoryData {
  final String title;
  final List<String> technologies;

  TechCategoryData({required this.title, required this.technologies});
}

class ProcessStepData {
  final String number;
  final String title;
  final String description;

  ProcessStepData({
    required this.number,
    required this.title,
    required this.description,
  });
}
