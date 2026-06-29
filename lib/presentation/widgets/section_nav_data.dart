import 'package:flutter/material.dart';

class SectionNavData {
  SectionNavData({
    required this.name,
    required this.key,
    this.isSelected = false,
  });

  final String name;
  final GlobalKey key;
  bool isSelected;
}
