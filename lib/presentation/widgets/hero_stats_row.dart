import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeroStatsRow extends StatelessWidget {
  const HeroStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        final isMobile =
            sizingInformation.screenSize.width < RefinedBreakpoints().tabletNormal;

        if (isMobile) {
          return Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 16,
            children: Data.heroStats
                .map((s) => _StatChip(
                      value: s.value,
                      label: s.label,
                      textTheme: textTheme,
                      compact: true,
                    ))
                .toList(),
          );
        }

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.darkCard.withOpacity(0.5),
            borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
            border: Border.all(color: AppColors.darkBorder),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < Data.heroStats.length; i++) ...[
                if (i > 0)
                  Container(
                    width: 1,
                    height: 36,
                    margin: const EdgeInsets.symmetric(horizontal: 28),
                    color: AppColors.darkBorder,
                  ),
                _StatChip(
                  value: Data.heroStats[i].value,
                  label: Data.heroStats[i].label,
                  textTheme: textTheme,
                  centered: true,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.value,
    required this.label,
    required this.textTheme,
    this.compact = false,
    this.centered = false,
  });

  final String value;
  final String label;
  final TextTheme textTheme;
  final bool compact;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: textTheme.headlineSmall?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w800,
            fontSize: compact ? 22 : 28,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: textTheme.bodySmall?.copyWith(
            color: AppColors.grey250,
            fontWeight: FontWeight.w500,
            fontSize: compact ? 12 : 13,
          ),
        ),
      ],
    );
  }
}
