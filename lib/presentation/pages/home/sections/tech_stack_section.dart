import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/page_section.dart';
import 'package:nimbus/presentation/widgets/section_header.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PageSection(
      backgroundColor: AppColors.darkSurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: StringConst.STACK_LABEL,
            title: StringConst.STACK_TITLE,
            subtitle: StringConst.STACK_DESC,
          ),
          SpaceH36(),
          ...Data.techStackCategories.map(
            (category) => Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title,
                    style: textTheme.titleSmall?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SpaceH12(),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: category.technologies
                        .map((tech) => _TechChip(label: tech))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  const _TechChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.offWhite,
            ),
      ),
    );
  }
}
