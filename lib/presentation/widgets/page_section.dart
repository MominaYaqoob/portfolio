import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/values/values.dart';

/// Centers content with Saad-style max width.
class PageSection extends StatelessWidget {
  const PageSection({
    super.key,
    required this.child,
    this.backgroundColor,
    this.paddingVertical = 64,
    this.showTopGlow = false,
  });

  final Widget child;
  final Color? backgroundColor;
  final double paddingVertical;
  final bool showTopGlow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      child: Stack(
        children: [
          if (showTopGlow)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      AppColors.primaryColor.withOpacity(0.4),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getSidePadding(context),
              vertical: paddingVertical,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1140),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
