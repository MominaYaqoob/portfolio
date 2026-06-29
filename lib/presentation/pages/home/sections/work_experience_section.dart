import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/page_section.dart';
import 'package:nimbus/presentation/widgets/section_header.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PageSection(
      backgroundColor: AppColors.darkSurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: StringConst.EXPERIENCE_LABEL,
            title: StringConst.EXPERIENCE_TITLE,
          ),
          SpaceH36(),
          ...Data.workExperienceData.map(
            (exp) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _ExperienceCard(experience: exp, textTheme: textTheme),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({
    required this.experience,
    required this.textTheme,
  });

  final WorkExperienceData experience;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                  border: Border.all(color: AppColors.primaryColor.withOpacity(0.3)),
                ),
                child: Icon(experience.icon, color: AppColors.primaryColor, size: 22),
              ),
              SpaceW16(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience.position,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      experience.company,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      experience.duration,
                      style: textTheme.bodySmall?.copyWith(color: AppColors.grey250),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SpaceH20(),
          ...experience.responsibilities.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('•  ', style: TextStyle(color: AppColors.primaryColor)),
                  Expanded(
                    child: Text(
                      item,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey250,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SpaceH12(),
          Wrap(
            spacing: 8,
            children: const [
              _TagChip('Flutter'),
              _TagChip('Firebase'),
              _TagChip('REST APIs'),
              _TagChip('UI/UX'),
            ],
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.primaryColor,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
