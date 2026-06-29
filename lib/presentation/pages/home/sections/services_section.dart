import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/page_section.dart';
import 'package:nimbus/presentation/widgets/section_header.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: StringConst.SERVICES_LABEL,
            title: StringConst.SERVICES_TITLE,
            subtitle: StringConst.SERVICES_DESC,
          ),
          SpaceH40(),
          ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, info) {
              final w = info.screenSize.width;
              int columns = 3;
              if (w < 700) {
                columns = 1;
              } else if (w < 1000) {
                columns = 2;
              }

              return LayoutBuilder(
                builder: (context, constraints) {
                  final spacing = 20.0;
                  final cardWidth =
                      (constraints.maxWidth - spacing * (columns - 1)) / columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: Data.servicesData.map((service) {
                      return SizedBox(
                        width: cardWidth,
                        child: _ServiceCard(data: service),
                      );
                    }).toList(),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  const _ServiceCard({required this.data});

  final ServiceCardData data;

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _hovering ? AppColors.darkCardHover : AppColors.darkCard,
          borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
          border: Border.all(
            color: _hovering ? AppColors.primaryColor.withOpacity(0.4) : AppColors.darkBorder,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.data.icon, color: AppColors.primaryColor, size: 28),
            SpaceH16(),
            Text(
              widget.data.title,
              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            SpaceH12(),
            Text(
              widget.data.description,
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.grey250,
                height: 1.65,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
