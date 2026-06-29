import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/page_section.dart';
import 'package:nimbus/presentation/widgets/section_header.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: StringConst.PROCESS_LABEL,
            title: StringConst.PROCESS_TITLE,
            subtitle: StringConst.PROCESS_DESC,
          ),
          SpaceH40(),
          ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, info) {
              final width = info.screenSize.width;
              final columns = width >= 1280
                  ? 6
                  : width >= 900
                      ? 3
                      : 1;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: columns == 1
                      ? 2.8
                      : columns == 3
                          ? 1.15
                          : 0.86,
                ),
                itemCount: Data.processSteps.length,
                itemBuilder: (context, index) {
                  final step = Data.processSteps[index];
                  return _ProcessCard(step: step);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProcessCard extends StatelessWidget {
  const _ProcessCard({required this.step});

  final ProcessStepData step;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            step.number,
            style: textTheme.headlineSmall?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          SpaceH12(),
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          SpaceH8(),
          Expanded(
            child: Text(
              step.description,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.grey250,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
