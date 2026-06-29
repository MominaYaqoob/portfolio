import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class DockItem {
  const DockItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;
}

class FloatingDockNav extends StatelessWidget {
  const FloatingDockNav({super.key, required this.items});

  final List<DockItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.darkCard.withOpacity(0.95),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.darkBorder),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.35),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Tooltip(
              message: item.label,
              child: GestureDetector(
                onTap: item.onTap,
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: item.isActive
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Icon(
                    item.icon,
                    size: 16,
                    color: item.isActive
                        ? AppColors.darkBackground
                        : AppColors.grey250,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

List<IconData> defaultDockIcons = const [
  Icons.home_outlined,
  Icons.person_outline,
  Icons.miscellaneous_services_outlined,
  Icons.work_outline,
  Icons.auto_graph_outlined,
  Icons.mail_outline,
];
