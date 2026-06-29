import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Supports both Material [IconData] and Font Awesome [FaIconData] icons.
sealed class AppIconData {
  const AppIconData();

  const factory AppIconData.material(IconData icon) = MaterialAppIconData;
  const factory AppIconData.fa(FaIconData icon) = FontAwesomeAppIconData;
}

final class MaterialAppIconData extends AppIconData {
  const MaterialAppIconData(this.icon);
  final IconData icon;
}

final class FontAwesomeAppIconData extends AppIconData {
  const FontAwesomeAppIconData(this.icon);
  final FaIconData icon;
}

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.data, {
    super.key,
    this.size,
    this.color,
  });

  final AppIconData data;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return switch (data) {
      MaterialAppIconData(:final icon) => Icon(icon, size: size, color: color),
      FontAwesomeAppIconData(:final icon) =>
        FaIcon(icon, size: size, color: color),
    };
  }
}
