import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/contact_links.dart';
import 'package:nimbus/presentation/widgets/page_section.dart';
import 'package:nimbus/presentation/widgets/section_header.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PageSection(
      backgroundColor: AppColors.darkSurface,
      paddingVertical: 80,
      child: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, info) {
          final isMobile = info.screenSize.width < 980;

          return Column(
            children: [
              if (isMobile)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(
                      label: StringConst.CONTACT_LABEL,
                      title: StringConst.LETS_TALK,
                      subtitle: StringConst.CONTACT_DESC,
                    ),
                    SpaceH30(),
                    ...ContactLinks.items.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ContactLinkTile(item: item),
                      ),
                    ),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: SectionHeader(
                        label: StringConst.CONTACT_LABEL,
                        title: StringConst.LETS_TALK,
                        subtitle: StringConst.CONTACT_DESC,
                      ),
                    ),
                    SpaceW40(),
                    Expanded(
                      child: Column(
                        children: ContactLinks.items
                            .map(
                              (item) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ContactLinkTile(item: item),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              SpaceH40(),
              NimbusButton(
                width: 220,
                height: 52,
                buttonTitle: StringConst.HIRE_ME,
                buttonColor: AppColors.primaryColor,
                titleColor: AppColors.darkBackground,
                opensUrl: true,
                url: StringConst.MAILTO_SCHEME,
                borderRadius:
                    const BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
              ),
              SpaceH60(),
              Divider(color: AppColors.darkBorder),
              SpaceH24(),
              Text(
                '${StringConst.NAME_ABBREV} · Building mobile experiences',
                style: textTheme.bodySmall?.copyWith(color: AppColors.grey250),
              ),
              SpaceH8(),
              Text(
                StringConst.RIGHTS_RESERVED,
                style: textTheme.bodySmall?.copyWith(color: AppColors.grey300),
              ),
              SpaceH4(),
              Text(
                StringConst.DESIGNED_BY,
                style: textTheme.bodySmall?.copyWith(color: AppColors.grey300),
              ),
            ],
          );
        },
      ),
    );
  }
}
